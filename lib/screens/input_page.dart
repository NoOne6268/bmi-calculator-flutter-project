import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_data.dart';
import '../components/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/calc_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  var malecardcolor = kInactiveTileColor;
  var femalecardcolor = kInactiveTileColor;

  int height = 180;
  int weight = 60;
  int age = 19;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
          style: kLabelTextStyle.copyWith(color: Colors.white),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Tile(
                        colour: selectedGender == Gender.male
                            ? kTileColor
                            : kInactiveTileColor,
                        cardchild: TileCard(
                          title: 'MALE',
                          dispicon: FontAwesomeIcons.mars,
                          gesture: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                        ))),
                Expanded(
                    child: Tile(
                  colour: selectedGender == Gender.female
                      ? kTileColor
                      : kInactiveTileColor,
                  cardchild: TileCard(
                    title: 'FEMALE',
                    dispicon: FontAwesomeIcons.venus,
                    gesture: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              child: Tile(
            colour: kTileColor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kHeavyTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                    ),
                    overlayColor: Color(0x29EB1555),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newvlue) {
                      setState(() {
                        height = newvlue.toInt();
                      });
                    },
                    inactiveColor: Color(0xFF8D8E98),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: Tile(
                colour: kTileColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kHeavyTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          gesture: () {
                            setState(() {
                              weight--;
                            });
                          },
                          buttonicon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          gesture: () {
                            setState(() {
                              weight++;
                            });
                          },
                          buttonicon: FontAwesomeIcons.plus,
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Tile(
                colour: kTileColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kHeavyTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          gesture: () {
                            setState(() {
                              age--;
                            });
                          },
                          buttonicon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          gesture: () {
                            setState(() {
                              age++;
                            });
                          },
                          buttonicon: FontAwesomeIcons.plus,
                        )
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          BottomButton(
            title: 'CALCULATE',
              onPress: (){

                Brain calc = Brain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiresult: calc.calculateBMI(),
                  getresult: calc.getResult(),
                  intrepretation: calc.getInterpretations(),
                )));
              },
          )
        ],
      ),
    );
  }
}


