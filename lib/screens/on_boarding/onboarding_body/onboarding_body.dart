import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_router/go_router.dart';
import '../../../package/package/package.dart';
import '../../../utility/utility/utility.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets1505,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),

          ImageShower(
            imageUrl: onboardingOne,
            imgType: ImgType.local,
            fit: BoxFit.fitWidth,
            width: getScreenWidth(kLayoutWidth*4/5),
          ),
          SizedBox(height: getScreenHeight(kLayoutHeight * 1 / 8)),
          AutoSizeText(
            onboardingTextOne,
            style: gideonRoman(
              weight: fw7,
              size: getScreenWidth(kLayoutWidth * 1 / 15),
              color: theme.colorScheme.onSecondaryContainer,
            ),
            maxLines: 2,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: getScreenHeight(kLayoutHeight * 1 / 12)),
          ElButton(
            text: onboardingBtnText,
            style: gQuan(color: kGolden),
            onTap: () => context.go(Screen.login.path),
          ),
          SizedBox(height: getScreenHeight(kLayoutHeight * 1 / 20)),
        ],
      ),
    );
  }
}
