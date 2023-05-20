import 'package:flutter/material.dart';

const Color mainThemeColor = Color(0xFF75A341);

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage()
      )
  );
}

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ListPage())
      );
    });

    return Stack(
      children: [
        Container(
            color: mainThemeColor
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
              SizedBox(height: 8),
              Text(
                'Football App',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
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

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Hello World!'),
        )
    );
  }
}