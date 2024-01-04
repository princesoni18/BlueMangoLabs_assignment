import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:flutter/material.dart';

class ListElem extends StatelessWidget {

  final Beers beer;
  const ListElem({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
        ),
       
    
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Image.network(beer.imageUrl,fit: BoxFit.contain,)),details(beer: beer)
          ],
        )
      ),
    );
  }
}

class details extends StatelessWidget {
  const details({
    super.key,
    required this.beer,
  });

  final Beers beer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.only(top: 15,left: 8,right: 8),
      width: MediaQuery.of(context).size.width*0.5,
      child: Column(
    
        children: [
           
          Flexible(child: Text(beer.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),overflow: TextOverflow.ellipsis,maxLines: 1,),
          
          ),
          SizedBox(height: 5),
          Flexible(child: Text(beer.tagline,style: TextStyle(fontSize: 12),maxLines: 1,overflow: TextOverflow.ellipsis,)),
          SizedBox(height: 20),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("abv ${beer.abv}"),Text("ibu ${beer.ibu}")],),



          

          SizedBox(height: 10),

          ElevatedButton(onPressed: (){}, child: Text("view details"))
        ],
      ),
    );
  }
}