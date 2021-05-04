import 'dart:ui';
import 'package:flutter/material.dart';

class InkBox extends StatefulWidget {
  final IconData icon;
  final String heading;
  final int color;
  final Function onTap;
  final Function onDoubleTab;
  
  

  const InkBox({
    Key key,
    this.icon,
    this.heading,
    this.color,
    this.onTap,
    this.onDoubleTab, 
    
  }) : super(key: key);

  @override
  _InkBoxState createState() => _InkBoxState();
}

class _InkBoxState extends State<InkBox> {
 
  @override
  Widget build(BuildContext context) {
  
    return Container(
       decoration: BoxDecoration(
        //color: Colors.white,
        color: Colors.pink,
        borderRadius: BorderRadius.circular(24.0),
       ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Material(
          //elevation: 14.0,
          shadowColor: Color(0x802196F3),
          borderRadius: BorderRadius.circular(24.0),
          child: InkWell(
            onTap: widget.onTap,
            onDoubleTap: widget.onDoubleTab,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Text
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.heading,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: new Color(widget.color), fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    //Icon
                    Material(
                      color: new Color(widget.color),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

