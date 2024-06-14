import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const CustomCachedNetworkImage(
      {super.key, required this.imageUrl, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => const Icon(
        Icons.person,
        size: 55,
      ),
      progressIndicatorBuilder: (context, url, progress) =>
          CircularProgressIndicator(
        value: progress.progress,
      ),
    );
  }
}
