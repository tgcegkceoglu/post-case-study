import 'package:flutter/material.dart';
import 'package:flutter_post_case_study/app/data/models/post_model.dart';
import 'package:flutter_post_case_study/app/widgets/image/cache_image.dart';
import 'package:flutter_post_case_study/core/constants/padding_constants.dart';
import 'package:flutter_post_case_study/core/extensions/theme_extensions.dart';


// Ana sayfadaki listelenen her bir postun kart tasarımı
class PostCard extends StatelessWidget {
  final PostModel post;
  final Future? Function() onPressed;
  const PostCard({super.key, required this.post,required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
       padding: PaddingConstants.bottom30Gap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Sol alan - Resim
            Expanded(
              flex: 2,
              child: AspectRatio(
                aspectRatio: 1.26,
                child: CacheImage(image: post.image)
              ),
            ),

            // Sağ alan - post bilgileri 
            Expanded(
              flex: 3,
              child: Padding(
                padding: PaddingConstants.hor20Gap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // post title
                    Padding(
                      padding: PaddingConstants.bottom5Gap,
                      child: Text(
                        post.title ?? "",
                        style: context.titleMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        // post yayınlanma tarihi
                        Text(
                          post.publishedDateText,
                          style: context.bodySmall,
                        ),

                        Padding(
                          padding: PaddingConstants.hor5Gap,
                          child: Icon(Icons.circle, color: context.grey, size: 5),
                        ),

                        // post min read 
                        Text(
                          post.readingTimeText,
                          style: context.bodySmall.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
