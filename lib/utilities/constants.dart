import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'JosefinSans-Light',
  fontSize: 130.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontFamily: 'JosefinSans-Light',
  fontSize: 25.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'JosefinSans-Light',
  fontSize: 45.0,
  fontWeight: FontWeight.bold,
);

const kCityTextStyle = TextStyle(
  fontFamily: 'JosefinSans-Light',
  fontSize: 20.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'JosefinSans-Light',
);

const kConditionTextStyle = TextStyle(
  fontSize: 30.0,
);

const kTestFieldInputDecoration = InputDecoration(
  filled: true,
  contentPadding: EdgeInsets.all(13.0),
  fillColor: Colors.white10,
//    icon: Icon(
//      Icons.location_city,
//      color: Colors.white,
//    ),
  hintText: 'Enter a new city name',
  hintStyle: TextStyle(
    color: Colors.white38,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide.none,
  ),
);
