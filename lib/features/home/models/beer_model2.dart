// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



//Welcome welcomeFromJson(dynamic str) => Welcome.fromJson(str );

//String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Beers {
    int id;
    String name;
    String tagline;
     String first_brewed;
     String description;
     String imageUrl;
     double abv;
     double ibu;
     double target_fg;
     double target_og;
    
    Ingredients ingredients;
   
     String brewers_tips;
     String contributed_by;

    Beers({
        required this.id,
        required this.name,
        required this.tagline,
         required this.first_brewed,
         required this.description,
         required this.imageUrl,
         required this.abv,
         required this.ibu,
         required this.target_fg,
         required this.target_og,
         required this.ingredients,
       
      
        required this.brewers_tips,
         required this.contributed_by,
    });

    factory Beers.fromJson(Map<String, dynamic> json) => Beers(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        first_brewed: json["first_brewed"],
         description: json["description"],
         imageUrl: json["image_url"],
         abv: json["abv"].toDouble(),
         ibu: json["ibu"].toDouble(),
         target_fg: json["target_fg"].toDouble(),
         target_og: json["target_og"].toDouble(),
          ingredients: Ingredients.fromJson(json["ingredients"]),
       
     
      
         brewers_tips: json["brewers_tips"],
         contributed_by: json["contributed_by"],
    );

   
}
class Ingredients {
    List<Malt> malt;
    List<Hop> hops;
    String yeast;

    Ingredients({
        required this.malt,
        required this.hops,
        required this.yeast,
    });

    factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        malt: List<Malt>.from(json["malt"].map((x) => Malt.fromJson(x))),
        hops: List<Hop>.from(json["hops"].map((x) => Hop.fromJson(x))),
        yeast: json["yeast"],
    );

    Map<String, dynamic> toJson() => {
        "malt": List<dynamic>.from(malt.map((x) => x.toJson())),
        "hops": List<dynamic>.from(hops.map((x) => x.toJson())),
        "yeast": yeast,
    };
}

class Hop {
    String name;
    BoilVolume amount;
    String add;
    String attribute;

    Hop({
        required this.name,
        required this.amount,
        required this.add,
        required this.attribute,
    });

    factory Hop.fromJson(Map<String, dynamic> json) => Hop(
        name: json["name"],
        amount: BoilVolume.fromJson(json["amount"]),
        add: json["add"],
        attribute: json["attribute"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount.toJson(),
        "add": add,
        "attribute": attribute,
    };
}

class Malt {
    String name;
    BoilVolume amount;

    Malt({
        required this.name,
        required this.amount,
    });

    factory Malt.fromJson(Map<String, dynamic> json) => Malt(
        name: json["name"],
        amount: BoilVolume.fromJson(json["amount"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount.toJson(),
    };
}
class BoilVolume {
    double value;
    Unit unit;

    BoilVolume({
        required this.value,
        required this.unit,
    });

    factory BoilVolume.fromJson(Map<String, dynamic> json) => BoilVolume(
        value: json["value"]?.toDouble(),
        unit: unitValues.map[json["unit"]]!,
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unitValues.reverse[unit],
    };
}
enum Unit {
    CELSIUS,
    GRAMS,
    KILOGRAMS,
    LITRES
}

final unitValues = EnumValues({
    "celsius": Unit.CELSIUS,
    "grams": Unit.GRAMS,
    "kilograms": Unit.KILOGRAMS,
    "litres": Unit.LITRES
});
class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}




