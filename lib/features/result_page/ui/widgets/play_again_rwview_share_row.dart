import 'package:flutter/material.dart';

import 'clickable_icon_with_text.dart';

class PlayAgainReviewShareRow extends StatelessWidget {
  const PlayAgainReviewShareRow({
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
            text: 'Play Again',
            backGroudcolor: Colors.deepPurple,
            iconData: Icons.refresh,
            onTap: () {},
          ),
          ClickableIconWithText(
            text: 'Review Answer',
            backGroudcolor: Colors.cyan,
            iconData: Icons.remove_red_eye,
            onTap: () {},
          ),
          ClickableIconWithText(
            text: 'Share Score',
            backGroudcolor: Colors.green,
            iconData: Icons.share,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
