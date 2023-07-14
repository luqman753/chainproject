// To parse this JSON data, do
//
//     final balance = balanceFromJson(jsonString);

import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
    Balance({
        this.message,
        this.data,
    });

    String ?message;
    Data ?data;

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.balance,
    });

    String ?id;
    double ?balance;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        balance: json["balance"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "balance": balance,
    };
}
