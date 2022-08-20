package com.eeit147.groupfive.users.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface FollowDao extends JpaRepository<Follow, Integer> {

	//查詢users and track是否有該關聯
		public Boolean existsByUsersAndTrack(Users users,Users track);
	//刪除users and track的關聯
		public void deleteByUsersAndTrack(Users users,Users track);
}
