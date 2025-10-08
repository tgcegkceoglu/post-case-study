//  Uygulamada kullanılan tüm API URL’lerini tek bir yerde toplar.
class ApiConstants {
  static const String baseUrl = 'https://jsonplaceholder.org';
  static const String posts = '/posts';
  static String postDetail(int id) => '/posts/$id';
}