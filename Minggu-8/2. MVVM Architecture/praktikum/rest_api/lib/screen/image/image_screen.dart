import 'package:flutter/material.dart';

import '../../model/gallery_model.dart';

class ImageArguments {
  final GalleryModel galleryModel;

  ImageArguments({required this.galleryModel});
}

class ImageScreen extends StatefulWidget {
  final GalleryModel? galleryModel;

  const ImageScreen({super.key, this.galleryModel});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String openImage = "";

  @override
  Widget build(BuildContext context) {
    final imageArguments =
        ModalRoute.of(context)!.settings.arguments as ImageArguments;

    openImage = imageArguments.galleryModel.assets;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Image.asset(
          openImage,
          width: 500,
          height: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
