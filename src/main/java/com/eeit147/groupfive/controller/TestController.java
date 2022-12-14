package com.eeit147.groupfive.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
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
import com.eeit147.groupfive.recipe.model.RecipeFoodsDto;
import com.eeit147.groupfive.recipe.model.RecipeKeyword;
import com.eeit147.groupfive.recipe.model.RecipeKeywordDao;
import com.eeit147.groupfive.recipe.model.RecipeKeywordDto;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.FavoriteDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;


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
	private RecipeStepDao rsDao;
	
	@Autowired
	private FavoriteDao frDao;
	
	@Autowired
	private RecipeService recipeService;
	
	// ????????????????????????
//	@GetMapping("/find/keyword/{word}")
//	public @ResponseBody List<Keyword> findKeyword(@PathVariable("word") String word) {
//		List<Keyword> kList = kDao.findByKeywordLike("%" + word + "%");
//		return kList;
//	}

	// ??????????????????
//	@GetMapping("/find/foods/{food}")
//	public @ResponseBody List<Foods> findFood(@PathVariable("food") String food) {
//		List<Foods> fList = fDao.findByFoodsNameLike("%" + food + "%");
//		return fList;
//	}

	//??????????????????(??????+??????)
//	@GetMapping("/find/user/username")
//	public @ResponseBody Iterable<Recipe> findUsersByKeyword(
//			@RequestParam("classify") String classify,
//			@RequestParam("keywords") String keywords) {
//
//		// ?????????
//		if (classify.equals("1")) {
//			List<Recipe> recipe = rDao.findByCookTitleLike("%"+keywords+"%");
//			return recipe;
//			
//		}
//		// ?????????
//		else{
//			System.out.println("?????????"+"classify="+classify+" keywords="+keywords);
//			List<Users> users = uDao.findByUserNameLike("%"+keywords+"%");
//			Set<Recipe> recipe = rDao.findByUsersIn(users);
//			return recipe;
//		}
//
//	}
	
	//??????user by??????
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
	
		//??????????????????(????????????????????? ??? ??????????????????)
		@GetMapping("/checkfavor/{usersid}/{recipeid}")
		public @ResponseBody ResponseEntity<byte[]> checkFavor(
				@PathVariable("usersid")Integer userid,
				@PathVariable("recipeid")Integer recipeid) throws IOException {
			
			//??????user bean
			Optional<Users> op = uDao.findById(userid);
			Users user = op.get();
			
			//??????recipe bean
			Optional<Recipe> rop = rDao.findById(recipeid);
			Recipe recipe = rop.get();
			
			//????????????????????????
			boolean isExisits = frDao.existsByUsersAndRecipe(user, recipe);
			System.out.println(isExisits);
			
			//????????????
			HttpHeaders header = new HttpHeaders();
			header.setContentType(MediaType.IMAGE_PNG);
			
			//?????????????????? ??? ??????????????????
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
		
		//?????? + ?????????
		@PostMapping("/pressfavor/{usersid}/{recipeid}")
		@ResponseBody
		public void pressFavor(
				@PathVariable("usersid")Integer userid,
				@PathVariable("recipeid")Integer recipeid) {
			
			//??????user bean
			Optional<Users> op = uDao.findById(userid);
			Users user = op.get();
			
			//??????recipe bean
			Optional<Recipe> rop = rDao.findById(recipeid);
			Recipe recipe = rop.get();
			
			//????????????????????????
			boolean isExisits = frDao.existsByUsersAndRecipe(user, recipe);
			System.out.println(isExisits);
			
			//----------------------------------------------

			//?????????????????? ??? ???????????????????????????????????????
			if(isExisits) {
					
				frDao.deleteByUsersAndRecipe(user, recipe);
				
			}else {
				
				Favorite favor = new Favorite(user, recipe);
				frDao.save(favor);	
					
			}
			
		}
		
		// Foods List ??? Dto List
		public List<RecipeFoodsDto> changeFoodsToDto(Iterable<RecipeFoods> recipeFoods){
			List<RecipeFoodsDto> dtoList=new ArrayList<RecipeFoodsDto>();
			for(RecipeFoods rf : recipeFoods) {
				RecipeFoodsDto dto = new RecipeFoodsDto();
				dto.setFoodsId(rf.getRecipefoodsId());
				dto.setFoodsName(rf.getFoods().getFoodsName());
				dtoList.add(dto);
			}
			return dtoList;
		}
		

		//??????????????????by??????id
//		@GetMapping("recipe/find/foods/{recipeid}")
//		@ResponseBody
//		public List<RecipeFoodsDto> findFoodByRecipeId(@PathVariable("recipeid")Integer id) {
//			return null;
//		}
}
