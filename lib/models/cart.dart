// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    Cart({
        this.message,
        this.data,
    });

    String? message;
    List<Datum>? data;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.productId,
        this.userId,
        this.quantity,
        this.price,
        this.isActive,
        this.createdAt,
        this.v,
        this.productName,
        this.image,
        this.salePrice,
        this.tags,
    });

    String ?id;
    String ?productId;
    String ?userId;
    int ?quantity;
    int ?price;
    bool ?isActive;
    DateTime? createdAt;
    int ?v;
    String ?productName;
    String ?image;
    int ?salePrice;
    String? tags;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        productId: json["productId"],
        userId: json["userId"],
        quantity: json["quantity"],
        price: json["price"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        productName: json["productName"],
        image: json["image"],
        salePrice: json["salePrice"],
        tags: json["tags"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productId": productId,
        "userId": userId,
        "quantity": quantity,
        "price": price,
        "isActive": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
        "productName": productName,
        "image": image,
        "salePrice": salePrice,
        "tags": tags,
    };
}
