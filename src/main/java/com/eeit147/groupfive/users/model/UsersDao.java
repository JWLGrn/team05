package com.eeit147.groupfive.users.model;

import java.util.List;
import java.util.Optional;
import java.util.Set;

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
	

	public List<Users> findByemail(String email);
	
	public List<Users> findByUserNameLike(String userName);
	
	public Users findByRecipe(Recipe recipe);
	
	public List<Users> findByRecipeIn(List<Recipe> recipes);

}
