import 'package:dev_assignment/features/description_page/ui/description_page.dart';
import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:flutter/material.dart';

class ListElem extends StatelessWidget {

  final Beers beer;
  const ListElem({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionPage(beer: beer),)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
    
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
    
             boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100, // Shadow color
              spreadRadius: 3, // Spread radius
              blurRadius: 3, // Blur radius
              offset: Offset(0, 3), // Offset in x and y
            ),
          ],
          
          ),
         
      
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.all(16),
                child: Image.network(beer.imageUrl,fit: BoxFit.contain,))),details(beer: beer)
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
      ),
      
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
          Text(beer.first_brewed)

         // ElevatedButton(onPressed: (){}, child: Text("view details"))
        ],
      ),
    );
  }
}