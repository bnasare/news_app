import 'package:flutter/material.dart';

class NewsModels with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;

  NewsModels({required this.id, required this.title, required this.imageUrl});
}
