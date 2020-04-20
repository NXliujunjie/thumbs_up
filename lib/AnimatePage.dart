import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_list/AnimatedLogo.dart';

class AnimatePage extends StatefulWidget {
  @override
  _AnimatePageState createState() => _AnimatePageState();
}

class _AnimatePageState extends State<AnimatePage>
    with TickerProviderStateMixin {
  StreamController<List<Widget>> widgetListStreamController =
      StreamController();

  List<Widget> list = List();
  List<AnimationController> animationControllerList = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widgetListStreamController.close();

    // animationControllerList.map((v) {
    //   print("object");
    //   v.dispose();
    // });

    for (AnimationController c in animationControllerList) {
      print("object");
       c.dispose();
    }
   
    list.clear();

    animationControllerList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点赞动画"),
      ),
      body: StreamBuilder(
        stream: widgetListStreamController.stream,
        initialData: <Widget>[],
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if (snapshot.data != null) {
            return Container(
              color: Colors.yellow,
              width: 150,
              height: 300,
              child: Stack(
                children: snapshot.data.map((f) => f).toList(),
              ),
            );
          } else {
            return Text("");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
        ),
        onPressed: () {
          AnimationController controller = new AnimationController(
              duration: const Duration(milliseconds: 4000), vsync: this);
          Animation<double> animationXY =
              new Tween(begin: 300.0, end: 0.0).animate(controller);
          animationXY.addStatusListener((status) {
            setState(() {});
          });
          controller.forward();
          list.add(AnimatedLogo(
            animation: animationXY,
            type: Random().nextInt(3),
          ));
          animationControllerList.add(controller);
          widgetListStreamController.sink.add(list);
        },
      ),
    );
  }
}
