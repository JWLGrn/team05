package com.eeit147.groupfive.recipe.service;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.FoodsDao;
import com.eeit147.groupfive.recipe.model.KeywordDao;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeFoods;
import com.eeit147.groupfive.recipe.model.RecipeFoodsDao;
import com.eeit147.groupfive.recipe.model.RecipeKeyword;
import com.eeit147.groupfive.recipe.model.RecipeKeywordDao;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.users.model.FavoriteDao;
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
		Set<RecipeStep> stepSet = new LinkedHashSet<RecipeStep>();
		for (int i = 0; i < stepDescript.length; i++) {
			//新增步驟至步驟表
			RecipeStep rstep = new RecipeStep();
			rstep.setStep(i + 1);
			rstep.setStepDescription(stepDescript[i]);
			rstep.setStepPhoto("recipe" + recipeId + "_" + (i + 1) + ".jpeg");
			rstep.setRecipe(newRecipe);
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
			}
			//放入步驟Set
			stepSet.add(rstep);
		}

		// ---------------------------------------------------

		// 做關聯+新增總卡路里到食譜
		newRecipe.setCookPhoto("recipe" + newRecipe.getRecipeId() + ".jpeg");// 圖片標題
		newRecipe.setRecipeFoods(recipeFoodsSet);
		newRecipe.setTotalCal(totalCal);
		newRecipe.setRecipeKeyword(keywordSet);
		newRecipe.setRecipeStep(stepSet);
		rDao.save(newRecipe);

		return newRecipe;
	}

	// 食譜類
	public Recipe insertrecipe(Recipe recipe) {
		return rDao.save(recipe);
	}

	public List<Recipe> findRecipeByUser(@Param("userId") Integer userId) {
		return rDao.findAllRecipeByUser(userId);
	}

	public List<Recipe> findRecipeByRecipeId(@Param("recipeId") Integer recipeId) {
		return rDao.findAllRecipeByRecipeId(recipeId);
	}

}
