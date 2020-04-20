import 'dart:convert';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  int type;
  AnimatedLogo({Key key, Animation<double> animation, Color colors, this.type})
      : super(
          key: key,
          listenable: animation,
        );

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    double s = 10;

    if (this.type == 1) {
      if (animation.value / 5 > 30) {
        s = -(animation.value / 5) + 70;
      } else {
        s = 80 - (-(animation.value / 5) + 70); // 10 11 12  10
      }
    } else if (this.type == 2) {
      if (animation.value / 5 > 30) {
        s = -(animation.value / 5) + 80;
      } else {
        s = 100 - (-(animation.value / 5) + 80);
      }
    } else {
      if (animation.value / 5 > 30) {
        s = -(animation.value / 5) + 60;
      } else {
        s = 60 - (-(animation.value / 5) + 60);
      }
    }

    return new Center(
      child: new Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              right: s.toDouble(),
              top: animation.value,
              child: ClipOval(
                child: Container(
                  color: Colors.red,
                  height: animation.value / 7,
                  width: animation.value / 7,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
