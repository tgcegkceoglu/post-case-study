import 'package:flutter_post_case_study/app/modules/detail/bindings/detail_bindings.dart';
import 'package:flutter_post_case_study/app/modules/detail/views/detail_view.dart';
import 'package:flutter_post_case_study/app/modules/home/bindings/home_bindings.dart';
import 'package:flutter_post_case_study/app/modules/home/views/home_view.dart';
import 'package:flutter_post_case_study/app/routers/app_router.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// Uygulamanın tüm sayfa route’larını tanımlar.
// Her sayfa için GetPage kullanılır
// name: Route ismi
// page: Gidilecek View
// binding: Sayfaya özel bağımlılıkların (Controller, Service, Repository) enjekte edilmesi
class AppPages {
  static final pages = [
  
    // Ana sayfa
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    // Detay sayfası
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
  ];
}