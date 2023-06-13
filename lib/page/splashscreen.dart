import 'package:flutter/material.dart';
import 'login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Login())
      );
    });
    return Stack(
      children: [
        Container(
            color: Colors.green
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/football.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 8),
              const Text(
                'Football App',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.4)
                )
            )
        )
      ],
    );
  }
}
