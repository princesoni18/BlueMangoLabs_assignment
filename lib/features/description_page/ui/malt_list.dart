import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:flutter/material.dart';


class Malt_list extends StatelessWidget {
  const Malt_list({
    super.key,
    required this.beer,
  });

  final Beers beer;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}