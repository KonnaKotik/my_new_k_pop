package ru.itis.springbootapp.models;

import lombok.*;

import javax.persistence.*;
import java.util.HashMap;
import java.util.List;


@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "shop_merch")

public class Merch {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private  String name;
    private Double price;
    private String img;


    @ManyToMany(mappedBy = "products")
    private List<Basket> basket;
}


