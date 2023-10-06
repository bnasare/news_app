import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/consts/api_consts.dart';
import 'package:news_app/models/blogs_model.dart';

class APICall {
  // static Future<List<BlogsModel>> fetchBlogs() async {
  //   const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  //   const String adminSecret =
  //       '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  //   try {
  //     final response = await http.get(Uri.parse(url), headers: {
  //       'x-hasura-admin-secret': adminSecret,
  //     });

  //     if (response.statusCode == 200) {
  //       final List<BlogsModel> blogList = [];
  //       final Map<String, dynamic> jsonData = json.decode(response.body);

  //       if (jsonData.containsKey('blogs')) {
  //         final List<dynamic> blogData = jsonData['blogs'];
  //         for (final item in blogData) {
  //           blogList.add(BlogsModel.fromJson(item));
  //         }
  //         return blogList;
  //       } else {
  //         print('No "blogs" key found in the JSON response.');
  //         return [];
  //       }
  //     } else {
  //       print('Request failed with status code: ${response.statusCode}');
  //       return [];
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     return [];
  //   }
  // }

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
