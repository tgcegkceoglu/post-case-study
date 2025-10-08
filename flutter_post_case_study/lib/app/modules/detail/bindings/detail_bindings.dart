import 'package:flutter_post_case_study/app/data/providers/post_provider.dart';
import 'package:flutter_post_case_study/app/data/repositories/post_repository.dart';
import 'package:flutter_post_case_study/app/modules/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

// Detail sayfası için gerekli bağımlılıkları enjekte eder
class DetailBinding extends Bindings {
  @override
  void dependencies() {
    
    // Provider'ı lazy olarak başlatır (eğer yoksa)
    Get.lazyPut<PostProvider>(() => PostProvider());
    
    // Repository'yi lazy olarak başlatır (eğer yoksa)
    Get.lazyPut<PostRepository>(
      () => PostRepository(Get.find<PostProvider>()),
    );
    
    // Controller'ı başlatır
    Get.lazyPut<DetailController>(
      () => DetailController(Get.find<PostRepository>()),
    );
  }
}