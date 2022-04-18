// import 'package:flutter/foundation.dart';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:launcher/login_page.dart';

// import 'package:flutter/widgets.dart';

// class HomePage extends StatelessWidget {
//   // final webImagesPrefix = !kIsWeb ? 'assets/' : '';

//   HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome to ViTrack!"),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  final restaurantName = <String>[
    'Track Pulse Rate',
    'Track Systolic BP',
    'Track Diastolic BP',
    'Track Temperature',
    'Track SpO2',
  ];

  // final webImagesPrefix = !kIsWeb ? 'assets/' : '';

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Welcome to ViTrack!"),
    //   ),

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to ViTrack!'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: 'Click here to Sign In',
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('This is a snackbar')));
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.navigate_next),
          //   tooltip: 'Go to the next page',
          //   onPressed: () {
          //     Navigator.push(context, MaterialPageRoute<void>(
          //       builder: (BuildContext context) {
          //         return Scaffold(
          //           appBar: AppBar(
          //             title: const Text('Next page'),
          //           ),
          //           body: const Center(
          //             child: Text(
          //               'This is the next page',
          //               style: TextStyle(fontSize: 24),
          //             ),
          //           ),
          //         );
          //       },
          //     ));
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/vitals/header.jpg'),
                ),
              ),
              height: 150,
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Stay Safe!",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),
            GridView.count(
              crossAxisCount: (MediaQuery.of(context).size.width / 250).floor(),
              shrinkWrap: true,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(15),
              children: List.generate(
                  5,
                  (index) => Card(
                        elevation: 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: InkWell(
                                child: Ink.image(
                                  image: AssetImage(
                                      'assets/vitals/${index + 1}.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title:
                                                Text("Sorry, it's just a demo"),
                                            content: Text(
                                                "You can't actually track vitals here."),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child:
                                                      Text("AH THAT'S RIGHT"))
                                            ],
                                          ));
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  List.generate(5, (index) => Icon(Icons.star)),
                            ),
                            Text(
                              restaurantName[index],
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
