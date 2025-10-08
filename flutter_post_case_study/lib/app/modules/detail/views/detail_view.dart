import 'package:flutter/material.dart';
import 'package:flutter_post_case_study/app/data/models/post_model.dart';
import 'package:flutter_post_case_study/app/modules/detail/controller/detail_controller.dart';
import 'package:flutter_post_case_study/app/widgets/button/primary_button.dart';
import 'package:flutter_post_case_study/app/widgets/image/cache_image.dart';
import 'package:flutter_post_case_study/app/widgets/state_handle_widget.dart';
import 'package:flutter_post_case_study/core/constants/image_constants.dart';
import 'package:flutter_post_case_study/core/constants/padding_constants.dart';
import 'package:flutter_post_case_study/core/extensions/theme_extensions.dart';
import 'package:get/get.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.white,
       // Üstte geri tuşu ve menü ikonu olan AppBar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        surfaceTintColor: context.white,
        actionsPadding: PaddingConstants.right15Gap,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Center(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14),
              child: ImageConstants.menu.toSvgImage,
            ),
          ),
        ],
      ),

      body: Obx(() {
        bool isRead = controller.isReadAll.value;
        PostModel? value = controller.post.value;

        return StateHandlerWidget(
          state: controller.state.value,
          child: Stack(
            children: [
              // Post görseli
              SizedBox(
                height: context.height,
                width: double.infinity,
                child: CacheImage(image: value?.image, fit: BoxFit.fill),
              ),

               // İçerik paneli - animasyonlu şekilde yukarı çıkar / iner
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                bottom: isRead ? 0 : -context.height * .5,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    /// "Read All" veya "Read Less" butonu
                    PrimaryButton(
                      title: isRead ? "Read Less" : "Read All",
                      onPressed: () {
                        controller.isReadAll.value = !controller.isReadAll.value; // Kullanıcı tıkladığında içerik genişletilir veya daraltılır.
                      },
                    ),

                    // İçeriğin bulunduğu beyaz alan
                    Container(
                      color: context.white,
                      margin: PaddingConstants.top15Gap,
                      padding: PaddingConstants.all20Gap,
                      height: context.height *.75,
                      child: ListView(
                        padding: PaddingConstants.zero,
                        physics: isRead ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: PaddingConstants.bottom15Gap,
                            child: Text(
                              value?.title ?? '',
                              style: context.titleMedium.copyWith(
                                color: context.black,
                              ),
                            ),
                          ),
                          Text(
                            value?.content ?? '',
                            style: context.bodySmall.copyWith(height: 1.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
