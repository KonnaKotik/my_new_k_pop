package ru.itis.springbootapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.springbootapp.models.Merch;
import ru.itis.springbootapp.repositories.MerchRepository;

import java.util.List;

@Controller
public class AlbumController {
    @Autowired
    MerchRepository merchRepository;

    @GetMapping("/album")
    public String getApbumPage(Model model) {
        List<Merch> merches = merchRepository.findAll();
        model.addAttribute("merches", merches);
        return "merches_page";
    }




}
