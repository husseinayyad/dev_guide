
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_guide/src/presentation/resources/assetsManager.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String? url ;
  final double? width,height;

  const ImageView({Key? key, this.url, this.width, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return    ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: CachedNetworkImage(
        imageUrl: url!,
        width: width,
        height: height,

        fit: BoxFit.fill,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(ImageAssets.appLogo,width: width,height: height,),

      ),
    );
  }
}
