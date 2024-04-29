import 'package:flutter/material.dart';

class Product {
  final String image, title, description , quality , model;
  final int price, size, id;
  final Color color;

  Product(
    {
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color,
      required this.quality,
      required this.model,
    }
  );
}

List<Product> products = [
  Product(
      id: 1,
      title: "Shiba",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/Shiba.png",
      color: Color(0xFFD3A984),
      quality: "Moderate",
      model: "assets/models/shiba.glb"
    ),
     
     
  Product(
      id: 2,
      title: "Sylvanian Persian Cat",
      price: 199,
      size: 14,
      description: dummyText,
      image: "assets/images/Sylvanian Persian Cat.png",
      color: Color(0xFFEcd2d3),
      quality: "Amazing",
      model: "assets/models/sylvanian_persian_cat.glb"
      ),
  Product(
      id: 3,
      title: "Felix The Cat",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/Felix The Cat.png",
      color: Color(0xFF989493),
      quality: "Moderate",
      model: "assets/models/felix_the_cat.glb"
      ),
  Product(
      id: 4,
      title: "Old Car",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/Old Car.png",
      color: Color(0xFFD3A984),
      quality: "Genaral",
      model: "assets/models/pony_cartoon.glb"
      ),
  Product(
      id: 5,
      title: "Stylized Mangrove",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/Stylized Mangrove Greenhouse.png",
      color: Color(0xFFFB7883),
      quality: "Amazing",
      model: "assets/models/stylized_mangrove_greenhouse.glb"
      ),
  Product(
    id: 6,
    title: "Just a girl",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/Just a girl.png",
    color: Color(0xFF67526f),
    quality: "Amazing",
    model: "assets/models/just_a_girl.glb"
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
