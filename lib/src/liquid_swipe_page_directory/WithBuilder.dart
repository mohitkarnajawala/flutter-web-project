import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_proj/src/WithPages.dart';
import 'package:flutter_web_proj/src/liquid_swipe_page_directory/ItemData.dart';
import 'package:flutter_web_proj/src/signup_module/widget/SignUpForm.dart';
import 'package:flutter_web_proj/src/signup_module/widget/SignUpScreen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

/// Example of LiquidSwipe with itemBuilder
class WithBuilder extends StatefulWidget {
  @override
  _WithBuilder createState() => _WithBuilder();
}

class _WithBuilder extends State<WithBuilder> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  List<ItemData> data = [
    ItemData(Colors.blue, "assets/image/1.png", "Easy Healthy Recipes - Eating Bird Food"),
    ItemData(Colors.deepPurpleAccent, "assets/image/2.png", "Casserole Recipes - Casseroles & Casserole Ideas"),
    ItemData(Colors.green, "assets/image/3.png", "Easy Finger Food Recipes for a Crowd - Insanely Good"),
    /*ItemData(Colors.yellow, "assets/1.png", "Can be", "Used for",
        "Onboarding design"),*/
    ItemData(Colors.red, "assets/image/4.png", "Swasthi's Recipes - Indian food blog with easy Indian recipes",
        ),
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(0.0, 1.0 - ((page ?? 0) - index).abs(),),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;

    return  SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child:  SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                 width: double.infinity,
                  color: data[index].color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      SizedBox(
                        child:CircleAvatar(
                          backgroundImage: AssetImage(
                            data[index].image,
                          ),
                        ) ,
                        height: 400,
                        width: 300,
                      ),
                      const Padding(padding: EdgeInsets.all(10.0),),



                        Center(
                            child:  Text(
                              data[index].text1,
                              textAlign: TextAlign.center,
                             // style: TextStyle(fontSize: 25,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),
                              style: WithPages.style,
                            ),
                        )

                      /*Column(

                        children: <Widget>[
                         *//* Text(
                              data[index].text1,
                              style: WithPages.style,
                            ),*//*


                          *//*  Text(
                            data[index].text2,
                            style: WithPages.style,
                          ),
                          Text(
                            data[index].text3,
                            style: WithPages.style,
                          ),*//*
                        ],
                      ),*/


                    ],
                  ),
                );
              },
              positionSlideIcon: 0.8,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              fullTransitionValue: 880,
              enableSideReveal: true,
              enableLoop: true,
              ignoreUserGestureWhileAnimating: true,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: const SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(data.length, _buildDot),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: RaisedButton(
                  onPressed: () {
                    /*liquidController.animateToPage(
                        page: data.length - 1, duration: 700);*/
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text("Skip to End"),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: RaisedButton(
                  onPressed: () {
                    liquidController.jumpToPage(
                        page: liquidController.currentPage + 1 > data.length - 1
                            ? 0
                            : liquidController.currentPage + 1);
                  },
                  child: const Text("Next",),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
