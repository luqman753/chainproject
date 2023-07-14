// To parse this JSON data, do
//
//     final tags = tagsFromJson(jsonString);

import 'dart:convert';

List<Tags> tagsFromJson(String str) => List<Tags>.from(json.decode(str).map((x) => Tags.fromJson(x)));

String tagsToJson(List<Tags> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tags {
    Tags({
        this.id,
        this.name,
        this.isActive,
        this.v,
    });

    String ?id;
    String ?name;
    bool ?isActive;
    int ?v;

    factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        id: json["_id"],
        name: json["name"],
        isActive: json["isActive"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "isActive": isActive,
        "__v": v,
    };
}
