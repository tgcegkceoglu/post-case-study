import 'package:flutter/material.dart';
import 'package:flutter_post_case_study/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_post_case_study/app/routers/app_router.dart';
import 'package:flutter_post_case_study/app/widgets/button/custom_text_button.dart';
import 'package:flutter_post_case_study/app/widgets/card/post_card.dart';
import 'package:flutter_post_case_study/app/widgets/custom_textfield/custom_textfield_view.dart';
import 'package:flutter_post_case_study/app/widgets/state_handle_widget.dart';
import 'package:flutter_post_case_study/core/constants/image_constants.dart';
import 'package:flutter_post_case_study/core/constants/padding_constants.dart';
import 'package:flutter_post_case_study/core/extensions/theme_extensions.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Center(child: ImageConstants.menu.toSvgImage),
        surfaceTintColor: context.white,
        actionsPadding: PaddingConstants.right15Gap,
        elevation: 0,
        backgroundColor: context.white,
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              ImageConstants.avatar.toPng,
              width: context.width * .1,
              height: context.width * .1,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: PaddingConstants.all20Gap,
        child: Column(
          children: [
            // Arama alanı
            CustomTextfield(
              hintText: "Search",
              icon: Padding(
                padding: PaddingConstants.allMinGap,
                child: ImageConstants.search.toSvgImage,
              ),
              onChanged: controller.searchPostsFunc,
            ),

            // Kategori listesi horizontal scroll oluşturulur. Her kategori için bir CustomTextButton oluşturulur.
            Obx(() {
              return SizedBox(
                height: context.height * .15,
                child: ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(width: 30),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return Obx(() {
                      return CustomTextButton(
                        title: category,
                        isSelected:
                            controller.selectedCategory.value == category,
                        onPressed: () =>
                            controller.changeCategoryFunc(category),
                      );
                    });
                  },
                ),
              );
            }),

            // Post listesi
            Obx(() {
              return Expanded(
                child: StateHandlerWidget(
                  state: controller.state.value,
                  child: ListView.builder(
                    itemCount: controller.filteredPosts.length,
                    itemBuilder: (context, index) {
                      return PostCard(
                        post: controller.filteredPosts[index],
                        onPressed: () => Get.toNamed( // Post detayına yönlendirilir.
                          AppRoutes.detail,
                          arguments: controller
                              .filteredPosts[index]
                              .id, 
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
