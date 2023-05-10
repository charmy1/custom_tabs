
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_proj/model/data_obj.dart';
import 'package:trial_proj/utils/colors_custom.dart';
import 'package:sized_context/sized_context.dart';
import 'package:trial_proj/utils/strings.dart';
import 'package:trial_proj/utils/text_styles_custom.dart';
import 'package:trial_proj/widgets/choice_chip.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {


    List<DataObj> list=[

      DataObj(name:"Jane Smith",det1:"URN 1021234" ,det2:"G2 P1" ,det3:"EDD 06/04/2021" ,det4: "36+6" ),
      DataObj(name:"Laura White",det1:"URN 1021234" ,det2:"G2 P1" ,det3:"EDD 06/04/2021" ,det4: "35+4" ),
      DataObj(name:"Tia Bell",det1:"URN 1021234" ,det2:"G2 P1" ,det3:"EDD 06/04/2021" ,det4: "33+2" ),
      DataObj(name:"Anna Lynn",det1:"URN 1021234" ,det2:"G2 P1" ,det3:"EDD 06/04/2021" ,det4: "31+2" ),
      DataObj(name:"Sarah Louise",det1:"URN 1021234" ,det2:"G2 P1" ,det3:"EDD 06/04/2021" ,det4: "30+5" ),
      DataObj(name:"Abbey Edwards",det1:"URN 1021234" ,det2:"G2 P1" ,det3:"EDD 06/04/2021" ,det4:  "25+0"),
      DataObj(name:"Sydney Paige",det1:"URN 1021234" ,det2:"G2 P1" ,det3:"EDD 06/04/2021" ,det4:  "26+6"),
      DataObj(name:"Gayle Tegan",det1:"URN 1021234" ,det2:"G2 P1" ,det3:"EDD 06/04/2021" ,det4: "25+0" ),

    ];
    return Scaffold(
      backgroundColor: ColorsCustom.pale,

      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: context.heightPct(.025),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Strings.svgHome),


                  Expanded(
                    child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              Container(
                                decoration: new BoxDecoration(
                                    color: ColorsCustom.white_46,

                                    borderRadius: BorderRadius.circular(10)),
                                child: ChoiceChipCustom(
                                  enableShape: true,
                                  buttonColor: Colors.white,
                                  active: TextStylesCustom.textStyle,
                                  inactive:TextStylesCustom.textStyle ,
                                  buttonLables: [
                                    "Antenatal",
                                    "Postnatal",
                                  ],
                                  buttonValues: [
                                    "Antenatal",
                                    "Postnatal",
                                  ],
                                  radioButtonValue: (value) => print(value),
                                  selectedColor: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),


                  SvgPicture.asset(Strings.svgAdd)

                ],
              ),
            ),



            Expanded(child:
            ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16.0),
                  child: Container(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Jane Smith
                                  Text(
                                      list[index].name,
                                      style: TextStylesCustom.textStyle2,
                                      textAlign: TextAlign.left
                                  ),
                                  // URN
                                  Text(
                                      list[index].det1,
                                      style: TextStylesCustom.textStyle3,
                                      textAlign: TextAlign.left
                                  ),
                                  // G2 P1
                                  Text(
                                      list[index].det2,
                                      style: TextStylesCustom.textStyle3,
                                      textAlign: TextAlign.left
                                  )
                                ],
                              ),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Jane Smith
                                Text(
                                    "J ",
                                    style: TextStylesCustom.textStyle2.copyWith(color: Colors.transparent),
                                    textAlign: TextAlign.left
                                ),
                                // URN
                                Text(
                                    "U",
                                    style: TextStylesCustom.textStyle3.copyWith(color: Colors.transparent),
                                    textAlign: TextAlign.left
                                ),
                                // G2 P1
                                Text(
                                    list[index].det3,
                                    style: TextStylesCustom.textStyle3,
                                    textAlign: TextAlign.left
                                )
                              ],
                            ),
                            SizedBox(width: context.widthPct(.01),),


                            // Rectangle 13
                            Container(
                                child: // Gestation
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                      list[index].det4,
                                      style: TextStylesCustom.textStyle4,
                                      textAlign: TextAlign.center
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)
                                    ),
                                    color: const Color(0xffffffff)
                                )
                            )
                          ],
                        ),
                      ),
                      decoration: new BoxDecoration(
                          color: ColorsCustom.white_46,
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                );
              },
              itemCount: list.length,
            ),
            ),
            Container(

              height: context.heightPct(.1),
              child: Row(
                children: [
                  SvgPicture.asset(Strings.svgLogo),
                  Spacer(),
                  SvgPicture.asset(Strings.svgArchive)

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
