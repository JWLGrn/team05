package com.eeit147.groupfive.users.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit147.groupfive.recipe.model.Recipe;

@Repository
public interface UsersDao extends JpaRepository<Users, Integer> {
	
	//查詢帳號密碼的語句
	@Query(value = "from Users where email = :email and password = :password ")
	public Optional<Users> findUsersByEmailandPassWord(@Param("email")String email,@Param("password")String password);
	
	//找User By email
	public List<Users> findByemail(String email);
	
	@Query(value = "from Users where email = :email ")
	public Users  findByemail02(@Param("email")String email);
	
	//模糊查詢User By 使用者名稱
	public List<Users> findByUserNameLike(String userName);
	
	//查詢User By 食譜
	public Users findByRecipe(Recipe recipe);
	
	//查詢User By 多筆食譜
	public List<Users> findByRecipeIn(List<Recipe> recipes);
	
	
	
	

}
