package com.eeit147.groupfive.recipe.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.FoodsDao;
import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.KeywordDao;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeDto;
import com.eeit147.groupfive.recipe.model.RecipeFoods;
import com.eeit147.groupfive.recipe.model.RecipeFoodsDao;
import com.eeit147.groupfive.recipe.model.RecipeKeyword;
import com.eeit147.groupfive.recipe.model.RecipeKeywordDao;
import com.eeit147.groupfive.recipe.model.RecipeKeywordDto;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;
import com.eeit147.groupfive.users.model.FavoriteDao;
import com.eeit147.groupfive.users.model.Posts;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Service
@Transactional
public class RecipeService {
	@Autowired
	private RecipeDao rDao;

	@Autowired
	private FoodsDao fDao;

	@Autowired
	private UsersDao uDao;

	@Autowired
	private KeywordDao kDao;

	@Autowired
	private RecipeFoodsDao rfDao;

	@Autowired
	private RecipeKeywordDao rkDao;
	
	@Autowired
	private FavoriteDao frDao;
	
	@Autowired
	private RecipeStepDao rsDao;
	
	@Autowired
	private KeywordService kService;
	
	//新增食譜
	public Recipe addRecipe(Integer userId,
							Recipe recipe, 
							MultipartFile photo, 
							String[] foods, 
							Double[] gram,
							String[] tags, 
							String[] stepDescript, 
							MultipartFile[] stepPhoto) { // 步驟相片

		// 取得user
		Optional<Users> optional = uDao.findById(userId);
		Users user = optional.get();

		// 食譜
		recipe.setUsers(user);
		Recipe newRecipe = rDao.save(recipe);

		Integer recipeId = newRecipe.getRecipeId();

		// -------------------圖片處理-------------------------

		if (!photo.isEmpty()) {
			try {
				photo.transferTo(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe" + recipeId + ".jpeg"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				InputStream fis = new FileInputStream(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\food.png"));
				OutputStream fos = new FileOutputStream(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe" + recipeId + ".jpeg"));
				fos.write(fis.readAllBytes());
				fos.flush();
				fos.close();
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// --------------------------------------------------

		// -------------------食材關聯-------------------------
		Set<RecipeFoods> recipeFoodsSet = new LinkedHashSet<RecipeFoods>();
		Integer totalCal = 0;
		Foods food = new Foods();

		for (int i = 0; i < foods.length; i++) {
			// 取得食材庫裡的食材
			food = fDao.findByFoodsName(foods[i]);
			// 新增進食材表(克數、食材、對應食譜)
			recipeFoodsSet.add(new RecipeFoods(gram[i], food, newRecipe));
			// 計算卡路里
			totalCal += (int) (gram[i] * (double) food.getCalorie() / 100);
		}
		// ---------------------------------------------------

		// -------------------關鍵字關聯-------------------------
		Set<RecipeKeyword> keywordSet = new LinkedHashSet<RecipeKeyword>();

		for (int i = 0; i < tags.length; i++) {
			// 新增關鍵字至tag表
			keywordSet.add(new RecipeKeyword(newRecipe, kDao.findByKeyword(tags[i])));
		}
		// ---------------------------------------------------

		// --------------------步驟關聯--------------------------
		List<RecipeStep> stepList = new LinkedList<RecipeStep>();
		for (int i = 0; i < stepDescript.length; i++) {
			//新增步驟至步驟表
			RecipeStep rStep = new RecipeStep();
			rStep.setStep(i + 1);
			rStep.setStepDescription(stepDescript[i]);
			rStep.setStepPhoto("recipe" + recipeId + "_" + (i + 1) + ".jpeg");
			rStep.setRecipe(newRecipe);
			//存步驟圖片
			//判斷傳入檔案是否為空值
			if (!stepPhoto[i].isEmpty()) {
				try {
					stepPhoto[i]
							.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"
									+ recipeId + "_" + (i + 1) + ".jpeg"));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				try {
					InputStream fis = new FileInputStream(new File(
							"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\food.png"));
					OutputStream fos = new FileOutputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"
							+ recipeId + "_" + (i + 1) + ".jpeg"));
					fos.write(fis.readAllBytes());
					fos.flush();
					fos.close();
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			//放入步驟Set
			stepList.add(rStep);
		}

		// ---------------------------------------------------

		
		// 做關聯+新增總卡路里到食譜
		newRecipe.setCookPhoto("recipe" + newRecipe.getRecipeId() + ".jpeg");// 圖片標題
		newRecipe.setRecipeFoods(recipeFoodsSet);
		newRecipe.setTotalCal(totalCal);
		newRecipe.setRecipeKeyword(keywordSet);
		newRecipe.setRecipeStep(stepList);
		rDao.save(newRecipe);

		//步驟排序
		Collections.sort(newRecipe.getRecipeStep(), new Comparator<RecipeStep>() {
		    @Override
		    public int compare(RecipeStep o1, RecipeStep o2) {
		    return o1.getStep() - o2.getStep();
		  }
		});
		
		return newRecipe;
	}

	//修改食譜
	public Recipe updateRecipe(Recipe oldrecipe,
							 MultipartFile photo,
							 String[] foods,
							 Double[] gram,
							 String[] tags,
							 String[] stepDescript,
							 MultipartFile[] stepPhoto) {
		
		//取得recipe資料
		Optional<Recipe> op = rDao.findById(oldrecipe.getRecipeId());
		Recipe recipe = op.get();
		
		//刪掉原關聯的食材表&關鍵字表
		rfDao.deleteByRecipe(recipe);
		rkDao.deleteByRecipe(recipe);
		rsDao.deleteByRecipe(recipe);
		
		//設定修改的值
		recipe.setCookTitle(oldrecipe.getCookTitle());
		recipe.setCookDescription(oldrecipe.getCookDescription());
		recipe.setCookServe(oldrecipe.getCookServe());
		recipe.setCookTime(oldrecipe.getCookTime());
		
		//食譜圖片處理
		if (!photo.isEmpty()) {
			try {
				photo.transferTo(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe" + oldrecipe.getRecipeId() + ".jpeg"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//設定食材表的Set
		Set<RecipeFoods> set = new LinkedHashSet<RecipeFoods>();
		Integer totalCal = 0;
		Foods food = new Foods();
		for (int i = 0; i < foods.length; i++) {
			// 取得食材庫裡的食材
			food = fDao.findByFoodsName(foods[i]);
			// 新增進食材表(克數、食材、對應食譜)
			set.add(new RecipeFoods(gram[i], food, recipe));
			// 計算卡路里
			totalCal += (int) (gram[i] * (double) food.getCalorie() / 100);
		}
		
		//設定tag表的Set
		Set<RecipeKeyword> keywordSet = new LinkedHashSet<RecipeKeyword>();
		for (int i = 0; i < tags.length; i++) {
			// 新增關鍵字至tag表
			keywordSet.add(new RecipeKeyword(recipe,kDao.findByKeyword(tags[i])));
		}
		
		//設定步驟表的List
		List<RecipeStep> stepList = new LinkedList<RecipeStep>();
		for (int i = 0; i < stepDescript.length; i++) {
			RecipeStep rStep=new RecipeStep();
			// 新增步驟至步驟表
			rStep.setStep(i + 1);
			rStep.setStepDescription(stepDescript[i]);
			rStep.setStepPhoto("recipe" + oldrecipe.getRecipeId() + "_" + (i + 1) + ".jpeg");
			rStep.setRecipe(recipe);
			//存步驟圖片
			//判斷傳入檔案是否為空值
		 	if(!stepPhoto[i].isEmpty()) {	//檔案為非空值(資料修改)
				try {
					stepPhoto[i].transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"
									+ oldrecipe.getRecipeId() + "_" + (i + 1) + ".jpeg"));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			//放入步驟List
		 	stepList.add(rStep);
		}
		
		//設定食材表+總卡路里
		recipe.setRecipeFoods(set);
		recipe.setTotalCal(totalCal);
		recipe.setRecipeKeyword(keywordSet);
		recipe.setRecipeStep(stepList);
		Recipe updateRecipe = rDao.save(recipe);
		
		return updateRecipe;
	}
		
	//查詢單一食譜
	public Recipe findSingleRecipe(Integer recipeId) {
		Optional<Recipe> op = rDao.findById(recipeId);
		if (op.isPresent()) {
			Recipe recipe = op.get();
			return recipe;
		}
		
		return null;

	}
	
	//刪除單一食譜
	public Boolean deleteSingleRecipe(Integer recipeId) {
		Optional<Recipe> op = rDao.findById(recipeId);
		if(op.isPresent()) {
			//刪除圖片
			Recipe recipe = op.get();
			Integer step = rsDao.countByRecipe(recipe);
			//食譜圖片
		     try { 
		          File file = new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe" + recipeId + ".jpeg");
		          if(file.exists()) {
		        	  file.delete();
		        	  System.out.println("刪除成功:recipe"+recipeId+ ".jpeg");
		          }
		        }catch(Exception e){
		              System.out.println("刪除失敗 !!");
		          }
		   //步驟圖片
		     for(int i = 0; i < step; i++) {
		    	try { 
		          File file = new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"
							+ recipeId + "_" + (i + 1) + ".jpeg");
		          if(file.exists()) {
		        	  file.delete();
		        	  System.out.println("刪除成功:recipe"+recipeId + "_" + (i + 1) + ".jpeg");
		          }
		        }catch(Exception e){
		              System.out.println("刪除失敗 !!");
		          } 
		     }
		     
			//刪除食譜
			rDao.deleteById(recipeId);
			return true;
		}
		return false;
	}
	
	//查詢所有食譜
	public Page<Recipe> findAllRecipes(Integer pageNumber) {
		PageRequest page = PageRequest.of(pageNumber-1, 9, Sort.Direction.DESC, "date");
		Page<Recipe> recipePage = rDao.findAll(page);
		return recipePage;
	}
	
	// Recipe List 轉 Dto List
	public List<RecipeDto> changeRecipeToDto(Iterable<Recipe> recipes){
		List<RecipeDto> dtoList=new ArrayList<RecipeDto>();
		for(Recipe r:recipes) {
			RecipeDto dto = new RecipeDto();
			dto.setRecipeId(r.getRecipeId());
			dto.setCookTitle(r.getCookTitle());
			dto.setCookDescription(r.getCookDescription());
			dto.setCookPhoto(r.getCookPhoto());
			dto.setCookTime(r.getCookTime());
			dto.setUserId(r.getUsers().getUserId());
			dto.setUserName(r.getUsers().getUserName());
			dto.setRecipeKeyword(kService.changeKeywordToDto(r.getRecipeKeyword()));
			dto.setFavorCount(r.getFavorite().size());
			dto.setCollectCount(r.getCollect().size());
			dtoList.add(dto);
		}
		return dtoList;
	}	
	
	//模糊查詢(找食譜 or 找作者 + 關鍵字&食材分類)
	public List<RecipeDto> findUsersByFoodOrKeyword(String classify,String searchWord,String[] foods,String[] country){
					
		//未選擇checkbox的情況
		if(foods.length == 0 && country.length == 0) {
			// 找食譜
			if (classify.equals("1")) {
				List<Recipe> recipes = rDao.findByCookTitleLike("%"+searchWord+"%");
				List<RecipeDto> recipesDto = changeRecipeToDto(recipes);
				return recipesDto;
			}
			// 找作者
			else{
				List<Users> users = uDao.findByUserNameLike("%"+searchWord+"%");
				Set<Recipe> recipes = rDao.findByUsersIn(users);
				List<RecipeDto> recipesDto = changeRecipeToDto(recipes);
				return recipesDto;
			}
		}
		//有選擇checkbox的情況
		else{
						
			List<Foods> food = fDao.findByFoodsTypeIn(foods);
			List<Keyword> keyword = kDao.findByKeywordIn(country);
			List<RecipeFoods> rFood = rfDao.findByFoodsIn(food);
			List<RecipeKeyword> rKeyword = rkDao.findByKeywordIn(keyword);
						
			// 找食譜
			if (classify.equals("1")) {
				Set<Recipe> recipes = rDao.findByRecipeFoodsInAndCookTitleLikeOrRecipeKeywordInAndCookTitleLike(rFood,"%"+searchWord+"%", rKeyword,"%"+searchWord+"%");
				List<RecipeDto> recipesDto = changeRecipeToDto(recipes);
				return recipesDto;
			}
			// 找作者
			else{
				List<Users> users = uDao.findByUserNameLike("%"+searchWord+"%");
				Set<Recipe> recipes = rDao.findByRecipeFoodsInAndUsersInOrRecipeKeywordInAndUsersIn(rFood, users, rKeyword, users);
				List<RecipeDto> recipesDto = changeRecipeToDto(recipes);
				return recipesDto;
			}
		}
	}
	
	// 查詢收藏數前幾名
	public List<Recipe> collectRank(Integer rank){

		 // 取得前五名收藏的食譜id + 收藏數
		 List<Object[]> list = rDao.findCollectRank(rank);
		 
		 // 取得食譜ID的List
		 List<Integer> ids = new LinkedList<Integer>();
		 for(Object[] id : list) {
			 ids.add((Integer)id[0]);
		 }
		 
		 // 取得食譜
		 List<Recipe> cRecipes = rDao.findAllById(ids);
		 
		 // 對食譜做排序
		 Collections.sort(cRecipes, new Comparator<Recipe>() {
	            @Override
	            public int compare(Recipe o1, Recipe o2) {
	                return o2.getCollect().size() - o1.getCollect().size();
	            }
	        });

		return cRecipes;
	}

	// 查詢按讚數前幾名
	public List<Recipe> favorRank(Integer rank){
		 // 取得前五名按讚的食譜id + 按讚數
		 List<Object[]> list = rDao.findFavoriteRank(rank);
		 
		 // 取得食譜ID的List
		 List<Integer> ids = new LinkedList<Integer>();
		 for(Object[] id : list) {
			 ids.add((Integer)id[0]);
		 }
		 
		 // 取得食譜
		 List<Recipe> fRecipes = rDao.findAllById(ids);
		 
		 // 對食譜做排序
		 Collections.sort(fRecipes, new Comparator<Recipe>() {
	            @Override
	            public int compare(Recipe o1, Recipe o2) {
	                return o2.getFavorite().size() - o1.getFavorite().size();
	            }
	        });
		 
		return fRecipes;
	}
	
//	// 食譜類
//	public Recipe insertrecipe(Recipe recipe) {
//		return rDao.save(recipe);
//	}
//
//	public List<Recipe> findRecipeByUser(@Param("userId") Integer userId) {
//		return rDao.findAllRecipeByUser(userId);
//	}
//
//	public List<Recipe> findRecipeByRecipeId(@Param("recipeId") Integer recipeId) {
//		return rDao.findAllRecipeByRecipeId(recipeId);
//	}
	//查詢個人食譜By Userid
	public List<Recipe> findRecipeByUserId(Users users){
		return rDao.findByUsers(users);
	}
	
	// 隨機食譜
	public List<Recipe> findRandomRecipe(Integer number){
		return rDao.findRandomRecipe(number);
	}
	
	// 顯示最新食譜
	public List<Recipe> findLatestRecipe(){
		List<Recipe> recipe = rDao.findTop5ByOrderByDateDesc();
		return recipe;
	}
	
	// 查詢食譜by類別
	public List<Recipe> findByCategory(String category){
		String[] categories = {category};
		List<Keyword> keyword = kDao.findByKeywordIn(categories);
		List<RecipeKeyword> rKeyword = rkDao.findByKeywordIn(keyword);
		List<Recipe> recipes = rDao.findByRecipeKeywordIn(rKeyword);
		return recipes;
	}
	
}
