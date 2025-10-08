import 'package:flutter_post_case_study/app/data/models/post_model.dart';

class PostFilterService {
  
  //  Belirtilen kategoriye ait postlar listelenir ve return edilir.
  List<PostModel> filterByCategory(List<PostModel> posts, String category) {
    return posts.where((p) => p.category == category).toList();
  }

  // Belirli bir arama sorgusuna göre postlar filtrelenir. Title ile eşlenen arama sonuçları varsa listelenir ve return edilir 
  List<PostModel> searchPosts(List<PostModel> posts, String query) {
    if (query.isEmpty) return posts;

    return posts.where((p) => p.title?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
  }
}
