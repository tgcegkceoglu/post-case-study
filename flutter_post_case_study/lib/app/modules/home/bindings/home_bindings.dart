import 'package:flutter_post_case_study/app/data/providers/post_provider.dart';
import 'package:flutter_post_case_study/app/data/repositories/post_repository.dart';
import 'package:flutter_post_case_study/app/data/services/post_filter_service.dart';
import 'package:flutter_post_case_study/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

// Home sayfası için gerekli bağımlılıkları enjekte eder
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Provider'ı lazy olarak başlatır (ilk kullanımda)
    Get.lazyPut<PostProvider>(() => PostProvider());
    
    // Repository'yi lazy olarak başlatır
    Get.lazyPut<PostRepository>(
      () => PostRepository(Get.find<PostProvider>()),
    );

    // Service'i lazy olarak başlatır (filtreleme ve arama işlemleri için)
    Get.lazyPut<PostFilterService>(() => PostFilterService());
    
    // Controller ve service lazy olarak başlatır
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<PostRepository>(),Get.find<PostFilterService>()),
    );
  }
}