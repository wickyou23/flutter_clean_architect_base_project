import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import '../../app.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({required this.onPressed, super.key});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      key: key,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        children: [
          Text(S.current.seeMore, style: AppTextStyles.buttonText12()),
          Icon(
            Icons.chevron_right,
            size: Dimens.d18.responsive(),
            color: AppColors.current.buttonTextColor,
          ),
        ],
      ),
    );
  }
}
