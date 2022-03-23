import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CustomNetworkImage extends StatefulWidget {
  CustomNetworkImage({
    Key? key,
    required this.imagePath,
    required this.boxfit,
    required this.borderRadius,
    required this.height,
  }) : super(key: key);
  String imagePath;
  BoxFit boxfit;

  double borderRadius;
  double height;

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imagePath,
      fit: widget.boxfit,
      colorBlendMode: BlendMode.darken,
      imageBuilder: (context, imageProvider) => Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: widget.boxfit,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        height: widget.height,
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: double.infinity,
            borderRadius: BorderRadius.all(
              Radius.circular(
                widget.borderRadius,
              ),
            ),
            height: widget.height,
          ),
        ),
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error_outline_rounded),
    );
  }
}
