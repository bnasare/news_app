import 'package:flutter/material.dart';

class BlogsModel with ChangeNotifier {
  String? id;
  String? imageUrl;
  String? title;

  BlogsModel({this.id, this.imageUrl, this.title});

  BlogsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    title = json['title'];
  }

  static List<BlogsModel> blogsFromSnapshot(List blogsSnapshot) {
    return blogsSnapshot.map((data) {
      return BlogsModel.fromJson(data);
    }).toList();
  }
}
