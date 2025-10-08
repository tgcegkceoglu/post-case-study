
import 'package:flutter_post_case_study/core/constants/api_constants.dart';
import 'package:get/get.dart';

class PostProvider extends GetConnect {
  @override

  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl; // API için temel URL atanıyor
    httpClient.timeout = const Duration(seconds: 30); // Her istek için maksimum 30 saniye bekleme süresi tanımlanıyor.
    
     // Tüm isteklere otomatik olarak eklenecek header tanımlanıyor.
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
    
    super.onInit();
  }


  // Tüm postları getirir
  Future<Response> getPosts() async {
    return await get(ApiConstants.posts);
    
  }

  // ID'ye göre tek bir post getirir
  Future<Response> getPostById(int id) async {
    return await get(ApiConstants.postDetail(id));
  }
}