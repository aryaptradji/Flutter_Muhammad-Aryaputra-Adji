import 'package:flutter/material.dart';

import '../model/gallery_model.dart';

class ImageArguments {
  final GalleryModel galleryModel;

  ImageArguments({required this.galleryModel});
}

class ImagePage extends StatefulWidget {
  final GalleryModel? galleryModel;

  const ImagePage({super.key, this.galleryModel});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  // @override
  // void initState() {
  //   openImage = widget.galleryModel!.assets;
  //   super.initState();
  // }

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
