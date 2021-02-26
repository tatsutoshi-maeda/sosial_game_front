import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'header.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ButtonTheme(
          minWidth: size.width,
          height: size.height,
          child: FlatButton(
            color: Colors.white,
            child: Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Text(
                'ソシャゲ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
//              Header();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Header()),
              );
            },
          ),
        ),
      ),
    );
  }
}
