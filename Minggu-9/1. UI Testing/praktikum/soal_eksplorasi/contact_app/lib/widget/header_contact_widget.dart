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
            Icons.perm_contact_calendar_sharp,
            color: ThemeColor().m3SysLightPurpleSecondary,
            size: 24,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "My Contacts",
            style: ThemeTextStyle().m3HeadlineSmall,
          ),
          const SizedBox(height: 20),
          const Divider()
        ],
      ),
    );
  }
}
