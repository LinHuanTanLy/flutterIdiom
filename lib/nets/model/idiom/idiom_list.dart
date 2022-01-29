// To parse this JSON data, do
//
//     final idiomList = idiomListFromJson(jsonString);

import 'dart:convert';

IdiomList idiomListFromJson(String str) => IdiomList.fromJson(json.decode(str));

String idiomListToJson(IdiomList data) => json.encode(data.toJson());

class IdiomList {
    IdiomList({
        this.id,
        this.groupId,
        this.imgUrl,
        this.answer,
    });

    int? id;
    int? groupId;
    String? imgUrl;
    String? answer;

    factory IdiomList.fromJson(Map<String, dynamic> json) => IdiomList(
        id: json["id"],
        groupId: json["groupId"],
        imgUrl: json["imgUrl"],
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "groupId": groupId,
        "imgUrl": imgUrl,
        "answer": answer,
    };
}
