package com.eeit147.groupfive.recipe.controller;



import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeDto;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.service.KeywordService;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.users.model.Collect;
import com.eeit147.groupfive.users.model.CollectDao;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.FavoriteDao;
import com.eeit147.groupfive.users.model.Follow;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;
import com.eeit147.groupfive.users.service.FollowService;
import com.eeit147.groupfive.users.service.UsersService;


@Controller
@SessionAttributes("loginUser")
public class RecipeController {
	@Autowired
	private RecipeService rService;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private RecipeDao rDao;
	@Autowired
	private KeywordService kService;
	@Autowired
	private FavoriteDao fDao;
	@Autowired
	private FollowService fServics;
	@Autowired
	private UsersService uService;
	@Autowired
	private CollectDao cDao;
	//測試
	Integer userId;
	Integer recipeId;
	
	// 新增食譜
	@PostMapping("/recipe/insert")
	public String addRecipe(@RequestParam("title") String title,		//食譜標題
							@RequestParam("descript") String descript,	//食譜描述
							@RequestParam("people") Integer people,		//幾人份
							@RequestParam("time") Integer time,			//製作時間
							@RequestParam("photo") MultipartFile photo,	//食譜相片
							@RequestParam("foods") String[] foods,		//食譜食材
							@RequestParam("gram") Double[] gram,		//食材重量(克)
							@RequestParam(value = "tags",required = false, defaultValue = "") String[] tags,		//食材標籤
			                @RequestParam("stepDescript") String[] stepDescript,  	//步驟描述
			                @RequestParam("stepPhoto") MultipartFile[] stepPhoto,
			                Model m) {	//步驟相片	

		
		Users user=(Users)m.getAttribute("loginUser");
		if(user==null) {
			return "redirect:/user/login";
		}

		// 食譜
		Recipe recipe = new Recipe();
		recipe.setCookTitle(title);
		recipe.setCookDescription(descript);
		recipe.setCookServe(people); // 份數(人)
		recipe.setCookTime(time); // 製作時間

		Recipe newRecipe = rService.addRecipe(user, recipe, photo, foods, gram, tags, stepDescript, stepPhoto);
		
		//步驟排序
		Collections.sort(newRecipe.getRecipeStep(), new Comparator<RecipeStep>() {
            @Override
            public int compare(RecipeStep o1, RecipeStep o2) {
                return o1.getStep() - o2.getStep();
            }
        });
		
		return "redirect:/recipe/find/"+newRecipe.getRecipeId();
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
							   @RequestParam(value = "tags",required = false, defaultValue = "") String[] tags,		//食材標籤
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

		return "redirect:/recipe/find/"+recipe.getRecipeId();
		
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
	public String findAllRecipe(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model m) {
		Page<Recipe> page = rService.findAllRecipes(pageNumber);
		m.addAttribute("page", page);
		return "searchrecipe";
	}

	// 模糊查詢(找食譜 or 找作者 + 關鍵字 & 食材分類)
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
	@GetMapping("find/collectrank/{rank}")
	@ResponseBody
	public List<Recipe> collectRank(@PathVariable("rank")Integer rank){
		List<Recipe> recipe = rService.collectRank(rank);
		return recipe;
	}
	
	// 查詢按讚數前幾名
	@GetMapping("find/favorrank/{rank}")
	@ResponseBody
	public List<Recipe> favorRank(@PathVariable("rank")Integer rank){
		List<Recipe> recipe = rService.favorRank(rank);
		return recipe;
	}
	
	// 查詢個人食譜
	@GetMapping("/recipe.personal.controller")
	public @ResponseBody List<Recipe> findRecipeByUserId(Model m) {
		Users session = (Users)m.getAttribute("loginUser");
		System.out.println(session.getUserName());
		List<Recipe> recipe = rService.findRecipeByUserId(session);
//		m.addAttribute("recipe", recipe);
		return recipe ;
	}
	
	// 隨機食譜
	@GetMapping("/recipe/find/random/{number}")
	@ResponseBody
	public List<Recipe> randomRecipe(@PathVariable("number")Integer number){
		List<Recipe> recipe = rService.findRandomRecipe(number);
		return recipe;
	}
	
	// 查看最新文章
	@GetMapping("/recipe/find/lastest")
	@ResponseBody
	public List<Recipe> findLatestPosts(){
		List<Recipe> recipe = rService.findLatestRecipe();
		return recipe;
	}
	
	// 查看分類的食譜
	@GetMapping("/categories/{category}/{pageNumber}")
	public String findByCategory(@PathVariable("category")String category,
								 @PathVariable("pageNumber")Integer pageNumber, Model m){
		 Page<Recipe> page = rService.findByCategory(category,pageNumber);
		m.addAttribute("page", page);
		m.addAttribute("category", category);
		return "singlecategory";
	}
	
	// 查看分類
	@GetMapping("/categories")
	public String findAllCategories(Model m) {
		List<Keyword> keywords = kService.findAllKeyword();
		m.addAttribute("category", keywords);
		return "categories";
	}
	
	// 查看分類排名
	@GetMapping("/categories/rank/{number}")
	@ResponseBody
	public List<Keyword> findAJAXCategories(@PathVariable("number")Integer number) {
		List<Keyword> keywords = kService.categoryRank(number);
		return keywords;
	}
	
	//查追蹤
	@ResponseBody@PostMapping("/recipe/favor")
	public boolean findfavorornot(@RequestBody Integer recipeId,Model m) {
		
		if((Users)m.getAttribute("loginUser")!=null) {
			Users user=(Users)m.getAttribute("loginUser");
		    userId=user.getUserId();
		}else {
			userId=0;
		}
		
		
		Optional<Recipe> optionalr = rDao.findById(recipeId);
		Recipe recipe = optionalr.get();
		Optional<Users> optionalu = uDao.findById(userId);
		Users oneUser = new Users();
		if(optionalu.isPresent()) {
			oneUser = optionalu.get();
		}
		boolean favor = fDao.existsByUsersAndRecipe(oneUser,recipe);
		return favor;
	}
	//按追蹤
	@ResponseBody@PostMapping("/recipe/addfavor")
	public boolean addfavorornot(@RequestBody Integer recipeId,Model m) {
		
		if((Users)m.getAttribute("loginUser")!=null) {
			Users user=(Users)m.getAttribute("loginUser");
		    userId=user.getUserId();
		}else {
			userId=0;
		}
		
		
		Optional<Recipe> optionalr = rDao.findById(recipeId);
		Recipe recipe = optionalr.get();
		Optional<Users> optionalu = uDao.findById(userId);
		Users user = optionalu.get();
		boolean favor=fDao.existsByUsersAndRecipe(user,recipe);//找出兩者是否有關臉
		if(favor==true) {//已按讚
			fDao.deleteByUsersAndRecipe(user,recipe);
			return false;
		}else {//未按讚
			Favorite newfavor=new Favorite();
			newfavor.setRecipe(recipe);
			newfavor.setUsers(user);
			fDao.save(newfavor);
			return true;
		}	
	}
	//確認follow
	@ResponseBody@PostMapping("/recipe/follow")
	public boolean findfollowornot(@RequestBody Integer recipeId,Model m) {
		
		if((Users)m.getAttribute("loginUser")!=null) {
			Users user=(Users)m.getAttribute("loginUser");
		    userId=user.getUserId();
		}else {
			userId=0;
		}
				
		Optional<Recipe> optionalr = rDao.findById(recipeId);
		Recipe recipe = optionalr.get();
		Users track=recipe.getUsers();
		Optional<Users> optionalu = uDao.findById(userId);
		Users user = optionalu.get();
		boolean result=fServics.existsByUsersAndTrack(user, track);
		return result;
	}
	//addfollow
		@ResponseBody@PostMapping("/recipe/addfollow")
		public boolean addfollow(@RequestBody Integer recipeId,Model m) {
			
			if((Users)m.getAttribute("loginUser")!=null) {
				Users user=(Users)m.getAttribute("loginUser");
			    userId=user.getUserId();
			}else {
				userId=0;
			}
					
			Optional<Recipe> optionalr = rDao.findById(recipeId);
			Recipe recipe = optionalr.get();
			Users track=recipe.getUsers();
			Optional<Users> optionalu = uDao.findById(userId);
			Users user = optionalu.get();
			boolean result=fServics.existsByUsersAndTrack(user, track);
			
			System.out.println(result);
			if(result==true) {
				fServics.deleteByUsersAndTrack(user, track);
			}else {
				Follow follow=new Follow(user, track);
				fServics.saveUserandTrack(follow);
			}
			
			
			return result;
		}
	// 查詢個人食譜
	@GetMapping("/user/find/{userid}")
	public  String  findRecipeByUserId(@PathVariable("userid") Integer id,Model m) {
		System.out.println(id+"============================================================================================================");
		 Users userList = uService.findOneUserById(id);
		m.addAttribute("showUserPage", userList);
		return "user/showUserPage" ;
//		return userList;
	}
	
	
		// 查收藏
		@ResponseBody@PostMapping("/recipe/collect")
		public boolean findcllectornot(@RequestBody Integer recipeId,Model m) {
			
			if((Users)m.getAttribute("loginUser")!=null) {
				Users user=(Users)m.getAttribute("loginUser");
			    userId=user.getUserId();
			}else {
				userId=0;
			}
			
			
			Optional<Recipe> optionalr = rDao.findById(recipeId);
			Recipe recipe = optionalr.get();
			Optional<Users> optionalu = uDao.findById(userId);
			Users oneUser = new Users();
			if(optionalu.isPresent()) {
				oneUser = optionalu.get();
			}
			boolean collect = cDao.existsByUsersAndRecipe(oneUser,recipe);
			return collect;
		}
		
		//按收藏
		@ResponseBody@PostMapping("/recipe/addcollect")
		public boolean addcollectornot(@RequestBody Integer recipeId,Model m) {
			
			if((Users)m.getAttribute("loginUser")!=null) {
				Users user=(Users)m.getAttribute("loginUser");
			    userId=user.getUserId();
			}else {
				userId=0;
			}
			
			
			Optional<Recipe> optionalr = rDao.findById(recipeId);
			Recipe recipe = optionalr.get();
			Optional<Users> optionalu = uDao.findById(userId);
			Users user = optionalu.get();
			boolean collect=cDao.existsByUsersAndRecipe(user,recipe);//找出兩者是否有關臉
			if(collect==true) {//已收藏
				cDao.deleteByUsersAndRecipe(user,recipe);
				return false;
			}else {//未收藏
				Collect newCollect=new Collect();
				newCollect.setRecipe(recipe);
				newCollect.setUsers(user);
				cDao.save(newCollect);
				return true;
			}	
		}
		
		
}