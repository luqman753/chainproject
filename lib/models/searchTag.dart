// To parse this JSON data, do
//
//     final searchTag = searchTagFromJson(jsonString);

import 'dart:convert';

SearchTag searchTagFromJson(String str) => SearchTag.fromJson(json.decode(str));

String searchTagToJson(SearchTag data) => json.encode(data.toJson());

class SearchTag {
    SearchTag({
        this.message,
        this.data,
    });

    String ?message;
    List<Datum> ?data;

    factory SearchTag.fromJson(Map<String, dynamic> json) => SearchTag(
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

    String ?id;
    String ?productName;
    String ?image;
    int ?purchasePrice;
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
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
    };
}
