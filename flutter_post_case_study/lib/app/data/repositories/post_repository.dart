import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_post_case_study/core/enums/api_status_code.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../models/post_model.dart';
import '../providers/post_provider.dart';

class PostRepository {
  final PostProvider _provider;
  PostRepository(this._provider);

  static dynamic _parseJson(String text) {
    return jsonDecode(text);
  }


  // Ortak GET isteği.
  // API çağrısı yapar, status code kontrolü yapar,
  // JSON decode işlemini başlatır ve fromJson fonksiyonu ile modele dönüştürür.
  Future<T> _getRequest<T>({
    required Future<Response> Function() apiCall,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await apiCall();
      final bodyString = response.bodyString;
      if (response.statusCode == ApiStatusCode.ok.code && bodyString != null) {
        final decodedJson = await compute(_parseJson, bodyString);

        return fromJson(decodedJson);
      } else if (response.statusCode == ApiStatusCode.notFound.code) {
        throw Exception('Resource not found');
      } else {
        throw Exception('Error occurred with status code ${response.statusCode}');
      }
    } catch (e) {
        throw Exception('PostRepository error $e');
    }
  }

  // Tüm postları çeker (/posts). Gelen json listesini de modele dönüştürür.
  Future<List<PostModel>> fetchPosts() async {
    return _getRequest<List<PostModel>>(
      apiCall: _provider.getPosts,
      fromJson: (json) {
        final list = json as List<dynamic>;
        return list.map((e) => PostModel.fromJson(e)).toList();
      },
    );
  }

  // Belirli Bir id ye göre veri çeker - posts/{id}
  Future<PostModel> fetchPostById(int id) async {
    return _getRequest<PostModel>(
      apiCall: () => _provider.getPostById(id),
      fromJson: (json) => PostModel.fromJson(json),
    );
  }
}
