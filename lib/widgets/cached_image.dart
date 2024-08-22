import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  BoxFit fit;
  double? imageHeight;
   CachedImage({super.key, this.imageUrl, this.fit=BoxFit.cover, this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: fit,
        height: imageHeight,
        errorWidget: (context, url, error) => Container(color: Colors.red[500]),
        placeholder: (context, url) => Container(color: Colors.grey),
      ),
    ); 
  }
}
 