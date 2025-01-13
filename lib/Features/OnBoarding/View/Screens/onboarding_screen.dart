import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../Core/Const/colors.dart';
import '../../../../routing/routes.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() {
    context.pushNamed(Routes.loginScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          title: "Recycling",
          body:
              "We encourage recycling and responsible disposal to minimize electronic waste. By choosing eco-friendly options, we contribute to a greener tech future.",
          image: Image.asset('assets/images/onboared1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Living in Harmony with Nature",
          body:
              "We encourage recycling and responsible disposal to minimize electronic waste. By choosing eco-friendly options, we contribute to a greener tech future.",
          image: Image.asset('assets/images/onboared2.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(),
      onSkip: () => _onIntroEnd(),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      back: Icon(Icons.arrow_back, color: cPrimaryColor),
      skip: Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w600, color: cPrimaryColor)),
      next: Icon(Icons.arrow_forward, color: cPrimaryColor),
      done: Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: cPrimaryColor)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: cPrimaryColor,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
