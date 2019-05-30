package ru.itis.springbootapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.itis.springbootapp.models.Basket;
import ru.itis.springbootapp.models.Merch;
import ru.itis.springbootapp.models.User;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;


public interface BasketRepository extends JpaRepository<Basket, Long> {

    Optional<Basket> findBasketByUserId(Long Id);





    /*@Query(value = "INSERT INTO basket_merch (basket_id, merch_id) VALUES (:basketId, :merchId)", nativeQuery = true)
    int addblabla(@Param("basketId") Long basketId,@Param("merchId") Long merchId);*/

}
