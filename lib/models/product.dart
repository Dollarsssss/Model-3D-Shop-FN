import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

 

class Product {
  final String image, title, description , quality , model;
  final int size, id, color;
  final double price;
 
  // final Color color;

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


   static Future<void> fetchProduct() async {
    final url = Uri.parse('http://192.168.1.9:3000/product');
    final headers = {'Content-Type': 'application/json'};

    final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  if (data is List<dynamic>) {
    products = data.map((item) {
        return Product(
          id: item['id'],
          title: item['title'],
          price: double.parse(item['price']),
          size: item['sizes'],
          description: item['description'],
          image: item['image'],
          color: item['color'],
          quality: item['quality'],
          model: item['model'],
        );
      
    }).toList();
  } else {
    throw Exception('Data is not a List<dynamic>');
  }
} else {
  print('Failed to load data: ${response.statusCode}');
}

  }
}

 List<Product> products = [];
// List<Product> products = [
  // Product(
  //     id: 1,
  //     title: "Shiba",
  //     price: 234,
  //     size: 8,
  //     description: dummyText,
  //     image: "assets/images/Shiba.png",
  //     color: const Color(0xFFD3A984),
  //     quality: "Moderate",
  //     model: "assets/models/shiba.glb"
  //   ),
     
     
  // Product(
  //     id: 2,
  //     title: "Sylvanian Persian Cat",
  //     price: 199,
  //     size: 14,
  //     description: dummyText,
  //     image: "assets/images/Sylvanian Persian Cat.png",
  //     color: const Color(0xFFEcd2d3),
  //     quality: "Amazing",
  //     model: "assets/models/sylvanian_persian_cat.glb"
  //     ),
  // Product(
  //     id: 3,
  //     title: "Felix The Cat",
  //     price: 234,
  //     size: 10,
  //     description: dummyText,
  //     image: "assets/images/Felix The Cat.png",
  //     color: const Color(0xFF989493),
  //     quality: "Moderate",
  //     model: "assets/models/felix_the_cat.glb"
  //     ),
  // Product(
  //     id: 4,
  //     title: "Old Car",
  //     price: 234,
  //     size: 10,
  //     description: dummyText,
  //     image: "assets/images/Old Car.png",
  //     color: const Color(0xFFD3A984),
  //     quality: "Genaral",
  //     model: "assets/models/pony_cartoon.glb"
  //     ),
  // Product(
  //     id: 5,
  //     title: "Stylized Mangrove",
  //     price: 234,
  //     size: 8,
  //     description: dummyText,
  //     image: "assets/images/Stylized Mangrove Greenhouse.png",
  //     color: const Color(0xFFFB7883),
  //     quality: "Amazing",
  //     model: "assets/models/stylized_mangrove_greenhouse.glb"
  //     ),
  // Product(
  //   id: 6,
  //   title: "Just a girl",
  //   price: 234,
  //   size: 12,
  //   description: dummyText,
  //   image: "assets/images/Just a girl.png",
  //   color: const Color(0xFF67526f),
  //   quality: "Amazing",
  //   model: "assets/models/just_a_girl.glb"
  // ),
//];

//String dummyText =
//   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";



  //  print('data is id :${data[0]['id'].runtimeType}');
  //       print('data is title :${data[0]['title'].runtimeType}');
  //       print('data is price :${data[0]['price'].runtimeType}');
  //       print('data is size :${data[0]['sizes'].runtimeType}');
  //       print('data is description :${data[0]['description'].runtimeType}');
  //       print('data is image :${data[0]['image'].runtimeType}');
  //       print('data is color :${data[0]['color'].runtimeType}');
  //       print('data is quality :${data[0]['quality'].runtimeType}');
  //       print('data is model  :${data[0]['model'].runtimeType}');
  
