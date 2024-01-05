import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:flutter/material.dart';

class Hops_list extends StatelessWidget {
  const Hops_list({
    super.key,
    required this.beer,
  });

  final Beers beer;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
     itemCount: beer.ingredients.hops.length,
     itemBuilder: (context, index) {
       return Container(
         height: 50,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("name- ${beer.ingredients.hops[index].name}"),
             Text("amount - ${beer.ingredients.hops[index].amount.value}"),
             const SizedBox(
               height: 5,
             ),
           ],
         ),
       );
     },
        );
  }
}