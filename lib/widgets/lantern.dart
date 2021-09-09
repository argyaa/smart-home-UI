import 'package:flutter/material.dart';
import 'package:smart_home_ui/common/colors.dart';
import 'package:smart_home_ui/common/sizes.dart';
import 'package:smart_home_ui/pages/homepage.dart';

class Lamp extends StatelessWidget {
  final BrightState brightState;
  final ColorState colorState;
  final bool switchOnOff;

  Lamp({this.brightState, this.colorState, this.switchOnOff});

  @override
  Widget build(BuildContext context) {
    Widget fitting() {
      return Container(
        height: Sizes.height(context) * 0.014,
        width: 12,
        decoration: BoxDecoration(
            color: ColorPalette.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.0))),
      );
    }

    Widget cable() {
      return Container(
        height: Sizes.height(context) * 0.3,
        width: 3,
        color: ColorPalette.black,
      );
    }

    Widget bulb() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: Sizes.width(context) * 0.3,
        width: Sizes.width(context) * 0.3,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colorState == ColorState.BLUE
                ? [
                    ColorPalette.blueGradientTop,
                    ColorPalette.blueGradientBottom,
                  ]
                : [
                    ColorPalette.yellowGradientTop,
                    ColorPalette.yellowGradientBottom,
                  ],
          ),
          boxShadow: switchOnOff
              ? [
                  BoxShadow(
                      color: colorState == ColorState.BLUE
                          ? ColorPalette.blueGradientBottom.withOpacity(0.5)
                          : ColorPalette.yellowGradientBottom.withOpacity(0.5),
                      blurRadius: 30.0,
                      offset: Offset(0, 0),
                      spreadRadius:
                          brightState == BrightState.B100 ? 40.0 : 25.0)
                ]
              : [],
        ),
      );
    }

    return Center(
      child: Column(
        children: [
          cable(),
          fitting(),
          bulb(),
        ],
      ),
    );
  }
}
