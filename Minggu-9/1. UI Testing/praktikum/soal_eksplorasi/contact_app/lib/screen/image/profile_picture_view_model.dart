import 'package:flutter/cupertino.dart';
import 'profile_picture_screen.dart';

class ProfilePictureViewModel extends ChangeNotifier {
  String? _profilePic;
  String? get profilePic => _profilePic;

  String? _name;
  String? get name => _name;

  void initProfilePic(BuildContext context) {
    final profilePicArgs =
        ModalRoute.of(context)!.settings.arguments as ProfilePictureArguments;

    _name = profilePicArgs.contactModel.name;
    _profilePic = profilePicArgs.contactModel.photoName;
  }
}
