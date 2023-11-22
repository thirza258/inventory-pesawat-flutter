// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Model model;
  int pk;
  Fields fields;

  Item({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    model: modelValues.map[json["model"]]!,
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  int? user;
  String name;
  int amount;
  String description;
  Engine engine;
  bool winglet;
  String? image;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.description,
    required this.engine,
    required this.winglet,
    required this.image,

  });
  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    name: json["name"],
    amount: json["amount"],
    description: json["description"],
    engine: engineValues.map[json["engine"]]!,
    winglet: json["winglet"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "name": name,
    "amount": amount,
    "description": description,
    "engine": engineValues.reverse[engine],
    "winglet": winglet,
    "image": image,
  };
}

enum Engine {
  JET,
  PROPELLER
}

final engineValues = EnumValues({
  "Jet": Engine.JET,
  "Propeller": Engine.PROPELLER
});

enum Model {
  MAIN_ITEM
}

final modelValues = EnumValues({
  "main.item": Model.MAIN_ITEM
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
