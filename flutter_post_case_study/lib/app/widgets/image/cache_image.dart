import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Ağdan gelen görselleri cache'leyerek gösterir
class CacheImage extends StatelessWidget {
  final String? image;
  final BoxFit? fit;
  const CacheImage({super.key,required this.image,this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: fit ?? BoxFit.cover,
    );
  }
}
