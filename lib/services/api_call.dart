import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/consts/api_consts.dart';
import 'package:news_app/models/blogs_model.dart';

class APICall {
  static Future<List<BlogsModel>> getAllNews() async {
    var uri = Uri.https(baseURL, '/api/rest/blogs');

    var response = await http.get(uri, headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    var data = jsonDecode(response.body);
    var blogsData = data['blogs'];
    return BlogsModel.blogsFromSnapshot(blogsData);
  }
}
