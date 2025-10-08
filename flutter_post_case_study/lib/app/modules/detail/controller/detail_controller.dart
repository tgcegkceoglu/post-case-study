// app/modules/detail/controllers/detail_controller.dart
import 'package:flutter_post_case_study/core/enums/api_state.dart';
import 'package:get/get.dart';
import '../../../data/models/post_model.dart';
import '../../../data/repositories/post_repository.dart';

class DetailController extends GetxController {
  final PostRepository _repository;

  DetailController(this._repository);


  final Rx<PostModel?> post = Rx<PostModel?>(null);  // Detayda gösterilecek gönderi post verisi
  final Rx<bool> isReadAll =false.obs;    // Gönderi içeriğinin tamamının gösterilip gösterilmeyeceğini belirler.
  final Rx<ApiState> state = ApiState.loading.obs; // API çağrısının durumunu izler (loading, success, error,not found)

  /// Controller başlatıldığında çalışır
  @override
  void onInit() {
    super.onInit();
   final postId = Get.arguments;  // Get.arguments üzerinden postId alınır. 
    if (postId != null) { // Eğer postId varsa detay verisi çekilir.
      fetchPostDetail(postId);
    }
  }

  // Belirtilen id’ye sahip gönderinin detayını çeker.
  // Repository üzerinden API çağrısı yapılır.
  // Başarılıysa post ve state güncellenir.
  // Hata olursa state ApiState.error yapılır.
  Future<void> fetchPostDetail(int id) async {
    try {
      final postData = await _repository.fetchPostById(id);
      post.value = postData;
      state.value = ApiState.success;
    } catch (e) {
      state.value = ApiState.error;
    }
  }
}