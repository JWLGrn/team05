package com.eeit147.groupfive.recipe.controller;



import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeDto;
import com.eeit147.groupfive.recipe.model.RecipeFoods;
import com.eeit147.groupfive.recipe.model.RecipeKeyword;
import com.eeit147.groupfive.recipe.model.RecipeKeywordDto;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;
import com.eeit147.groupfive.recipe.service.KeywordService;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.recipe.service.RecipeSteptService;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;


@Controller
public class RecipeController {
	@Autowired
	private RecipeSteptService rsService;
	@Autowired
	private RecipeService rService;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private RecipeDao rDao;
	@Autowired
	private RecipeStepDao rsDao;
	@Autowired
	private KeywordService kService;
	//測試
	Integer userId=3;
	Integer recipeId;
//	//新增食譜	
//	@GetMapping("/recipe/insert")
//	public String recipepage(Model m) {
//		m.addAttribute("userId", userId);
//		//顯示食譜
//		List<Recipe> allRecipe=rService.findRecipeByUser(userId);
//		m.addAttribute("allrecipe", allRecipe);	
//		
//		return "recipe";
//	}
//	//存食譜
//	@RequestMapping("/recipe/insertRecipe")
//	public String insertRecipe(   @RequestParam(value="recipeid") Integer recipeId,
//								  @RequestParam(value="rfile") MultipartFile rfile,
//			                      @RequestParam(value="rtitle") String rtitle,
//			                      @RequestParam(value="rdescript") String rdescript,
//								  @RequestParam(value="rtime") Integer rtime,
//								  @RequestParam(value="rpeople") Integer rpeople,Model m){
//	 Recipe recipe=new Recipe();
//	 
//	 Optional<Users> optional = uDao.findById(userId);//抓usersbean
//	 Users user = optional.get();
//	 Date date=new Date();//產生時間(修改時用)
//	 if(recipeId!=1) {//insert預設食譜id為1(假的值)
//	   recipe.setRecipeId(recipeId);
//	 }
//	 String rphotopath="recipe"+recipeId+".jpg";	//存圖片路徑 
//	 if(rfile.isEmpty()) {	
//		 Optional<Recipe> optionalr= rDao.findById(recipeId);
//		 Recipe findrecipe = optionalr.get();
//		 rphotopath=findrecipe.getCookPhoto();
//		
//	 }
//	 recipe.setCookPhoto(rphotopath);
//	 recipe.setCookTitle(rtitle);
//	 recipe.setCookDescription(rdescript);
//	 recipe.setCookServe(rpeople);
//	 recipe.setCookTime(rtime);
//	 recipe.setUsers(user); 
//	 recipe.setDate(date);
//	
////新增食譜	修改食譜
//	 Recipe recipeview = rService.insertrecipe(recipe);
//	 if(recipeId==1) {//圖片路徑名稱修改
//		 recipe.setCookPhoto("recipe"+recipeview.getRecipeId()+".jpg");
//		 recipeview = rService.insertrecipe(recipe);
//	 }
//	 
////存圖片
//	 if(rfile.isEmpty()) {				 
//	 }else {
//		try {
//		  rfile.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"+recipeview.getRecipeId()+".jpg"));		
//	    } catch (IOException e) {
//		  e.printStackTrace();
//	    }	
//	 } 
//	//傳值給下一頁
//	m.addAttribute("recipe",recipeview);	 
//	return "redirect:/recipe/insert";	
//}
////步驟--------------------------------------------------------	
//	   @PostMapping("/step/insert")
//		public String stepPage(@RequestBody Integer putrecipeId,Model m) {
//			recipeId=putrecipeId;
//			return "redirect:/step/add";	
//	   }
//	   @GetMapping("/step/add")
//		public String stepadd(Model m) {
//			//顯示步驟
//			List<RecipeStep> allStep=rsService.findAllStepById(recipeId);
//			m.addAttribute("allStep", allStep);
//			//顯示食譜
//			Optional<Recipe> optional = rDao.findById(recipeId);
//			Recipe recipe = optional.get();
//			m.addAttribute("recipe",recipe);
//
//			return "recipeStep";	
//	   }
//	   
//	  
////步驟新增修改
//	@RequestMapping("/step/addStep")
//	public String insertStep(@RequestParam(value="recipeId") Integer recipeId,
//			                 @RequestParam(value="step") Integer[] step,
//			                 @RequestParam(value="stepDescript") String[] stepDescript,
//			                 @RequestParam(value="stepPhoto") MultipartFile[] stepPhoto,Model m){
//		
//		for (int i=0;i<step.length;i++) {
//			RecipeStep rstep=new RecipeStep();	
//			String stepPhotoPath="recipeId"+recipeId+"_"+step[i]+".jpg";	//設定圖片路徑的資料
//        //1.檢查recipeId->step 是否存在 (是->修改->取recipestepId , 否->新增)
//			Optional<RecipeStep> findid=rsDao.findByRecipeStepId(recipeId,step[i]);
//			if(findid.isPresent()) {//修改
//    		 	Integer stepId=findid.get().getRecipeStepId();
//    		 	rstep.setRecipeStepId(stepId);//有資料紀錄,抓id  				
//				//判斷傳入檔案是否為空值
//    		 	if(stepPhoto[i].isEmpty()) {	//檔案為空值(資料未做修改)
//					Optional<RecipeStep> optionalr= rsDao.findById(stepId);//用id找原本資料裡的圖片
//					RecipeStep findstep = optionalr.get();
//					stepPhotoPath=findstep.getStepPhoto();//存入資料為原始資料
//				}
//			}	
//			Optional<Recipe> optional = rDao.findById(recipeId);//抓recipe  bean
//			Recipe recipe = optional.get();//關聯bean			
//			rstep.setStep(step[i]);
//			rstep.setStepDescription(stepDescript[i]);
//			rstep.setStepPhoto(stepPhotoPath);
//			rstep.setRecipe(recipe);
//			rsService.insertrecipestep(rstep);//新增開關
//			System.out.println("do");
//		//存圖片	
//		if(stepPhoto[i].isEmpty()) {	//沒上傳就不存			 
//		  }else {
//			  try {
//				  stepPhoto[i].transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\step\\recipeId"+recipeId+"_"+step[i]+".jpg"));	
//			  } catch (IOException e) {
//				  e.printStackTrace();
//			  }
//		  }
//	  }
//		m.addAttribute("recipeId",recipeId);
//		System.out.println(recipeId);
//		return "redirect:/step/add";
//	}
	
	// 新增食譜
	@PostMapping("/recipe/insert")
	public String addRecipe(@RequestParam("title") String title,		//食譜標題
							@RequestParam("descript") String descript,	//食譜描述
							@RequestParam("people") Integer people,		//幾人份
							@RequestParam("time") Integer time,			//製作時間
							@RequestParam("photo") MultipartFile photo,	//食譜相片
							@RequestParam("foods") String[] foods,		//食譜食材
							@RequestParam("gram") Double[] gram,		//食材重量(克)
							@RequestParam("tags") String[] tags,		//食材標籤
			                @RequestParam("stepDescript") String[] stepDescript,  	//步驟描述
			                @RequestParam("stepPhoto") MultipartFile[] stepPhoto,
			                Model m) {	//步驟相片	

		Integer userId = 1;

		// 食譜
		Recipe recipe = new Recipe();
		recipe.setCookTitle(title);
		recipe.setCookDescription(descript);
		recipe.setCookServe(people); // 份數(人)
		recipe.setCookTime(time); // 製作時間

		Recipe newRecipe = rService.addRecipe(userId, recipe, photo, foods, gram, tags, stepDescript, stepPhoto);
		
		//步驟排序
		Collections.sort(newRecipe.getRecipeStep(), new Comparator<RecipeStep>() {
            @Override
            public int compare(RecipeStep o1, RecipeStep o2) {
                return o1.getStep() - o2.getStep();
            }
        });
		m.addAttribute("recipe", newRecipe);
		
		return "singlerecipe";
	}
	
	// 前往修改頁面
	@GetMapping("/recipe/update/{recipeId}")
	public String goUpdatePageTest(@PathVariable("recipeId")Integer recipeId,Model m) {
		Recipe recipe = rService.findSingleRecipe(recipeId);
		if(recipe!=null) {
			m.addAttribute("recipe", recipe);
			return "updaterecipe";
		}
				
		//404網頁之類的
		return "查不到資料的網頁";
	}
	
	// 修改食譜
	@PostMapping("/recipe/update")
	public String updateRecipe(@RequestParam("recipeId") Integer recipeId, 
							   @RequestParam("title") String title,		//食譜標題
							   @RequestParam("descript") String descript,	//食譜描述
							   @RequestParam("people") Integer people,		//幾人份
							   @RequestParam("time") Integer time,			//製作時間
							   @RequestParam("photo") MultipartFile photo,	//食譜相片
							   @RequestParam("foods") String[] foods,		//食譜食材
							   @RequestParam("gram") Double[] gram,		//食材重量(克)
							   @RequestParam("tags") String[] tags,		//食材標籤
							   @RequestParam("stepDescript") String[] stepDescript,  	//步驟描述
							   @RequestParam("stepPhoto") MultipartFile[] stepPhoto,
							   Model m) {
		Recipe oldRecipe = new Recipe();
		oldRecipe.setRecipeId(recipeId);
		oldRecipe.setCookTitle(title);
		oldRecipe.setCookDescription(descript);
		oldRecipe.setCookTime(time);
		oldRecipe.setCookServe(people);
		
		Recipe recipe = rService.updateRecipe(oldRecipe, photo, foods, gram, tags, stepDescript, stepPhoto);
		
		m.addAttribute("recipe", recipe);
		return "singlerecipe";
		
	}
	
	// 查看單一食譜(id)
	@GetMapping("/recipe/find/{recipeId}")
	public String findRecipe(@PathVariable("recipeId")Integer recipeId, Model m) {
		
		Recipe recipe = rService.findSingleRecipe(recipeId);
		if(recipe!=null) {
			m.addAttribute("recipe", recipe);
		}else {
			m.addAttribute("msg", "查無資料");
		}
		
		return "singlerecipe";

	}
	
	// 刪除食譜(id)
	@GetMapping("recipe/delete/{recipeId}")
	public String deleteRecipe(@PathVariable("recipeId")Integer recipeId) {
		Boolean isDelete = rService.deleteSingleRecipe(recipeId);
		if(isDelete) {
			return "redirect:/recipe/find/all";
		}
		return "redirect:/recipe/find/all";
	}

	// 查詢全部食譜
	@GetMapping("/recipe/find/all")
	public String findAllRecipe(Model m) {
		List<Recipe> rList = rService.findAllRecipes();
		m.addAttribute("rList", rList);
		return "searchrecipe";
	}

	//模糊查詢(找食譜 or 找作者 + 關鍵字 & 食材分類)
	@GetMapping("find/recipe/food")
	public @ResponseBody Iterable<RecipeDto> findUsersByFoodOrKeyword(
			@RequestParam("classify") String classify,
			@RequestParam("searchWord") String searchWord,
			@RequestParam(value = "foods", defaultValue = "")String[] foods,
			@RequestParam(value = "country", defaultValue = "")String[] country){
		
		List<RecipeDto> recipes = rService.findUsersByFoodOrKeyword(classify, searchWord, foods, country);
		
		return recipes;
	}
	
	// 查詢收藏數前幾名
	@GetMapping("find/collectrank")
	public String collectRank(Model m){
		List<Recipe> recipe = rService.collectRank(5);
		m.addAttribute("collectRecipes",recipe);
		return "test/collectRankTest";
	}
	
	// 查詢按讚數前幾名
	@GetMapping("find/favorrank")
	public String favorRank(Model m){
		List<Recipe> recipe = rService.favorRank(5);
		m.addAttribute("collectRecipes",recipe);
		return "test/collectRankTest";
	}

}