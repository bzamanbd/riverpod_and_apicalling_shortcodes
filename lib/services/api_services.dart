import 'dart:convert' as converter;
import 'package:flutter/material.dart';
import 'package:riverpod_and_apicalling/models/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const _baseUrl = "https://jsonplaceholder.typicode.com";
  static const _endPoint = "/posts";
  Future<List<PostModel>> getAllPost() async {
    List<PostModel> allPosts = [];
    try {
      Uri url = Uri.parse("$_baseUrl$_endPoint");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final result = converter.jsonDecode(response.body);
        for (var e in result) {
          PostModel post = PostModel.fromMap(e);
          allPosts.add(post);
        }
      }
    } catch (e) {
      Center(child: Text(e.toString()));
    }
    return allPosts;
  }
}
