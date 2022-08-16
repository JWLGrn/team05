package com.eeit147.groupfive.users.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportDao extends JpaRepository<Report, Integer> {

}
