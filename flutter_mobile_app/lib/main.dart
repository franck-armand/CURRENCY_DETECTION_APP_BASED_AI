import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'InkBox.dart';
import 'second_page.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
            splashColor: Colors.orangeAccent,
            splashFactory: InkRipple.splashFactory),
        home: VisuallyImpaired(),
      ),
    );

class VisuallyImpaired extends StatefulWidget {
  @override
  _VisuallyImpairedState createState() => _VisuallyImpairedState();
}

class _VisuallyImpairedState extends State<VisuallyImpaired> {
  final FlutterTts flutterTts = FlutterTts();
  File _image;
  bool _isDetecting;
  

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    sendToServer(image);
    setState(() {
      _image = image;
    });
  }

  Socket _socket;
  

  sendToServer(File image) async {
    setState(() {
      _isDetecting = true;
    });
    if (_socket == null) {
      _socket = await Socket.connect("192.168.1.100", 65432);
      print("First connection to the Server");
      _socket.listen(dataHandler,
          onError: errorHandler, onDone: doneHandler, cancelOnError: false);
    } else {
      print("Socket already connected");
    }

    print("Sending data");
    var imageBytes = image.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    print("Length of base64Image ${base64Image.length}");
    _socket.write(base64Image.trim());
    _socket.write("######");
    print("Image written");
    _socket = null;
  }
  String _strResult = "";

  void dataHandler(data) {
    print(data);
    String result = utf8.decode(data);
    print("Data handler: Data received from server $result");

    var sss = result.split("_");
    var labels = ['0.1', '0.5', '1', '5', '10', '20', '50', '100'];

    if (labels.contains(sss[0])) {
      _strResult = "${sss[0]} Yuan";
      speak(_strResult);
    } else {
      _strResult = "The image is not money";
      speak(_strResult);
    }
    setState(() {
      _isDetecting = false;
    });
    //_socket?.destroy();
  }

  void errorHandler(error, trace) {
    print("ErrorHandler: $error");
    _strResult = "sorry, could you please take another picture";
    speak(_strResult);
    _socket = null;
  }

  void doneHandler() {
    print("Done handler");
    _socket?.flush();
    _socket?.destroy();
    _socket = null;
  }
  @override
  void initState() {
    _isDetecting = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        // decoration: BoxDecoration(
        //      image: DecorationImage(
        //         image: AssetImage("images/5.jpg"), fit: BoxFit.cover),
        //  ),
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text(
              'Chinese Yuan Detection App',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          body: Stack(
            children : [
              _mainbluidBody(),
              _isDetecting ?  Container(
                decoration: BoxDecoration(
                  color: Colors.black54
                ),
                child: Center(child: CircularProgressIndicator(),),) : SizedBox(),
            ]
          ),
        ),
      ),
    );
  }

  Future speak(String button) async {
    
    await flutterTts.setLanguage('en-us');
    await flutterTts.setSpeechRate(1);
    await flutterTts.setPitch(1);
    await flutterTts.speak(button);
  }

  _mainbluidBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //_image == null? Container() : Image.file(_image, height:300.0, width:300.0),
          InkBox(
            icon: Icons.visibility,
            heading: 'Hello, Welcome to your Yuan detection \napplication',
            color: 0xffed622b,
            onTap: () =>
                speak('Hello, welcome to your Yuan detection application'),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 12.0,
              ),
              children: <Widget>[
                InkBox(
                  icon: Icons.photo_album,
                  heading: 'Upload image',
                  color: 0xff26cb3c,
                  onTap: () => speak('Upload image'),
                  onDoubleTab: () {
                    getImage(false);
                  },
                ),
                InkBox(
                  icon: Icons.photo_camera,
                  heading: 'Take picture',
                  color: 0xffff3266,
                  onTap: () => speak('Take picture'),
                  onDoubleTab: () {
                    getImage(true);
                  },
                ),
                InkBox(
                  icon: Icons.speaker_phone,
                  heading: 'Repeat result',
                  color: 0xff3399fe,
                  onTap: () => speak('Repeat result'),
                  onDoubleTab: () => speak(_strResult),
                ),
                InkBox(
                  color: 0xfff4c83f,
                  heading: 'Change language',
                  icon: Icons.language,
                  onTap: () => speak('Change language'),
                  onDoubleTab: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LanguagePage()))
                  }, // navigate to the second_page
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
