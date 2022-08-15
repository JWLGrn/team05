package com.eeit147.groupfive.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.FavoriteDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;


@Controller
public class TestController {

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

	// 測試新增食譜 傳值
//	@PostMapping("/add")
//	public void testadd(@RequestParam("title") String title, @RequestParam("descript") String descript,
//			@RequestParam("foods") String[] foods, @RequestParam("gram") Double[] gram) {
//
//		System.out.println("title: " + title);
//		System.out.println("descript: " + descript);
//		System.out.println(
//				"foods: " + foods[0] + " & " + foods[1] + " & " + foods[2] + " & " + foods[3] + " & " + foods[4]);
//		System.out.println("gram: " + gram[0] + " & " + gram[1] + " & " + gram[2] + " & " + gram[3] + " & " + gram[4]);
//
//	}

	// 新增食譜+食材表做關聯
	@PostMapping("/add")
	public String addRecipe(@RequestParam("userId") Integer userId, @RequestParam("title") String title,
			@RequestParam("descript") String descript, @RequestParam("people") Integer people,
			@RequestParam("time") Integer time, @RequestParam("photo") String photo,
			@RequestParam("foods") String[] foods, @RequestParam("gram") Double[] gram,
			@RequestParam("tags") String[] tags) {

		// 取得user
		Optional<Users> optional = uDao.findById(userId);
		Users user = optional.get();

		// 食譜
		Recipe r = new Recipe();
		r.setUsers(user);
		r.setCookTitle(title);
		r.setCookDescription(descript);
		r.setCookServe(people); // 份數(人)
		r.setCookTime(time); // 製作時間
		r.setCookPhoto(photo); // 圖片標題，待寫io存圖片
		Recipe newRecipe = rDao.save(r);

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

		// 做關聯+新增總卡路里到食譜
		newRecipe.setRecipeFoods(recipeFoodsSet);
		newRecipe.setTotalCal(totalCal);
		newRecipe.setRecipeKeyword(keywordSet);
		rDao.save(newRecipe);

		return "test/added";
	}

	// 查詢單一食譜(id)
	@GetMapping("/findr")
	public String findRecipe(Model m) {
		Integer id = 19;// 查詢食譜id
		Optional<Recipe> op = rDao.findById(id);
		if (op.isPresent()) {
			Recipe re = op.get();
			m.addAttribute("recipe", re);
		}
		return "test/showrecipe123";

	}

	// 測試刪除食譜
	@GetMapping("/deleteTest")
	public void deleteTest() {
		if (rDao.existsById(15)) {
			rDao.deleteById(15);
			// return 刪除成功
		}
		// return 查無資料無法刪除
	}

	// 前往測試頁面
	@GetMapping("/updatePageTest")
	public String goUpdatePageTest(@RequestParam("id") Integer id, Model m) {
		Optional<Recipe> op = rDao.findById(id);
		if (op != null) {
			Recipe r = op.get();
			m.addAttribute("recipe", r);
			return "test/updateRecipeTest";
		}

		// 404網頁之類的
		return "查不到資料的網頁";
	}

	// 修改測試
	@PostMapping("/updateTest")
	public String updateTest(@RequestParam("userId") Integer userId, @RequestParam("recipeId") Integer recipeId,
			@RequestParam("title") String title, @RequestParam("descript") String descript,
			@RequestParam("people") Integer people, @RequestParam("time") Integer time,
			@RequestParam("photo") String photo, @RequestParam("foods") String[] foods,
			@RequestParam("gram") Double[] gram, @RequestParam("tags") String[] tags) {

		// 取得recipe資料
		Optional<Recipe> op = rDao.findById(recipeId);
		Recipe recipe = op.get();

		// 刪掉原關聯的食材表&關鍵字表
		rfDao.deleteByRecipe(recipe);
		rkDao.deleteByRecipe(recipe);

		// 設定修改的值
		recipe.setCookTitle(title);
		recipe.setCookDescription(descript);
		recipe.setCookServe(people);
		recipe.setCookTime(time);
		recipe.setCookPhoto(photo);

		// 設定食材表的Set
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

		// 設定tag表的Set
		Set<RecipeKeyword> keywordSet = new LinkedHashSet<RecipeKeyword>();
		for (int i = 0; i < tags.length; i++) {
			// 新增關鍵字至tag表
			keywordSet.add(new RecipeKeyword(recipe, kDao.findByKeyword(tags[i])));
		}

		// 設定食材表+總卡路里
		recipe.setRecipeFoods(set);
		recipe.setTotalCal(totalCal);
		recipe.setRecipeKeyword(keywordSet);
		rDao.save(recipe);

		return "test/added";
	}

	// 關鍵字模糊搜尋
	@GetMapping("/find/keyword/{word}")
	public @ResponseBody List<Keyword> findKeyword(@PathVariable("word") String word) {
		System.out.println(word);
		List<Keyword> kList = kDao.findByKeywordLike("%" + word + "%");
		return kList;
	}

	// 食材模糊搜尋
	@GetMapping("/find/foods/{word}")
	public @ResponseBody List<Foods> findFood(@PathVariable("word") String word) {
		System.out.println(word);
		List<Foods> fList = fDao.findByFoodsNameLike("%" + word + "%");
		return fList;
	}

	// 搜尋全部食材
	@GetMapping("/find/foods/all")
	public @ResponseBody List<Foods> findAllFoods() {
		List<Foods> fList = fDao.findAll();
		return fList;
	}

	// 搜尋全部關鍵字
	@GetMapping("/find/keyword/all")
	public @ResponseBody List<Keyword> findAllKeyword() {
		List<Keyword> kList = kDao.findAll();
		return kList;
	}

	//食譜模糊查詢(食譜+作者)
	@GetMapping("/find/user/username")
	public @ResponseBody Iterable<Recipe> findUsersByKeyword(
			@RequestParam("classify") String classify,
			@RequestParam("keywords") String keywords) {

		// 找食譜
		if (classify.equals("1")) {
			List<Recipe> recipe = rDao.findByCookTitleLike("%"+keywords+"%");
			return recipe;
			
		}
		// 找作者
		else{
			System.out.println("找作者"+"classify="+classify+" keywords="+keywords);
			List<Users> users = uDao.findByUserNameLike("%"+keywords+"%");
			Set<Recipe> recipe = rDao.findByUsersIn(users);
			return recipe;
		}

	}
	
	//查詢user by食譜
//	@PostMapping("find/users/{recipeId}")
//	public @ResponseBody Users findByRecipe(@PathVariable("recipeId")Integer recipeId) {
//		
//		Optional<Recipe> op = rDao.findById(recipeId);
//		Recipe recipe = op.get();
//		
//		Users user = uDao.findByRecipe(recipe);
//		return user;
//		
//	}
	
		//符號顯示(確認是否有關聯 → 顯示不同圖片)
		@GetMapping("/checkfavor/{usersid}/{recipeid}")
		public @ResponseBody ResponseEntity<byte[]> checkFavor(
				@PathVariable("usersid")Integer userid,
				@PathVariable("recipeid")Integer recipeid) throws IOException {
			
			//取得user bean
			Optional<Users> op = uDao.findById(userid);
			Users user = op.get();
			
			//取得recipe bean
			Optional<Recipe> rop = rDao.findById(recipeid);
			Recipe recipe = rop.get();
			
			//確認關聯是否存在
			boolean isExisits = frDao.existsByUsersAndRecipe(user, recipe);
			System.out.println(isExisits);
			
			//設定標頭
			HttpHeaders header = new HttpHeaders();
			header.setContentType(MediaType.IMAGE_PNG);
			
			//判斷有無關聯 → 顯示不同圖片
			if(isExisits) {
					FileInputStream input = new FileInputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\heart-red.png"));
					byte[] bytes = input.readAllBytes();
					input.close();
					return new ResponseEntity<byte[]>(bytes,header,HttpStatus.OK);
				}else {
					FileInputStream input = new FileInputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\heart-white.png"));
					byte[] bytes = input.readAllBytes();
					input.close();
					return new ResponseEntity<byte[]>(bytes,header,HttpStatus.OK);
				}
			
		}
		
		//按讚 + 收回讚
		@PostMapping("/pressfavor/{usersid}/{recipeid}")
		@ResponseBody
		public void pressFavor(
				@PathVariable("usersid")Integer userid,
				@PathVariable("recipeid")Integer recipeid) {
			
			//取得user bean
			Optional<Users> op = uDao.findById(userid);
			Users user = op.get();
			
			//取得recipe bean
			Optional<Recipe> rop = rDao.findById(recipeid);
			Recipe recipe = rop.get();
			
			//確認關聯是否存在
			boolean isExisits = frDao.existsByUsersAndRecipe(user, recipe);
			System.out.println(isExisits);
			
			//----------------------------------------------

			//判斷有無關聯 → 無關聯則新增，有關聯則刪除
			if(isExisits) {
					
				frDao.deleteByUsersAndRecipe(user, recipe);
				
			}else {
				
				Favorite favor = new Favorite(user, recipe);
				frDao.save(favor);	
					
			}
			
		}
		
		//查詢全部食譜
		@GetMapping("/allRecipe")
		public String findAllRecipe(Model m) {
			List<Recipe> rList = rDao.findAll();
			m.addAttribute("rList", rList);
			return "test/templateTest";
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
				dto.setRecipeKeyword(changeKeywordToDto(r.getRecipeKeyword()));
				dtoList.add(dto);
			}
			return dtoList;
		}
		
		// Keyword List 轉 Dto List
		public List<RecipeKeywordDto> changeKeywordToDto(Iterable<RecipeKeyword> recipekeywords){
			List<RecipeKeywordDto> dtoList=new ArrayList<RecipeKeywordDto>();
			for(RecipeKeyword rk : recipekeywords) {
				RecipeKeywordDto dto = new RecipeKeywordDto();
				dto.setRecipekeywordId(rk.getRecipekeywordId());
				dto.setKeyword(rk.getKeyword().getKeyword());
				dtoList.add(dto);
			}
			return dtoList;
		}
		
		//模糊查詢(找食譜 or 找作者 + 關鍵字&食材分類)
		@GetMapping("find/recipe/food")
		public @ResponseBody Iterable<RecipeDto> findUsersByFoodOrKeyword(
				@RequestParam("classify") String classify,
				@RequestParam("searchWord") String searchWord,
				@RequestParam(value = "foods", defaultValue = "")String[] foods,
				@RequestParam(value = "country", defaultValue = "")String[] country
				){
			
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
}
