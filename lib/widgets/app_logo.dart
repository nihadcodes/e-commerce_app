
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/assets_path.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.logoApp,
      width: 100,
    );
  }
}