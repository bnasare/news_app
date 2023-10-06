import 'package:news_app/models/blogs_model.dart';

class NewsModel {
  List<BlogsModel>? blogs;

  NewsModel({List<BlogsModel>? blogs});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      blogs = <BlogsModel>[];
      json['blogs'].forEach((v) {
        blogs!.add(BlogsModel.fromJson(v));
      });
    }
  }
}
