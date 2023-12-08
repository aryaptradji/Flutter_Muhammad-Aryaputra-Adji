import 'package:contact_app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/contact_model.dart';
import 'profile_picture_view_model.dart';

class ProfilePictureArguments {
  final ContactModel contactModel;

  ProfilePictureArguments({required this.contactModel});
}

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profPicProvider = Provider.of<ProfilePictureViewModel>(context);
    profPicProvider.initProfilePic(context);

    return Consumer<ProfilePictureViewModel>(
      builder: (context, profPicProvider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(
              profPicProvider.name!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body: Center(
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: profPicProvider != null
                      ? Utility.imageFromBase64String(
                          profPicProvider.profilePic!,
                        )
                      : const AssetImage("assets/people_account.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
