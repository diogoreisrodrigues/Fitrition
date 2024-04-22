import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required  this.name,
    required  this.iconPath,
    required  this.boxColor,
  });

  List <CategoryModel> getCategories(){
      List <CategoryModel> categories = [];

      /*categories.add(
        CategoryModel( 
          name: 'Cake',
          iconPath: 'assets/icon/plate.svg',
          boxColor: Color.fromARGB(255, 142, 101, 150)
          )
      );

      categories.add(
        CategoryModel( 
          name: 'Salad',
          iconPath: 'assets/icon/pankakes.svg',
          boxColor: Color.fromARGB(255, 130, 120, 219)
          )
      );

      categories.add(
        CategoryModel( 
          name: 'Pie',
          iconPath: 'assets/icon/pie.svg',
          boxColor: Color.fromARGB(255, 142, 101, 150)
          )
      );

      categories.add(
        CategoryModel( 
          name: 'Smothies',
          iconPath: 'assets/icon/orange-snacks.svg',
          boxColor: Color.fromARGB(255, 130, 120, 219)
          )
      ); */

      return  categories;
  }
}