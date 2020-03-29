import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 250.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: (AppBar(title: Text('Slider Page'))),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _createSlider(),
              Expanded(child: _createImage())
            ],
          ),
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Image size $_sliderValue',
      value: _sliderValue,
      divisions: 20,
      min: 50.0,
      max: 300.0,
      onChanged: (value) {
        setState(() {
          _sliderValue = value;
        });
      },
    );
  }

  Widget _createImage() {
    return FadeInImage(
      image: NetworkImage('https://i.pinimg.com/originals/27/f3/0e/27f30eb66f427ef0d6395f92576a0a7d.png'),
      placeholder: AssetImage('assets/loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
      width: _sliderValue,
    );
  }
}