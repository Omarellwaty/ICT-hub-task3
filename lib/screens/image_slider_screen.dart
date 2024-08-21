import 'package:flutter/material.dart';

class ImageSliderScreen extends StatefulWidget {
  @override
  _ImageSliderScreenState createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  final List<String> _images = [
    'assets/img 1.jpg',
    'assets/img 2.jpg',
    'assets/img 3.jpg',
  ];

  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) ;
    });
  }

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 ) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('image slider'),
    ),
     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue,width:10)
              ),

              child:Image.asset(_images[_currentIndex])
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _previousImage,
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _nextImage,
              ),
            ],
          ),
        ],
      ),
     ));
  }
}
