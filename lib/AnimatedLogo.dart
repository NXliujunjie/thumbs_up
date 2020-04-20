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
      //第一条曲线
      if (animation.value / 5 > 30) {
        s = -(animation.value / 5) + 60;
      } else {
        s = 60 - (-(animation.value / 5) + 60);
      }
    } else if (this.type == 2) {
      //第二条曲线
      if (animation.value / 5 > 45) {
        s = -(animation.value / 5) + 60;
      } else {
        s = 30 - (-(animation.value / 5) + 60);
        if (s <= 0) {
          s = 0;
        }
      }
    } else if (this.type == 3) {
      //第三条曲线
      if (animation.value / 5 > 50) {
        s = -(animation.value / 5) + 60;
      } else {
        s = 20 - (-(animation.value / 5) + 60);
        if (s <= 0) {
          s = 0;
        }
      }
    } else {
      //第四条曲线
      if (animation.value / 5 > 40) {
        s = -(animation.value / 5) + 60;
      } else {
        s = 40 - (-(animation.value / 5) + 60);
        if (s <= 0) {
          s = 0;
        }
      }
    }

    return Positioned(
      right: s.toDouble(),
      top: animation.value + 10,
      child: ClipOval(
        child: Container(
          alignment: Alignment.centerLeft,
          height: animation.value / 7.5,
          width: animation.value / 7.5,
          child: this.type == 1
              ? Icon(
                  Icons.sentiment_dissatisfied,
                  size: animation.value / 7.5,
                )
              : this.type == 2
                  ? Icon(
                      Icons.sentiment_neutral,
                      size: animation.value / 7.5,
                    )
                  : Icon(
                      Icons.sentiment_satisfied,
                      size: animation.value / 7.5,
                    ),
        ),
      ),
    );
  }
}
