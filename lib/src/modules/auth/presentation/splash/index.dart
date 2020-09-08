import 'package:app/src/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/splash/splash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: AppTheme.primaryColor.withOpacity(0.5),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/logo/Logo-White.svg',
              width: 260,
              height: 260,
            ),
          ),
        ],
      ),
    );
  }
}
