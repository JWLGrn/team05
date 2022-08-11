package com.eeit147.groupfive.controller;

import java.util.LinkedHashSet;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.FoodsDao;
import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.KeywordDao;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeFoods;
import com.eeit147.groupfive.recipe.model.RecipeFoodsDao;
import com.eeit147.groupfive.recipe.model.RecipeKeyword;
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
	public String addRecipe(
			@RequestParam("userId") Integer userId, 
			@RequestParam("title") String title,
			@RequestParam("descript") String descript, 
			@RequestParam("people") Integer people,
			@RequestParam("time") Integer time, 
			@RequestParam("photo") String photo,
			@RequestParam("foods") String[] foods, 
			@RequestParam("gram") Double[] gram,
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

		//-------------------食材關聯-------------------------
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
		//---------------------------------------------------

		//-------------------關鍵字關聯-------------------------
		Set<RecipeKeyword> keywordSet = new LinkedHashSet<RecipeKeyword>();
		
		for (int i = 0; i < tags.length; i++) {
			// 新增關鍵字至tag表
			keywordSet.add(new RecipeKeyword(newRecipe,kDao.findByKeyword(tags[i])));
		}
		
		//---------------------------------------------------
		
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
		Integer id = 16;// 查詢食譜id
		Optional<Recipe> op = rDao.findById(id);
		if (op.isPresent()) {
			Recipe re = op.get();
			m.addAttribute("recipe", re);
		}
		return "test/showrecipe123";

	}
	
	//測試刪除食譜
	@GetMapping("/deleteTest")
	public void deleteTest() {
		if(rDao.existsById(15)) {
			rDao.deleteById(15);
			//return 刪除成功
		}
		//return 查無資料無法刪除
	}

	//前往測試頁面
	@GetMapping("/updatePageTest")
	public String goUpdatePageTest(@RequestParam("id")Integer id,Model m) {
		Optional<Recipe> op = rDao.findById(id);
		if(op!=null) {
			Recipe r = op.get();
			m.addAttribute("recipe", r);
			return "test/updateRecipeTest";
		}
		
		//404網頁之類的
		return "查不到資料的網頁";
	}
	
	//修改測試
	@PostMapping("/updateTest")
	public String updateTest(
			@RequestParam("userId") Integer userId, 
			@RequestParam("recipeId") Integer recipeId, 
			@RequestParam("title") String title,
			@RequestParam("descript") String descript, 
			@RequestParam("people") Integer people,
			@RequestParam("time") Integer time, 
			@RequestParam("photo") String photo,
			@RequestParam("foods") String[] foods, 
			@RequestParam("gram") Double[] gram) {
		
		//取得recipe資料
		Optional<Recipe> op = rDao.findById(recipeId);
		Recipe recipe = op.get();
		
		//刪掉原關聯的食材表
		rfDao.deleteByRecipe(recipe);
		
		//設定修改的值
		recipe.setCookTitle(title);
		recipe.setCookDescription(descript);
		recipe.setCookServe(people);
		recipe.setCookTime(time);
		recipe.setCookPhoto(photo);
		
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

		//設定食材表+總卡路里
		recipe.setRecipeFoods(set);
		recipe.setTotalCal(totalCal);
		rDao.save(recipe);

		return "test/added";
	}
}
