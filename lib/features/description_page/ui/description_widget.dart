import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:flutter/material.dart';
class description_widget extends StatelessWidget {
  const description_widget({
    super.key,
    required this.beer,
  });

  final Beers beer;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Divider(
        thickness: 1,
      ),
      const Text(
        "Description",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        beer.description,
      ),
      const Divider(
        thickness: 1,
      ),
      const Text(
        "Contributed by:",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(" ${beer.contributed_by}"), Text(beer.first_brewed)]),
      const Divider(
        thickness: 1,
      ),
      const Text("Ingredients :",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      const SizedBox(
        height: 5,
      ),
      const Text("Malt-",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      const SizedBox(
        height: 5,
      ),
     
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: beer.ingredients.malt.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("name- ${beer.ingredients.malt[index].name}",
                    style: TextStyle(fontSize: 14)),
                Text("amount - ${beer.ingredients.malt[index].amount.value}"),
                const SizedBox(
                  height: 5,
                ),
              ],
            );
          },
        ),
      const SizedBox(height: 10,),
      Text("Hops-", style: TextStyle(fontSize: 16)),
     
         ListView.builder(
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
        ),
        
      Divider(thickness: 2,),
      const SizedBox(height: 30,)
    ]);
  }
}