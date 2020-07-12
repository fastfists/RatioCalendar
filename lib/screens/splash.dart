import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> 
  with SingleTickerProviderStateMixin {

  AnimationController _controller;

  Animation<double> slider;
  Animation<double> clock;
  Animation<double> nextPage;
  

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    clock = Tween<double>(
      begin: 0.0,
      end: 1.0,

    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0, 0.7,
          curve: Curves.elasticIn,
        ),
      )
    );

    slider = Tween<double>(
      begin: 0.0,
      end: 1.0,

    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.7, 0.9,
          curve: Curves.easeInOutExpo,
        ),
      )
    );

    nextPage = Tween<double>(
      begin: 0.0,
      end: 1.0,

    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.9, 1.0,
          curve: Curves.linear,
        ),
      )
    );

    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: AnimatedBuilder(
            animation: _controller,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0,10*2*-(1-nextPage.value)),
                    child: Opacity(
                      opacity: (nextPage.value),
                      child: SvgPicture.asset(
                        "assets/svg/TopSection.svg"
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0,-10*2*-(1-nextPage.value)),
                    child: Opacity(
                      opacity: (nextPage.value),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset(
                          "assets/svg/BottomSection.svg"
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -size.height / 2 * slider.value),
                    child: Container(
                      color: Color(0xFF0BA5FB),
                      height: size.height / 2,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                        0,
                        size.height +
                            size.height / 2 * (slider.value - 1)),
                    child: Container(
                      color: Color(0xFF0BA5FB),
                      height: size.height / 2,
                    ),
                  ),
                  Opacity(
                    opacity: 1-slider.value,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Center(
                              child: Text(
                            "Ratio Calendar",
                            style: Theme.of(context).textTheme.headline4,
                          )),
                          ClockWidget(
                            controller: clock,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        );
  }

}

class ClockWidget extends StatelessWidget {
  final Animation controller;
  const ClockWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.circular(400);
    var rotations = 15;

    return Container(
        child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: Color(0xFF0583FD),
          ),
          width: 205,
          height: 192,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: Color(0xFF06B1FF),
          ),
          width: 180,
          height: 166,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              width: 5,
            ),
            color: Color(0xFF6CFFFF),
          ),
          width: 120,
          height: 120,
        ),
        AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..rotateZ(pi * rotations * 2 * controller.value)
                  ..translate(0.0, -15.0),
                child: Container(
                  width: 4,
                  height: 35,
                  color: Colors.black,
                ),
              );
            }),
        AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..rotateZ(pi * rotations * 2 * controller.value / 30)
                  ..translate(0.0, -10.0),
                child: Container(
                  width: 4,
                  height: 28,
                  color: Colors.black,
                ),
              );
            }),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          width: 10,
          height: 10,
        ),
      ],
    ));
  }
}
