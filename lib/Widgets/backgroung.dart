import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  ExactAssetImage('images/aa.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:  BackdropFilter(
         filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
    );
  }
}
