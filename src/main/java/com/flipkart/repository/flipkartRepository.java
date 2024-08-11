package com.flipkart.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flipkart.model.flipkartModel;

public interface flipkartRepository extends JpaRepository<flipkartModel, Integer> {


}
