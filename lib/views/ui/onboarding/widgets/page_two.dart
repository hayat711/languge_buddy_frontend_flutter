import 'package:flutter/material.dart';
import 'package:language_buddy/constants/color_scheme.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Image.asset('assets/images/page2.png',
                      fit: BoxFit.cover,
                    )
                  ),

              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "We are here to help you learn a new language!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: contentColor,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "We are here to help you learn a new language!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
