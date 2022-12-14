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
	
	//????????????
	public Recipe addRecipe(Users user,
							Recipe recipe, 
							MultipartFile photo, 
							String[] foods, 
							Double[] gram,
							String[] tags, 
							String[] stepDescript, 
							MultipartFile[] stepPhoto) { // ????????????

		// ??????
		recipe.setUsers(user);
		Recipe newRecipe = rDao.save(recipe);

		Integer recipeId = newRecipe.getRecipeId();

		// -------------------????????????-------------------------

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

		// -------------------????????????-------------------------
		Set<RecipeFoods> recipeFoodsSet = new LinkedHashSet<RecipeFoods>();
		Integer totalCal = 0;
		Foods food = new Foods();

		for (int i = 0; i < foods.length; i++) {
			// ???????????????????????????
			food = fDao.findByFoodsName(foods[i]);
			// ??????????????????(??????????????????????????????)
			recipeFoodsSet.add(new RecipeFoods(gram[i], food, newRecipe));
			// ???????????????
			totalCal += (int) (gram[i] * (double) food.getCalorie() / 100);
		}
		// ---------------------------------------------------

		// -------------------???????????????-------------------------
		Set<RecipeKeyword> keywordSet = new LinkedHashSet<RecipeKeyword>();

		for (int i = 0; i < tags.length; i++) {
			// ??????????????????tag???
			keywordSet.add(new RecipeKeyword(newRecipe, kDao.findByKeyword(tags[i])));
		}
		// ---------------------------------------------------

		// --------------------????????????--------------------------
		List<RecipeStep> stepList = new LinkedList<RecipeStep>();
		for (int i = 0; i < stepDescript.length; i++) {
			//????????????????????????
			RecipeStep rStep = new RecipeStep();
			rStep.setStep(i + 1);
			rStep.setStepDescription(stepDescript[i]);
			rStep.setStepPhoto("recipe" + recipeId + "_" + (i + 1) + ".jpeg");
			rStep.setRecipe(newRecipe);
			//???????????????
			//?????????????????????????????????
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
			//????????????Set
			stepList.add(rStep);
		}

		// ---------------------------------------------------

		
		// ?????????+???????????????????????????
		newRecipe.setCookPhoto("recipe" + newRecipe.getRecipeId() + ".jpeg");// ????????????
		newRecipe.setRecipeFoods(recipeFoodsSet);
		newRecipe.setTotalCal(totalCal);
		newRecipe.setRecipeKeyword(keywordSet);
		newRecipe.setRecipeStep(stepList);
		rDao.save(newRecipe);

		//????????????
		Collections.sort(newRecipe.getRecipeStep(), new Comparator<RecipeStep>() {
		    @Override
		    public int compare(RecipeStep o1, RecipeStep o2) {
		    return o1.getStep() - o2.getStep();
		  }
		});
		
		return newRecipe;
	}

	//????????????
	public Recipe updateRecipe(Recipe oldrecipe,
							 MultipartFile photo,
							 String[] foods,
							 Double[] gram,
							 String[] tags,
							 String[] stepDescript,
							 MultipartFile[] stepPhoto) {
		
		//??????recipe??????
		Optional<Recipe> op = rDao.findById(oldrecipe.getRecipeId());
		Recipe recipe = op.get();
		
		//???????????????????????????&????????????
		rfDao.deleteByRecipe(recipe);
		rkDao.deleteByRecipe(recipe);
		rsDao.deleteByRecipe(recipe);
		
		//??????????????????
		recipe.setCookTitle(oldrecipe.getCookTitle());
		recipe.setCookDescription(oldrecipe.getCookDescription());
		recipe.setCookServe(oldrecipe.getCookServe());
		recipe.setCookTime(oldrecipe.getCookTime());
		
		//??????????????????
		if (!photo.isEmpty()) {
			try {
				photo.transferTo(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe" + oldrecipe.getRecipeId() + ".jpeg"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//??????????????????Set
		Set<RecipeFoods> set = new LinkedHashSet<RecipeFoods>();
		Integer totalCal = 0;
		Foods food = new Foods();
		for (int i = 0; i < foods.length; i++) {
			// ???????????????????????????
			food = fDao.findByFoodsName(foods[i]);
			// ??????????????????(??????????????????????????????)
			set.add(new RecipeFoods(gram[i], food, recipe));
			// ???????????????
			totalCal += (int) (gram[i] * (double) food.getCalorie() / 100);
		}
		
		//??????tag??????Set
		Set<RecipeKeyword> keywordSet = new LinkedHashSet<RecipeKeyword>();
		for (int i = 0; i < tags.length; i++) {
			// ??????????????????tag???
			keywordSet.add(new RecipeKeyword(recipe,kDao.findByKeyword(tags[i])));
		}
		
		//??????????????????List
		List<RecipeStep> stepList = new LinkedList<RecipeStep>();
		for (int i = 0; i < stepDescript.length; i++) {
			RecipeStep rStep=new RecipeStep();
			// ????????????????????????
			rStep.setStep(i + 1);
			rStep.setStepDescription(stepDescript[i]);
			rStep.setStepPhoto("recipe" + oldrecipe.getRecipeId() + "_" + (i + 1) + ".jpeg");
			rStep.setRecipe(recipe);
			//???????????????
			//?????????????????????????????????
		 	if(!stepPhoto[i].isEmpty()) {	//??????????????????(????????????)
				try {
					stepPhoto[i].transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"
									+ oldrecipe.getRecipeId() + "_" + (i + 1) + ".jpeg"));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			//????????????List
		 	stepList.add(rStep);
		}
		
		//???????????????+????????????
		recipe.setRecipeFoods(set);
		recipe.setTotalCal(totalCal);
		recipe.setRecipeKeyword(keywordSet);
		recipe.setRecipeStep(stepList);
		Recipe updateRecipe = rDao.save(recipe);
		
		return updateRecipe;
	}
		
	//??????????????????
	public Recipe findSingleRecipe(Integer recipeId) {
		Optional<Recipe> op = rDao.findById(recipeId);
		if (op.isPresent()) {
			Recipe recipe = op.get();
			return recipe;
		}
		
		return null;

	}
	
	//??????????????????
	public Boolean deleteSingleRecipe(Integer recipeId) {
		Optional<Recipe> op = rDao.findById(recipeId);
		if(op.isPresent()) {
			//????????????
			Recipe recipe = op.get();
			Integer step = rsDao.countByRecipe(recipe);
			//????????????
		     try { 
		          File file = new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe" + recipeId + ".jpeg");
		          if(file.exists()) {
		        	  file.delete();
		        	  System.out.println("????????????:recipe"+recipeId+ ".jpeg");
		          }
		        }catch(Exception e){
		              System.out.println("???????????? !!");
		          }
		   //????????????
		     for(int i = 0; i < step; i++) {
		    	try { 
		          File file = new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"
							+ recipeId + "_" + (i + 1) + ".jpeg");
		          if(file.exists()) {
		        	  file.delete();
		        	  System.out.println("????????????:recipe"+recipeId + "_" + (i + 1) + ".jpeg");
		          }
		        }catch(Exception e){
		              System.out.println("???????????? !!");
		          } 
		     }
		     
			//????????????
			rDao.deleteById(recipeId);
			return true;
		}
		return false;
	}
	
	//??????????????????
	public Page<Recipe> findAllRecipes(Integer pageNumber) {
		PageRequest page = PageRequest.of(pageNumber-1, 9, Sort.Direction.DESC, "date");
		Page<Recipe> recipePage = rDao.findAll(page);
		return recipePage;
	}
	
	// Recipe List ??? Dto List
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
	
	//????????????(????????? or ????????? + ?????????&????????????)
	public List<RecipeDto> findUsersByFoodOrKeyword(String classify,String searchWord,String[] foods,String[] country){
					
		//?????????checkbox?????????
		if(foods.length == 0 && country.length == 0) {
			// ?????????
			if (classify.equals("1")) {
				List<Recipe> recipes = rDao.findByCookTitleLike("%"+searchWord+"%");
				List<RecipeDto> recipesDto = changeRecipeToDto(recipes);
				return recipesDto;
			}
			// ?????????
			else{
				List<Users> users = uDao.findByUserNameLike("%"+searchWord+"%");
				Set<Recipe> recipes = rDao.findByUsersIn(users);
				List<RecipeDto> recipesDto = changeRecipeToDto(recipes);
				return recipesDto;
			}
		}
		//?????????checkbox?????????
		else{
						
			List<Foods> food = fDao.findByFoodsTypeIn(foods);
			List<Keyword> keyword = kDao.findByKeywordIn(country);
			List<RecipeFoods> rFood = rfDao.findByFoodsIn(food);
			List<RecipeKeyword> rKeyword = rkDao.findByKeywordIn(keyword);
						
			// ?????????
			if (classify.equals("1")) {
				Set<Recipe> recipes = rDao.findByRecipeFoodsInAndCookTitleLikeOrRecipeKeywordInAndCookTitleLike(rFood,"%"+searchWord+"%", rKeyword,"%"+searchWord+"%");
				List<RecipeDto> recipesDto = changeRecipeToDto(recipes);
				return recipesDto;
			}
			// ?????????
			else{
				List<Users> users = uDao.findByUserNameLike("%"+searchWord+"%");
				Set<Recipe> recipes = rDao.findByRecipeFoodsInAndUsersInOrRecipeKeywordInAndUsersIn(rFood, users, rKeyword, users);
				List<RecipeDto> recipesDto = changeRecipeToDto(recipes);
				return recipesDto;
			}
		}
	}
	
	// ????????????????????????
	public List<Recipe> collectRank(Integer rank){

		 // ??????????????????????????????id + ?????????
		 List<Object[]> list = rDao.findCollectRank(rank);
		 
		 // ????????????ID???List
		 List<Integer> ids = new LinkedList<Integer>();
		 for(Object[] id : list) {
			 ids.add((Integer)id[0]);
		 }
		 
		 // ????????????
		 List<Recipe> cRecipes = rDao.findAllById(ids);
		 
		 // ??????????????????
		 Collections.sort(cRecipes, new Comparator<Recipe>() {
	            @Override
	            public int compare(Recipe o1, Recipe o2) {
	                return o2.getCollect().size() - o1.getCollect().size();
	            }
	        });

		return cRecipes;
	}

	// ????????????????????????
	public List<Recipe> favorRank(Integer rank){
		 // ??????????????????????????????id + ?????????
		 List<Object[]> list = rDao.findFavoriteRank(rank);
		 
		 // ????????????ID???List
		 List<Integer> ids = new LinkedList<Integer>();
		 for(Object[] id : list) {
			 ids.add((Integer)id[0]);
		 }
		 
		 // ????????????
		 List<Recipe> fRecipes = rDao.findAllById(ids);
		 
		 // ??????????????????
		 Collections.sort(fRecipes, new Comparator<Recipe>() {
	            @Override
	            public int compare(Recipe o1, Recipe o2) {
	                return o2.getFavorite().size() - o1.getFavorite().size();
	            }
	        });
		 
		return fRecipes;
	}
	
//	// ?????????
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
	//??????????????????By Userid
	public List<Recipe> findRecipeByUserId(Users users){
		return rDao.findByUsers(users);
	}
	
	// ????????????
	public List<Recipe> findRandomRecipe(Integer number){
		return rDao.findRandomRecipe(number);
	}
	
	// ??????????????????
	public List<Recipe> findLatestRecipe(){
		List<Recipe> recipe = rDao.findTop5ByOrderByDateDesc();
		return recipe;
	}
	
	// ????????????by??????
	public Page<Recipe> findByCategory(String category,Integer pageNumber){
		String[] categories = {category};
		List<Keyword> keyword = kDao.findByKeywordIn(categories);
		List<RecipeKeyword> rKeyword = rkDao.findByKeywordIn(keyword);
		PageRequest page = PageRequest.of(pageNumber-1, 9, Sort.Direction.DESC, "date");
		Page<Recipe> pages = rDao.findByRecipeKeywordIn(rKeyword,page);
		return pages;
	}
	
}
