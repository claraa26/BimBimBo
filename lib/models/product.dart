import 'dart:convert';

List<Kdrama> welcomeFromJson(String str) => List<Kdrama>.from(json.decode(str).map((x) => Kdrama.fromJson(x)));

String kdramaToJson(List<Kdrama> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kdrama {
    Model model;
    int pk;
    Fields fields;

    Kdrama({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Kdrama.fromJson(Map<String, dynamic> json) => Kdrama(
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
    int user;
    String name;
    DateTime dateAdded;
    int amount;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.dateAdded,
        required this.amount,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        amount: json["amount"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "description": description,
    };
}

enum Model {
    MAIN_PRODUCT
}

final modelValues = EnumValues({
    "main.product": Model.MAIN_PRODUCT
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