import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/custom_data.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiresult,@required this.getresult,@required this.intrepretation});

  final String bmiresult;
  final String getresult;
  final String intrepretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: kLabelTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,

            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Results', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: Tile(
              colour: kTileColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getresult,
                    style: kResultTextStyle,
                  ),
                  Text(
                      bmiresult,
                    style: kBMITextStyle,
                  ),
                  Center(
                    child: Text(
                      intrepretation,
                      textAlign: TextAlign.center,
                      style: kBMITextStyle.copyWith(fontSize: 25.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'RE-CALCCULATE',
              onPress: () {
                Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}
