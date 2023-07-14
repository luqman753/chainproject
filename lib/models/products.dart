// class Products {
//   String? message;
//   List<Data>? data;

//   Products({this.message, this.data});

//   Products.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   String? sId;
//   String? productName;
//   String? image;
//   int? purchasePrice;
//   int? profit;
//   int? marketShare;
//   int? gst;
//   int? salePrice;
//   int? quantity;
//   String? tags;
//   bool? isActive;
//   String? createdAt;
//   int? iV;

//   Data(
//       {this.sId,
//       this.productName,
//       this.image,
//       this.purchasePrice,
//       this.profit,
//       this.marketShare,
//       this.gst,
//       this.salePrice,
//       this.quantity,
//       this.tags,
//       this.isActive,
//       this.createdAt,
//       this.iV});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     productName = json['productName'];
//     image = json['image'];
//     purchasePrice = json['purchasePrice'];
//     profit = json['profit'];
//     marketShare = json['marketShare'];
//     gst = json['gst'];
//     salePrice = json['salePrice'];
//     quantity = json['quantity'];
//     tags = json['tags'];
//     isActive = json['isActive'];
//     createdAt = json['createdAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['productName'] = this.productName;
//     data['image'] = this.image;
//     data['purchasePrice'] = this.purchasePrice;
//     data['profit'] = this.profit;
//     data['marketShare'] = this.marketShare;
//     data['gst'] = this.gst;
//     data['salePrice'] = this.salePrice;
//     data['quantity'] = this.quantity;
//     data['tags'] = this.tags;
//     data['isActive'] = this.isActive;
//     data['createdAt'] = this.createdAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// // // // // // // // // // // // //

// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    Products({
        this.message,
        this.data,
    });

    String? message;
    List<Datum>? data;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
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
        this.productName,
        this.image,
        this.purchasePrice,
        this.profit,
        this.marketShare,
        this.gst,
        this.salePrice,
        this.quantity,
        this.tags,
        this.isActive,
        this.createdAt,
        this.v,
    });

    String? id;
    String ?productName;
    String ?image;
    int? purchasePrice;
    int ?profit;
    int ?marketShare;
    int ?gst;
    int ?salePrice;
    int ?quantity;
    String? tags;
    bool ?isActive;
    DateTime? createdAt;
    int ?v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        productName: json["productName"],
        image: json["image"],
        purchasePrice: json["purchasePrice"],
        profit: json["profit"],
        marketShare: json["marketShare"],
        gst: json["gst"],
        salePrice: json["salePrice"],
        quantity: json["quantity"],
        tags: json["tags"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productName": productName,
        "image": image,
        "purchasePrice": purchasePrice,
        "profit": profit,
        "marketShare": marketShare,
        "gst": gst,
        "salePrice": salePrice,
        "quantity": quantity,
        "tags": tags,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
    };
}
