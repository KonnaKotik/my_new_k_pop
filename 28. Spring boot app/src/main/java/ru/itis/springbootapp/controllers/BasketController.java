package ru.itis.springbootapp.controllers;

import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.itis.springbootapp.models.Basket;
import ru.itis.springbootapp.models.Merch;
import ru.itis.springbootapp.repositories.BasketRepository;
import ru.itis.springbootapp.repositories.MerchRepository;
import ru.itis.springbootapp.security.UserDetailsImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Controller
public class BasketController {


    @Autowired
    private BasketRepository basketRepository;

    @Autowired
    private MerchRepository merchRepository;


    @RequestMapping(value = "/album", method = RequestMethod.POST)
   // @ResponseBody
    public ResponseEntity addMerchInBacket(Authentication authentication,
                                                   @RequestParam(name = "merch_id") Long merch_id) {
        System.out.println(merch_id);
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        Long id = userDetails.getIdUser();
        Merch merch = merchRepository.findById(merch_id).get();
        Basket basket = basketRepository.findBasketByUserId(id).get();
        List<Merch> merches =basket.getProducts();
        merches.add(merch);
        basket.setProducts(merches);
        basketRepository.save(basket);

        //basketRepository.addblabla(basket.get().getId(), merch.get().getId());

        return ResponseEntity.status(200).build();
    }

    @GetMapping("/basket")
    public String getBasketByUser(Model model, Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        Long id = userDetails.getIdUser();
        Basket basket = basketRepository.findBasketByUserId(id).get();
        List<Merch> products = merchRepository.findByBasket(basket);
        HashMap<Merch, Integer> hashProducts = new HashMap<>();
        for (Merch product : products) {
            hashProducts.put(product, merchRepository.countMerchByBasketAndId(basket, product.getId()));
        }
        model.addAttribute("products", hashProducts);
        return "basket_page";
    }

    @RequestMapping(value = "/basket", method = RequestMethod.POST)
    // @ResponseBody
    public String deleteMerch(Authentication authentication,
                                           @RequestParam(name = "merchId") Long merchId) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        Long id = userDetails.getIdUser();
        Merch merch = merchRepository.findById(merchId).get();
        Basket basket = basketRepository.findBasketByUserId(id).get();
        List<Merch> merches =basket.getProducts();
        merches.remove(merch);
        basket.setProducts(merches);
        basketRepository.save(basket);
        return "redirect:/basket";
    }
}
