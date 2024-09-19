import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'image_view.dart';

class CircleImage extends StatelessWidget {
  String path;
  ImageType imageType;
  BoxFit fit;
  double radius;
  Color backgroundColor;
  Color foregroundColor;
  ImageProvider? backgroundImage;
  String placeHolderImagePath ;
  double? imageHeight;
  double? imageWidth;
  double outlineWidth;
  Color outlineColor;
  bool isBytes;
  Uint8List? imageData;

  CircleImage({
    required this.path,
    required this.imageType,
    this.fit = BoxFit.cover,
    this.radius = 50.0,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.white,
    this.backgroundImage,
    this.placeHolderImagePath = "assets/image/placeholder.png",
    this.imageHeight,
    this.imageWidth,
    this.outlineWidth = 0,
    this.outlineColor = Colors.transparent,
    this.isBytes = false,
    this.imageData,
  }) {
    if (imageHeight == null) {
      imageHeight = radius * 2;
    }
    if (imageWidth == null) {
      imageWidth = radius * 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: outlineColor,
      radius: radius + outlineWidth,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        foregroundColor: foregroundColor,
        radius: radius,
        child: isBytes
            ? Image.memory(
                imageData!,
                height: imageHeight,
                width: imageWidth,
                fit: fit,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    placeHolderImagePath,
                    height: imageHeight,
                    width: imageHeight,
                    fit: fit,
                  );
                },
              )
            : ImageView(
                path,
                imageType,
                height: imageHeight,
                width: imageWidth,
                fit: fit,
                placeHolderImagePath: placeHolderImagePath,
              ),
      ),
    );
  }
}
