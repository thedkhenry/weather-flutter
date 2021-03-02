import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:weather_flutter/screens/city_screen.dart';
import 'package:weather_flutter/services/weather.dart';
import 'package:weather_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = new WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;
  String country;
  String description;
  String day;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    var now = new DateTime.now();
    var formatter = new DateFormat('EEEE | d LLL'); //HH:mm
    day = formatter.format(now);
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Uh oh!';
        description = 'Unable to get weather data...';
        cityName = '';
        country = '';
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherMessage = weather.getMessage(temperature);
      country = weatherData['sys']['country'];
      description = weatherData['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background_1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: FlatButton(
              onPressed: () async {
                var weatherData = await weather.getLocationWeather();
                updateUI(weatherData);
              },
              child: Icon(
                Icons.near_me,
                size: 35.0,
                color: Colors.white70,
              ),
            ),
            centerTitle: true,
            title: Text(
              '$day',
              style: kTitleTextStyle,
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  var typedName = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return CityScreen();
                  }));
                  if (typedName != null) {
                    var weatherData = await weather.getCityWeather(typedName);
                    updateUI(weatherData);
                  }
                },
                child: Icon(
                  Icons.search,
                  size: 35.0,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 120.0,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      "$cityName, $country",
                      textAlign: TextAlign.center,
                      style: kCityTextStyle,
                    ),
                    SizedBox(
                      height: 90.0,
                    ),
                    Text(
                      '${description.titleCase}',
                      textAlign: TextAlign.center,
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
