package com.eeit147.groupfive.recipe.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface EventDao extends JpaRepository<Event, Integer> {
	
	
	@Query(value="select * FROM event order by time_end desc", nativeQuery = true)
	public List<Event> findAllOrderByTimeEndDesc();

}
