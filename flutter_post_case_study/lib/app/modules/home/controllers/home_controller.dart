import 'package:flutter_post_case_study/app/data/models/post_model.dart';
import 'package:flutter_post_case_study/app/data/repositories/post_repository.dart';
import 'package:flutter_post_case_study/app/data/services/post_filter_service.dart';
import 'package:flutter_post_case_study/core/enums/api_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PostRepository _repository; 
  final PostFilterService _filterService;  

  HomeController(this._repository, this._filterService);

  final RxList<PostModel> allPosts = <PostModel>[].obs;   
  final RxList<PostModel> filteredPosts = <PostModel>[].obs; 
  final RxList<String> categories = <String>[].obs;  
  final RxString selectedCategory = ''.obs; 
  final Rx<ApiState> state = ApiState.loading.obs;  
  final RxString currentQuery = ''.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchPostsFunc();
  }

  // API’den postları çeker ve kategori listesini oluşturur
  Future<void> fetchPostsFunc() async {
    try {
      final posts = await _repository.fetchPosts();
      allPosts.assignAll(posts);
      filteredPosts.assignAll(posts);

      final List<String> categoryList = posts
          .map((p) => p.category)
          .where((c) => c != null && c.isNotEmpty)
          .map((c) => c!)
          .toSet()
          .toList();
      categories.assignAll(categoryList);

      if (categoryList.isNotEmpty) {
        selectedCategory.value = categoryList[0];
      }

      state.value = ApiState.success;
    } catch (e) {
      state.value = ApiState.error;
    }
  }

  // Kategori değiştiğinde filtre uygular
  void changeCategoryFunc(String category) {
    selectedCategory.value = category;

    // Filtre ve arama birleştirilir
    List<PostModel> baseList = _filterService.filterByCategory(allPosts, category);
    filteredPosts.assignAll(_filterService.searchPosts(baseList, currentQuery.value));
    
    // Eğer sonuç yoksa
    if (filteredPosts.isEmpty) {
      state.value = ApiState.notFound;
    } else {
      state.value = ApiState.success;
    }
  }

  // Arama fonksiyonu
  void searchPostsFunc(String query) {
    currentQuery.value = query;

    List<PostModel> baseList = _filterService.filterByCategory(allPosts, selectedCategory.value);
    filteredPosts.assignAll(_filterService.searchPosts(baseList, query));

    if (filteredPosts.isEmpty) {
      state.value = ApiState.notFound;
    } else {
      state.value = ApiState.success;
    }
  }
}
