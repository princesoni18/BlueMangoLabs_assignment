import 'package:dev_assignment/features/description_page/ui/hops_list.dart';
import 'package:dev_assignment/features/description_page/ui/malt_list.dart';
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
     Text("${beer.contributed_by}"), Text(beer.first_brewed),
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
     
        Malt_list(beer: beer),
      const SizedBox(height: 10,),
      Text("Hops-", style: TextStyle(fontSize: 16)),
     
         Hops_list(beer: beer),
        
      Divider(thickness: 2,),
      const SizedBox(height: 30,)
    ]);
  }
}



