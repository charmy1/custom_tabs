import 'package:flutter/material.dart';
import 'package:trial_proj/utils/colors_custom.dart';

class ChoiceChipCustom extends StatefulWidget {
  final bool horizontal;

  final List buttonValues;
  final TextStyle active;
  final TextStyle inactive;

  final double hight;
  final double width;

  final List<String> buttonLables;

  final Function(dynamic) radioButtonValue;

  final Color selectedColor;

  final Color buttonColor;
  final ShapeBorder customShape;
  final bool enableShape;
  final double elevation;

  ChoiceChipCustom({
    this.buttonLables,
    this.buttonValues,
    this.radioButtonValue,
    this.buttonColor,
    this.selectedColor,
    this.hight = 38,
    this.width = 100,
    this.horizontal = false,
    this.enableShape = false,
    this.elevation = 0,
    this.customShape,
    this.active,
    this.inactive,
  })  : assert(buttonLables.length == buttonValues.length),
        assert(buttonColor != null),
        assert(selectedColor != null);

  _ChoiceChipCustomState createState() => _ChoiceChipCustomState();
}

class _ChoiceChipCustomState extends State<ChoiceChipCustom> {
  int currentSelected = 0;
  String currentSelectedLabel;

  @override
  void initState() {
    super.initState();
    currentSelectedLabel = widget.buttonLables[0];
  }

  List<Widget> buildButtonsColumn() {
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonLables.length; index++) {
      var button = GestureDetector(
          onTap: () {
            widget.radioButtonValue(widget.buttonValues[index]);
            setState(() {
              currentSelected = index;
              currentSelectedLabel = widget.buttonLables[index];
            });
          },
          child: Container(
              child: Container(
                height: widget.hight,
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(widget.buttonLables[index],
                          style: (currentSelectedLabel ==
                              widget.buttonLables[index])
                              ? widget.active
                              : widget.inactive
/*TextStyle(
                        color: currentSelectedLabel == widget.buttonLables[index]
                            ? Colors.white
                            : Theme
                            .of(context)
                            .textTheme
                            .body1
                            .color,
                        fontSize: 15,
                      ),*/
                      ),
                    ),
                  ),
                ),
              ),
              height: 83,
              decoration: currentSelectedLabel == widget.buttonLables[index]
                  ? new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber)
                  : BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white)));

      /*  decoration: new BoxDecoration(
              color: currentSelectedLabel == widget.buttonLables[index]
                  ? widget.selectedColor
                  : widget.buttonColor,
              border: new Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              shape: BoxShape.circle),*/

      buttons.add(button);
    }
    return buttons;
  }

  List<Widget> buildButtonsRow() {
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonLables.length; index++) {
      var button = Expanded(
        child: GestureDetector(
            onTap: () {
              widget.radioButtonValue(widget.buttonValues[index]);
              setState(() {
                currentSelected = index;
                currentSelectedLabel = widget.buttonLables[index];
              });
            },
            child: Container(
                child: Container(
                  //height: 38,

                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(widget.buttonLables[index],
                            style: (currentSelectedLabel ==
                                widget.buttonLables[index])
                                ? widget.active
                                : widget.inactive
/*TextStyle(
                          color: currentSelectedLabel == widget.buttonLables[index]
                              ? Colors.white
                              : Theme
                              .of(context)
                              .textTheme
                              .body1
                              .color,
                          fontSize: 15,
                        ),*/
                        ),
                      ),
                    ),
                  ),
                ),
                height: 38,
                decoration: currentSelectedLabel == widget.buttonLables[index]
                    ? new BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white)
                    : BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsCustom.pale2))),
      );

      buttons.add(button);
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: widget.horizontal
          ? widget.hight * (widget.buttonLables.length + 0.5)
          : null,
      child: Center(
        child: widget.horizontal
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buildButtonsColumn(),
        )
            : Container(
          //color: Colors.green,
          decoration: new BoxDecoration(
              color: ColorsCustom.pale2,

              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buildButtonsRow(),
            ),
          ),
        ),
      ),
    );
  }
}

