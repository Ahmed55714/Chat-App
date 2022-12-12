import 'package:chat/ainmation.dart';
import 'package:chat/common/utils/colors.dart';
import 'package:chat/common/widgets/custom_buttom.dart';
import 'package:chat/features/landing/screens/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  Artboard? riveArtboard;

  late RiveAnimationController controllerStop;
  late RiveAnimationController controllerAccessible;
  late RiveAnimationController controllerIdle;

  @override
  void initState() {
    super.initState();
    controllerStop = SimpleAnimation(AnimationEnum.Stop.name);
    controllerAccessible = SimpleAnimation(AnimationEnum.Accessible.name);
    controllerIdle = SimpleAnimation(AnimationEnum.Idle.name);

    rootBundle.load('assets/hero_bot.riv').then((data) async {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 55),
            const Text(
              'Welcome to Badawy',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Rive(artboard: riveArtboard!),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: greyColor, fontSize: 12.5),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: CustomBotton(
                text: "AGREE AND CONTINUE",
                onPressed: () => navigateToLoginScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
