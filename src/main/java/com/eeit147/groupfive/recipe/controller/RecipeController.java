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
	//??????
	Integer userId;
	Integer recipeId;
	
	// ????????????
	@PostMapping("/recipe/insert")
	public String addRecipe(@RequestParam("title") String title,		//????????????
							@RequestParam("descript") String descript,	//????????????
							@RequestParam("people") Integer people,		//?????????
							@RequestParam("time") Integer time,			//????????????
							@RequestParam("photo") MultipartFile photo,	//????????????
							@RequestParam("foods") String[] foods,		//????????????
							@RequestParam("gram") Double[] gram,		//????????????(???)
							@RequestParam(value = "tags",required = false, defaultValue = "") String[] tags,		//????????????
			                @RequestParam("stepDescript") String[] stepDescript,  	//????????????
			                @RequestParam("stepPhoto") MultipartFile[] stepPhoto,
			                Model m) {	//????????????	

		
		Users user=(Users)m.getAttribute("loginUser");
		if(user==null) {
			return "redirect:/user/login";
		}

		// ??????
		Recipe recipe = new Recipe();
		recipe.setCookTitle(title);
		recipe.setCookDescription(descript);
		recipe.setCookServe(people); // ??????(???)
		recipe.setCookTime(time); // ????????????

		Recipe newRecipe = rService.addRecipe(user, recipe, photo, foods, gram, tags, stepDescript, stepPhoto);
		
		//????????????
		Collections.sort(newRecipe.getRecipeStep(), new Comparator<RecipeStep>() {
            @Override
            public int compare(RecipeStep o1, RecipeStep o2) {
                return o1.getStep() - o2.getStep();
            }
        });
		
		return "redirect:/recipe/find/"+newRecipe.getRecipeId();
	}
	
	// ??????????????????
	@GetMapping("/recipe/update/{recipeId}")
	public String goUpdatePageTest(@PathVariable("recipeId")Integer recipeId,Model m) {
		Recipe recipe = rService.findSingleRecipe(recipeId);
		if(recipe!=null) {
			m.addAttribute("recipe", recipe);
			return "updaterecipe";
		}
				
		//404???????????????
		return "????????????????????????";
	}
	
	// ????????????
	@PostMapping("/recipe/update")
	public String updateRecipe(@RequestParam("recipeId") Integer recipeId, 
							   @RequestParam("title") String title,		//????????????
							   @RequestParam("descript") String descript,	//????????????
							   @RequestParam("people") Integer people,		//?????????
							   @RequestParam("time") Integer time,			//????????????
							   @RequestParam("photo") MultipartFile photo,	//????????????
							   @RequestParam("foods") String[] foods,		//????????????
							   @RequestParam("gram") Double[] gram,		//????????????(???)
							   @RequestParam(value = "tags",required = false, defaultValue = "") String[] tags,		//????????????
							   @RequestParam("stepDescript") String[] stepDescript,  	//????????????
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
	
	// ??????????????????(id)
	@GetMapping("/recipe/find/{recipeId}")
	public String findRecipe(@PathVariable("recipeId")Integer recipeId, Model m) {
		
		Recipe recipe = rService.findSingleRecipe(recipeId);
		if(recipe!=null) {
			m.addAttribute("recipe", recipe);
		}else {
			m.addAttribute("msg", "????????????");
		}
		
		return "singlerecipe";

	}
	
	// ????????????(id)
	@GetMapping("recipe/delete/{recipeId}")
	public String deleteRecipe(@PathVariable("recipeId")Integer recipeId) {
		Boolean isDelete = rService.deleteSingleRecipe(recipeId);
		if(isDelete) {
			return "redirect:/recipe/find/all";
		}
		return "redirect:/recipe/find/all";
	}

	// ??????????????????
	@GetMapping("/recipe/find/all")
	public String findAllRecipe(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model m) {
		Page<Recipe> page = rService.findAllRecipes(pageNumber);
		m.addAttribute("page", page);
		return "searchrecipe";
	}

	// ????????????(????????? or ????????? + ????????? & ????????????)
	@GetMapping("find/recipe/food")
	public @ResponseBody Iterable<RecipeDto> findUsersByFoodOrKeyword(
			@RequestParam("classify") String classify,
			@RequestParam("searchWord") String searchWord,
			@RequestParam(value = "foods", defaultValue = "")String[] foods,
			@RequestParam(value = "country", defaultValue = "")String[] country){
		
		List<RecipeDto> recipes = rService.findUsersByFoodOrKeyword(classify, searchWord, foods, country);
		
		return recipes;
	}
	
	// ????????????????????????
	@GetMapping("find/collectrank/{rank}")
	@ResponseBody
	public List<Recipe> collectRank(@PathVariable("rank")Integer rank){
		List<Recipe> recipe = rService.collectRank(rank);
		return recipe;
	}
	
	// ????????????????????????
	@GetMapping("find/favorrank/{rank}")
	@ResponseBody
	public List<Recipe> favorRank(@PathVariable("rank")Integer rank){
		List<Recipe> recipe = rService.favorRank(rank);
		return recipe;
	}
	
	// ??????????????????
	@GetMapping("/recipe.personal.controller")
	public @ResponseBody List<Recipe> findRecipeByUserId(Model m) {
		Users session = (Users)m.getAttribute("loginUser");
		System.out.println(session.getUserName());
		List<Recipe> recipe = rService.findRecipeByUserId(session);
//		m.addAttribute("recipe", recipe);
		return recipe ;
	}
	
	// ????????????
	@GetMapping("/recipe/find/random/{number}")
	@ResponseBody
	public List<Recipe> randomRecipe(@PathVariable("number")Integer number){
		List<Recipe> recipe = rService.findRandomRecipe(number);
		return recipe;
	}
	
	// ??????????????????
	@GetMapping("/recipe/find/lastest")
	@ResponseBody
	public List<Recipe> findLatestPosts(){
		List<Recipe> recipe = rService.findLatestRecipe();
		return recipe;
	}
	
	// ?????????????????????
	@GetMapping("/categories/{category}/{pageNumber}")
	public String findByCategory(@PathVariable("category")String category,
								 @PathVariable("pageNumber")Integer pageNumber, Model m){
		 Page<Recipe> page = rService.findByCategory(category,pageNumber);
		m.addAttribute("page", page);
		m.addAttribute("category", category);
		return "singlecategory";
	}
	
	// ????????????
	@GetMapping("/categories")
	public String findAllCategories(Model m) {
		List<Keyword> keywords = kService.findAllKeyword();
		m.addAttribute("category", keywords);
		return "categories";
	}
	
	// ??????????????????
	@GetMapping("/categories/rank/{number}")
	@ResponseBody
	public List<Keyword> findAJAXCategories(@PathVariable("number")Integer number) {
		List<Keyword> keywords = kService.categoryRank(number);
		return keywords;
	}
	
	//?????????
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
	//?????????
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
		boolean favor=fDao.existsByUsersAndRecipe(user,recipe);//???????????????????????????
		if(favor==true) {//?????????
			fDao.deleteByUsersAndRecipe(user,recipe);
			return false;
		}else {//?????????
			Favorite newfavor=new Favorite();
			newfavor.setRecipe(recipe);
			newfavor.setUsers(user);
			fDao.save(newfavor);
			return true;
		}	
	}
	//??????follow
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
	// ??????????????????
	@GetMapping("/user/find/{userid}")
	public  String  findRecipeByUserId(@PathVariable("userid") Integer id,Model m) {
		System.out.println(id+"============================================================================================================");
		 Users userList = uService.findOneUserById(id);
		m.addAttribute("showUserPage", userList);
		return "user/showUserPage" ;
//		return userList;
	}
	
	
		// ?????????
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
		
		//?????????
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
			boolean collect=cDao.existsByUsersAndRecipe(user,recipe);//???????????????????????????
			if(collect==true) {//?????????
				cDao.deleteByUsersAndRecipe(user,recipe);
				return false;
			}else {//?????????
				Collect newCollect=new Collect();
				newCollect.setRecipe(recipe);
				newCollect.setUsers(user);
				cDao.save(newCollect);
				return true;
			}	
		}
		
		
}