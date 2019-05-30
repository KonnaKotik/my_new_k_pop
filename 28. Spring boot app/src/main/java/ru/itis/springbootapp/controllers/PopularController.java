package ru.itis.springbootapp.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.springbootapp.models.Basket;
import ru.itis.springbootapp.models.Merch;
import ru.itis.springbootapp.repositories.BasketRepository;
import ru.itis.springbootapp.repositories.MerchRepository;

import java.util.*;
import java.util.stream.Stream;

@Controller
public class PopularController {
    @Autowired
    MerchRepository merchRepository;

    @Autowired
    BasketRepository basketRepository;

    @GetMapping("/popular")
    public String getPopularPage(Model model) {
        List<Basket> baskets = basketRepository.findAll();
        List<Merch> merches = merchRepository.findAll();
        HashMap<Merch, Integer> countOfMerch = new HashMap<>();

        for(int i = 0; i < merches.size(); i++) {
            countOfMerch.put(merches.get(i), 0);
        }

        for(int i = 0; i < baskets.size(); i++) {
            for(int j = 0; j < merches.size(); j ++) {
                int count = countOfMerch.get(merches.get(j));
                count += merchRepository.countMerchByBasketAndId(baskets.get(i), merches.get(j).getId());
                countOfMerch.put(merches.get(j), count);
            }
        }

        List<Map.Entry<Merch, Integer>> list = new LinkedList<>(countOfMerch.entrySet());
        for(int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getKey().getName());
        }
        Collections.sort(list, (o1, o2) -> o1.getValue().compareTo(o2.getValue()));

        Map<Merch, Integer> result = new LinkedHashMap<>();
        for(Map.Entry<Merch, Integer> entry : list) {
            result.put(entry.getKey(), entry.getValue());
        }

        for(int i = 0; i < result.size(); i++) {
            System.out.println(result.get(i));
        }



       model.addAttribute("merches", result);

        return "popular_page";
    }
}
