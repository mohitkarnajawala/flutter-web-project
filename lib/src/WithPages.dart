import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

///Example of App with LiquidSwipe by providing list of widgets
class WithPages extends StatefulWidget {
  static const style =  TextStyle(fontSize: 22, fontFamily: "Billy", fontWeight: FontWeight.w600,);

  const WithPages({Key? key}) : super(key: key);

  @override
  _WithPages createState() => _WithPages();
}

class _WithPages extends State<WithPages> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: Colors.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/1.png',
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: const <Widget>[
              Text(
                "Hi",
                style: WithPages.style,
              ),
              Text(
                "It's Me",
                style: WithPages.style,
              ),
              Text(
                "Sahdeep",
                style: WithPages.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/1.png',
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: const <Widget>[
              Text(
                "Take a",
                style: WithPages.style,
              ),
              Text(
                "look at",
                style: WithPages.style,
              ),
              Text(
                "Liquid Swipe",
                style: WithPages.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/1.png',
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: const <Widget>[
              Text(
                "Liked?",
                style: WithPages.style,
              ),
              Text(
                "Fork!",
                style: WithPages.style,
              ),
              Text(
                "Give Star!",
                style: WithPages.style,
              ),
            ],
          ),
        ],
      ),
    ),
    /*Container(
      color: Colors.yellowAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/1.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Can be",
                style: WithPages.style,
              ),
              Text(
                "Used for",
                style: WithPages.style,
              ),
              Text(
                "Onboarding Design",
                style: WithPages.style,
              ),
            ],
          ),
        ],
      ),
    ),*/
    Container(
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/1.png',
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: const <Widget>[
              Text(
                "Do",
                style: WithPages.style,
              ),
              Text(
                "Try it",
                style: WithPages.style,
              ),
              Text(
                "Thank You",
                style: WithPages.style,
              ),
            ],
          ),
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return  Container(
      width: 25.0,
      child:  Center(
        child:  Material(
          color: Colors.white,
          type: MaterialType.circle,
          child:  Container(
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
            LiquidSwipe(
              pages: pages,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              enableSideReveal: true,
              ignoreUserGestureWhileAnimating: true,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, _buildDot),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    liquidController.animateToPage(
                        page: pages.length - 1, duration: 700);
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
                child: FlatButton(
                  onPressed: () {
                    liquidController.jumpToPage(
                        page:
                        liquidController.currentPage + 1 > pages.length - 1
                            ? 0
                            : liquidController.currentPage + 1);
                  },
                  child: const Text("Next"),
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