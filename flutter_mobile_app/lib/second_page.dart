import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Language setting',
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: seconPageBuildBody(),
    );
  }

Future speakSecondPage(String sss) async {
    await flutterTts.setLanguage('en-us');
    await flutterTts.setSpeechRate(1);
    await flutterTts.setPitch(1);
    await flutterTts.speak(sss);
  }

  seconPageBuildBody() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Material(
              child: InkWell(
                onTap: () => speakSecondPage('English language selected, double tap to return to the home page'),
                onDoubleTap: () {Navigator.pop(context);},
                child: Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      'English',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Material(
              child: InkWell(
                onTap: () => speakSecondPage('Chinese language selected, double tap to return to the home page'),
                onDoubleTap: () {Navigator.pop(context);},
                child: Container(
                  color: Colors.deepPurpleAccent,
                  child: Center(
                    child: Text(
                      'Chinese',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
  }
}

// class LanguagePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//     MaterialApp(
//       home: Container(
//         // decoration: BoxDecoration(
//         //      image: DecorationImage(
//         //         image: AssetImage("images/5.jpg"), fit: BoxFit.cover),
//         //  ),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'Language setting',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25),
//             ),
//           ),
//           body: Column(
//             //mainAxisSize: MainAxisSize.min,
//             //mainAxisAlignment: MainAxisAlignment.center,
//             //crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[

//               SizedBox(
//                 child: InkWell(
//                   onTap: () {},
//                   // read the button
//                   onDoubleTap: () {
//                     Navigator.pop(context);
//                   },
//                   // navigate to first route
//                   child: Container(
//                     child: Text(
//                       'English',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                         fontSize: 30.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 child: InkWell(
//                   onTap: () {},
//                   // read the button
//                   onDoubleTap: () {
//                     Navigator.pop(context);
//                   },
//                   // navigate to first route
//                   child: Container(
//                     child: Text(
//                       'Chinese',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                         fontSize: 30.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
