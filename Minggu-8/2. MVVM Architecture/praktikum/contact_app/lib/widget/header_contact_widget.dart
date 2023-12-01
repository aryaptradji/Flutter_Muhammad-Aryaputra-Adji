import 'package:flutter/material.dart';

import '../theme/theme_color.dart';
import '../theme/theme_text_style.dart';

class HeaderContactWidget extends StatelessWidget {
  const HeaderContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.contacts,
            color: ThemeColor().m3SysLightPurpleSecondary,
            size: 24,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Create New Contacts",
            style: ThemeTextStyle().m3HeadlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
            style: ThemeTextStyle().m3BodyMedium,
          ),
          const SizedBox(height: 8),
          const Divider()
        ],
      ),
    );
  }
}
