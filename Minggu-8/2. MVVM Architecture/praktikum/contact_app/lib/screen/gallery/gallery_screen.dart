import 'package:flutter/material.dart';
import 'package:rest_api/screen/image/image_screen.dart';

import '../../constants/assets_constant.dart';
import '../../model/gallery_model.dart';

final List<GalleryModel> imageGallery = [
  GalleryModel(
      assets: Assets.assetsImagesMountain1, category: "Green Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain2, category: "Green Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain3, category: "Winter Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain4, category: "Green Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain5, category: "Aurora Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain6, category: "Winter Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain7, category: "Green Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain8, category: "Green Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain9, category: "Winter Mountain"),
  GalleryModel(
      assets: Assets.assetsImagesMountain10, category: "Aurora Mountain"),
];

List<String> filter = ["Green Mountain", "Aurora Mountain", "Winter Mountain"];

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedRoute = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        surfaceTintColor: Colors.transparent,
        elevation: 3,
        title: const Text("Gallery Image"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 100,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    "Pick a Page",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("Contact"),
              selected: _selectedRoute == 0,
              selectedTileColor: Colors.blue,
              selectedColor: Colors.white,
              onTap: () {
                setState(() {
                  _selectedRoute = 0;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/');
                });
              },
            ),
            ListTile(
              title: const Text("Gallery"),
              selected: _selectedRoute == 1,
              selectedTileColor: Colors.blue,
              selectedColor: Colors.white,
              onTap: () {
                setState(() {
                  _selectedRoute = 1;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/gallery-page');
                });
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20),
              scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 12,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child: Center(
                      child: Text(filter[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: imageGallery.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final imageData = imageGallery[index];
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isDismissible: false,
                          enableDrag: true,
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 7,
                                    child: Material(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  imageGallery[index].assets,
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                                const Text(
                                                    "Do you want to see the photo?"),
                                              ],
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue[50]),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) =>
                                                  //         ImagePage(
                                                  //             galleryModel:
                                                  //                 imageData),
                                                  //   ),
                                                  // );
                                                  Navigator.pushNamed(
                                                    context,
                                                    '/image-page',
                                                    arguments: ImageArguments(
                                                        galleryModel:
                                                            imageData),
                                                  );
                                                },
                                                child: const Text("Yes"),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red[50],
                                                    foregroundColor:
                                                        Colors.red),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("No"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Image.asset(
                                      imageGallery[index].assets,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            );
                          });
                    },
                    child: Image.asset(
                      imageGallery[index].assets,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
