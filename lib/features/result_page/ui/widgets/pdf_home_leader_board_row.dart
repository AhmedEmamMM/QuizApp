import 'package:flutter/material.dart';

import '../../../home_page/ui/home_page.dart';
import 'clickable_icon_with_text.dart';

class PdfHomeLaeaderBoardRow extends StatelessWidget {
  const PdfHomeLaeaderBoardRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClickableIconWithText(
            text: 'Create PDF',
            backGroudcolor: Colors.red,
            iconData: Icons.picture_as_pdf,
            onTap: () {},
          ),
          ClickableIconWithText(
            text: 'Home',
            backGroudcolor: Colors.blue,
            iconData: Icons.home,
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomaPage(),
                )),
          ),
          ClickableIconWithText(
            text: 'LeaderBoard',
            backGroudcolor: Colors.grey,
            iconData: Icons.settings,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
