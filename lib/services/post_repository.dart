import 'dart:convert';


import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:http/http.dart' as http;
class PostRepo{


  static Future<List<Beers>>  Fetchposts(int page)async{

    const limit=15;

     var base="https://api.punkapi.com/v2/beers?page=$page&per_page=10";

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
    Beers model=beers[0];
//print(model.ingredients.malt[0].amount);
     return beers;
     
     }
     catch(e){
      print(e.toString());
      return [];     }
  }

}