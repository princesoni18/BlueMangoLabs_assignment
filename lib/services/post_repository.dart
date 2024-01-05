import 'dart:convert';


import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PostRepo{


  static Future<List<Beers>>  Fetchposts(int page)async{

    const limit=15;

     var base="https://api.punkapi.com/v2/beers?page=$page&per_page=15";

     try{
      var response=await http.get(Uri.parse(base));
     
     
     List <dynamic> posts=jsonDecode(response.body);

     List<Beers> beers=[];

     for(int i=0;i<posts.length;i++){
      
       Map<String,dynamic> mp=posts[i];
       //print(mp['ingredients']);
      //Welcome  beer= Welcome(id: mp['id'], name: mp['name'], tagline: mp['tagline']);

      Beers beer =Beers.fromJson(mp);

    beers.add(beer);
     }
   
//print(model.ingredients.malt[0].amount);
     return beers;
     
     }
     catch(e){
      print(e.toString());
      return [];     }
  }

  static Future<List<Beers>> fetchByAbv(int page,RangeValues value)async{

     const limit=15;

     

     var base="https://api.punkapi.com/v2/beers?page=$page&per_page=10&abv_gt=${value.start}&abv_lt=${value.end}";

     try{
      var response=await http.get(Uri.parse(base));
    
      
     List <dynamic> posts=jsonDecode(response.body);

     List<Beers> beers=[];

     for(int i=0;i<posts.length;i++){
      
       Map<String,dynamic> mp=posts[i];
       

      Beers beer =Beers.fromJson(mp);

    beers.add(beer);
     }
   
     return beers;
     
     }
     catch(e){
      print("eroooooooooooooor");
      print(e.toString());
      return [];     }



  }

  static Future<List<Beers>> fetchByIbu(int page ,RangeValues value)async{

    const limit=15;

     

     var base="https://api.punkapi.com/v2/beers?page=$page&per_page=10&ibu_gt=${value.start}&ibu_lt=${value.end}";

     try{
      var response=await http.get(Uri.parse(base));
    
      
     List <dynamic> posts=jsonDecode(response.body);

     List<Beers> beers=[];

     for(int i=0;i<posts.length;i++){
      
       Map<String,dynamic> mp=posts[i];
       

      Beers beer =Beers.fromJson(mp);

    beers.add(beer);
     }
   
     return beers;
     
     }
     catch(e){
      print("eroooooooooooooor");
      print(e.toString());
      return [];     }



  }

}