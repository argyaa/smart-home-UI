import 'package:flutter/material.dart';
import 'package:smart_home_ui/common/colors.dart';
import 'package:smart_home_ui/common/sizes.dart';
import 'package:smart_home_ui/widgets/lantern.dart';
import 'package:smart_home_ui/widgets/switch.dart';

enum ColorState { YELLOW, BLUE }
enum BrightState { B100, B80 }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var color = ColorState.YELLOW;
  var bright = BrightState.B100;
  bool switchOnOff = true;

  void changeColor() {
    if (color == ColorState.YELLOW) {
      setState(() {
        color = ColorState.BLUE;
      });
    } else {
      setState(() {
        color = ColorState.YELLOW;
      });
    }
  }

  void changeBright() {
    if (bright == BrightState.B100) {
      setState(() {
        bright = BrightState.B80;
      });
    } else {
      setState(() {
        bright = BrightState.B100;
      });
    }
  }

  void changeSwitch() {
    setState(() {
      switchOnOff = !switchOnOff;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Padding(
        padding: const EdgeInsets.all(26.0),
        child: Text(
          'Round Lanterns \nLamp',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.dp25(context),
              color: Colors.grey[800]),
        ),
      );
    }

    Widget lantern() {
      return Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 1200),
            height: Sizes.height(context) * 0.6,
            decoration: BoxDecoration(
                color: color == ColorState.BLUE
                    ? ColorPalette.blueGradientBottom.withOpacity(0.4)
                    : ColorPalette.yellowGradientBottom.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.width(context)),
                  bottomRight: Radius.circular(Sizes.width(context)),
                )),
          ),
          Lamp(
            brightState: bright,
            colorState: color,
            switchOnOff: switchOnOff,
          )
        ],
      );
    }

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lantern(),
        title(),
        SwitchButton(
          changeColor: changeColor,
          colorState: color,
          changeBright: changeBright,
          brightState: bright,
          changeSwitch: changeSwitch,
          switchOnOffState: switchOnOff,
        )
      ],
    ));
  }
}
