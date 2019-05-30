package ru.itis.springbootapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.springbootapp.models.Basket;
import ru.itis.springbootapp.models.Merch;

import java.util.HashMap;
import java.util.List;

public interface MerchRepository extends JpaRepository<Merch, Long> {
    List<Merch> findByBasket(Basket basket);
    int countAllById (Long id);
    int countMerchByBasketAndId(Basket basket, Long id);


}
