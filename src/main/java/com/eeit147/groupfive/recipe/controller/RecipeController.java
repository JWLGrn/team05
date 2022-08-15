package com.eeit147.groupfive.recipe.controller;



import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;
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
	
//測試
	Integer userId=3;
	Integer recipeId=10;
//食譜	
	@GetMapping("/recipe/insert")
	public String recipepage(Model m) {
		m.addAttribute("userId", userId);
		m.addAttribute("recipeId", recipeId);
		return "recipe";
	}
//新增食譜,修改食譜
	@RequestMapping("/recipe/insertRecipe")
	public String insertRecipe(  //測試期間不新增 @RequestParam(value="recipeid") Integer recipeId,
								  @RequestParam(value="rfile") MultipartFile rfile,
			                      @RequestParam(value="rtitle") String rtitle,
			                      @RequestParam(value="rdescript") String rdescript,
								  @RequestParam(value="rtime") Integer rtime,
								  @RequestParam(value="rpeople") Integer rpeople,Model m){
	 Recipe recipe=new Recipe();
	
	 Optional<Users> optional = uDao.findById(userId);//抓usersbean
	 Users user = optional.get();
	 Date date=new Date();//產生時間(修改時用)
	 if(recipeId!=1) {//insert預設食譜id為1(假的值)
	   recipe.setRecipeId(recipeId);
	 }
	 String rphotopath="recipe"+recipeId+".jpg";	//存圖片路徑 
	 if(rfile.isEmpty()) {	
		 Optional<Recipe> optionalr= rDao.findById(recipeId);
		 Recipe findrecipe = optionalr.get();
		 rphotopath=findrecipe.getCookPhoto();
		
	 }
	 recipe.setCookPhoto(rphotopath);
	 recipe.setCookTitle(rtitle);
	 recipe.setCookDescription(rdescript);
	 recipe.setCookServe(rpeople);
	 recipe.setCookTime(rtime);
	 recipe.setUsers(user); 
	 recipe.setDate(date);
	
//新增食譜	修改食譜
	 Recipe recipeview = rService.insertrecipe(recipe);
//存圖片
	 if(rfile.isEmpty()) {				 
	 }else {
		try {
		  rfile.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"+recipeview.getRecipeId()+".jpg"));		
	    } catch (IOException e) {
		  e.printStackTrace();
	    }	
	 } 
	//傳值給下一頁
	m.addAttribute("recipe",recipeview);	 
	return "recipe";	
}
//步驟--------------------------------------------------------	
	@GetMapping("/step/insert")
		public String stepPage(Model m) {
			m.addAttribute("userId", userId);
			m.addAttribute("recipeId", recipeId);
			//顯示
			List<RecipeStep> allStep=rsService.findAllStepById(recipeId);
			m.addAttribute("allStep", allStep);	
			return "recipeStep";
			
	}
//步驟新增修改
	@RequestMapping("/step/addStep")
	public String insertStep(@RequestParam(value="recipeId") Integer recipeId,
			                 @RequestParam(value="step") Integer[] step,
			                 @RequestParam(value="stepDescript") String[] stepDescript,
			                 @RequestParam(value="stepPhoto") MultipartFile[] stepPhoto,Model m){
		
		for (int i=0;i<step.length;i++) {
			RecipeStep rstep=new RecipeStep();	
			String stepPhotoPath="recipeId"+recipeId+"_"+step[i]+".jpg";	//設定圖片路徑的資料
        //1.檢查recipeId->step 是否存在 (是->修改->取recipestepId , 否->新增)
			Optional<RecipeStep> findid=rsDao.findByRecipeStepId(recipeId,step[i]);
			if(findid.isPresent()) {//修改
    		 	Integer stepId=findid.get().getRecipeStepId();
    		 	rstep.setRecipeStepId(stepId);//有資料紀錄,抓id  				
				//判斷傳入檔案是否為空值
    		 	if(stepPhoto[i].isEmpty()) {	//檔案為空值(資料未做修改)
					Optional<RecipeStep> optionalr= rsDao.findById(stepId);//用id找原本資料裡的圖片
					RecipeStep findstep = optionalr.get();
					stepPhotoPath=findstep.getStepPhoto();//存入資料為原始資料
				}
			}	
			Optional<Recipe> optional = rDao.findById(recipeId);//抓recipe  bean
			Recipe recipe = optional.get();//關聯bean			
			rstep.setStep(step[i]);
			rstep.setStepDescription(stepDescript[i]);
			rstep.setStepPhoto(stepPhotoPath);
			rstep.setRecipe(recipe);
			rsService.insertrecipestep(rstep);//新增開關
			System.out.println("do");
		//存圖片	
		if(stepPhoto[i].isEmpty()) {	//沒上傳就不存			 
		  }else {
			  try {
				  stepPhoto[i].transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\step\\recipeId"+recipeId+"_"+step[i]+".jpg"));	
			  } catch (IOException e) {
				  e.printStackTrace();
			  }
		  }
	  }

		return "redirect:/step/insert";
	}
	
//測試用
	@RequestMapping("/step/test")
	public String test(Model m) {
		List<RecipeStep> allStep=rsService.findAllStepById(recipeId);
		m.addAttribute("allStep", allStep);	
		return "recipeStep";
	}
	
}