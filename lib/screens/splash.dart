import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
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
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        0.5,
        curve: Curves.easeOutBack,
      ),
    ));

    slider = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.5,
        0.7,
        curve: Curves.easeInOutExpo,
      ),
    ));

    nextPage = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.7,
        1.0,
        curve: Curves.decelerate,
      ),
    ));

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
                Page1(animation: nextPage),
                Transform.translate(
                  offset: Offset(-size.width / 2 * slider.value, 0),
                  child: Container(
                    color: Color(0xFF0BA5FB),
                    width: size.width / 2,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      size.width + size.width / 2 * (slider.value - 1), 0),
                  child: Container(
                    color: Color(0xFF0BA5FB),
                    width: size.width / 2,
                  ),
                ),
                Opacity(
                  opacity: 1 - slider.value,
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
                        AnimatedClockWidget(
                          animation: clock,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class Page1 extends StatelessWidget {

  final Animation animation;
  const Page1({Key key, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: SvgPicture.asset(
            "assets/svg/GetStartedSwoosh.svg"
          ),
        ),
        Positioned(
          top: 89,
          left: 89,
          child: Text(
            "Ratio Calendar",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Positioned(
          top: 183,
          left: 100,
          child: ClockWidget()
        ),
        Positioned(
          bottom: 123,
          left: 150,
          child: MaterialButton(
            onPressed: (){},
            child:Text(
              "Get Started",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            color: Color(0xFF97E2E2),
          ),
        )
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  final Animation animation;
  const Page2({Key key, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
                Transform.translate(
                  offset: Offset(0, 10 * 2 * -(1 - animation.value)),
                  child: Opacity(
                    opacity: (animation.value),
                    child: SvgPicture.asset("assets/svg/TopSection.svg"),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -10 * 2 * -(1 - animation.value)),
                  child: Opacity(
                    opacity: (animation.value),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset("assets/svg/BottomSection.svg"),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class ClockWidget extends StatelessWidget {
  const ClockWidget({Key key}) : super(key: key);

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
        Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
                  ..rotateZ(pi * rotations * 2)
                ..translate(0.0, -15.0),
                child: Container(
                  width: 4,
                  height: 35,
                  color: Colors.black,
                ),
        ),
        Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..rotateZ(pi * rotations * 2 / 30)
            ..translate(0.0, -10.0),
          child: Container(
            width: 4,
            height: 28,
            color: Colors.black,
          ),
        ),
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

class AnimatedClockWidget extends StatelessWidget {
  final Animation animation;
  const AnimatedClockWidget({Key key, this.animation}) : super(key: key);

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
            animation: animation,
            builder: (context, child) {
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..rotateZ(pi * rotations * 2 * animation.value)
                  ..translate(0.0, -15.0),
                child: Container(
                  width: 4,
                  height: 35,
                  color: Colors.black,
                ),
              );
            }),
        AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..rotateZ(pi * rotations * 2 * animation.value / 30)
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
