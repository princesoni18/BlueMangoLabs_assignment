import 'package:dev_assignment/features/description_page/ui/description_widget.dart';
import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final Beers beer;
  const DescriptionPage({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Description"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    image: DecorationImage(
                        image: NetworkImage(beer.imageUrl),
                        fit: BoxFit.contain)),
              ),
              
              Divider(thickness: 1, color: Colors.grey),
              Text(
                beer.name,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              Text(
                beer.tagline,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  "Abv ${beer.abv.toString()}   Ibu ${beer.ibu ?? "Na".toString()}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 6,
              ),
              description_widget(beer: beer)
            ],
          ),
        ]),
      ),
    );
  }

  
}