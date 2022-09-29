import 'package:flutter/cupertino.dart';

class DataModel{
  String name;
  String img;
  int price;
  int stars;
  String description;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.stars,
    required this.description,

});
  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(name: json["name"],
    img: json["img"],
  price: json["price"],
  stars: json["star"],
  description: json["description"]);
  }



}