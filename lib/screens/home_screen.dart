import 'dart:convert';
import 'dart:io';

import 'package:eventat/components/content_scroll.dart';
import 'package:eventat/data/api_data.dart';
import 'package:eventat/models/event_model.dart';
import 'package:eventat/models/movie_model.dart';
import 'package:eventat/screens/event_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  PageController _pageController;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  int take = 4;
  int skip = 5;
  String _currentAddress, nextEventsUrl;
  String eventsUrl = "https://backend.etkinlik.io/api/v2/events?take=4&skip=5";

  List<Event> events = List();

  _getEventListForLocalCity(url) async {
    print(eventsUrl);

    var response = await http.get(url, headers: {"X-Etkinlik-Token": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["items"].forEach((element) {
      Event event = Event();
      event = Event.fromMap(element);
      events.add(event);
      skip++;
    });

    setState(() {
      eventsUrl =
          "https://backend.etkinlik.io/api/v2/events?take=$take&skip=$skip";
    });

    print(eventsUrl);
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    _getEventListForLocalCity(eventsUrl);

    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);

    _pageController.addListener(() {
      double maxScroll = _pageController.position.maxScrollExtent;
      double delta = MediaQuery.of(context).size.height;
      double currentScroll = _pageController.position.pixels;

      if (currentScroll.floor() == maxScroll.floor()) {
        _getMoreEvent();
      }

      setState(() {
        // print(maxScroll.floor());

        // print(currentScroll.floor());

        // print(delta.ceil());
      });
    });
  }

  _getMoreEvent() {
    print("get more");
    _getEventListForLocalCity(eventsUrl);
  }

  _eventSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EventScreen(event: events[index]),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: events[index].poster,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              // color: Colors.red,
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: events[index].poster,
                                fit: BoxFit.cover,
                                height: 220.0,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black54.withOpacity(0.8),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 20.0),
                                  ],
                                ),
                                alignment: Alignment.topRight,
                                padding: EdgeInsets.all(10),
                                child: AutoSizeText(
                                  date(DateTime.parse(events[index].start)),
                                  minFontSize: 10,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFD45253).withOpacity(0.8),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 20.0),
                                  ],
                                ),
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.all(10),
                                // color: Color(0xFFD45253).withOpacity(0.9),

                                child: AutoSizeText(
                                  events[index].name.toUpperCase(),
                                  minFontSize: 14,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/images/logo.png'),
          height: size.width / 11,
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => print("Search"),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 280,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: events.length + 1,
                  itemBuilder: (context, index) {
                    if (index == events.length) {
                      return CupertinoActivityIndicator();
                    }
                    // print(index);
                    // print(events.length);
                    return _eventSelector(index);
                  },
                ),
              ),
              Container(
                height: 20,
                width: 20,
                color: Colors.redAccent,
              ),
            ],
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: formats.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD45253),
                        Color(0xFF9E1F28),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF9E1F28),
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: AutoSizeText(
                      formats[index].name,
                      minFontSize: 10,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          ContentScroll(
            images: myList,
            title: _currentAddress != null ? _currentAddress : "Türkiye",
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
          SizedBox(height: 10.0),
          ContentScroll(
            images: popular,
            title: 'Popular',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
        ],
      ),
    );
  }

  _getCurrentLocation() async {
    await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
      });

      await _getAddressFromLatLng();
      print('Position: $_currentPosition');
      print('Address: $_currentAddress');
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = place.administrativeArea;
      });
    } catch (e) {
      print(e);
    }
  }
}

String date(DateTime tm) {
  // print(tm);

  // tm = DateTime.now();
  DateTime today = new DateTime.now();
  Duration oneDay = new Duration(days: 1);
  // print(oneDay);
  Duration twoDay = new Duration(days: 2);
  // print(twoDay);
  Duration oneWeek = new Duration(days: 7);
  // print(oneWeek);
  String month;
  switch (tm.month) {
    case 1:
      month = "ocak";
      break;
    case 2:
      month = "şubat";
      break;
    case 3:
      month = "mart";
      break;
    case 4:
      month = "nisan";
      break;
    case 5:
      month = "mayıs";
      break;
    case 6:
      month = "haziran";
      break;
    case 7:
      month = "temmuz";
      break;
    case 8:
      month = "ağustos";
      break;
    case 9:
      month = "eylül";
      break;
    case 10:
      month = "ekim";
      break;
    case 11:
      month = "kasım";
      break;
    case 12:
      month = "aralık";
      break;
  }

  Duration difference = today.difference(tm);
  // print(difference);
  // print(difference.compareTo(oneDay).toString());
  // print(difference.compareTo(twoDay).toString());
  // print(difference.compareTo(oneWeek).toString());

  if (difference.compareTo(oneDay) > 0) {
    return "bugün";
  } else if (difference.compareTo(twoDay) > 0) {
    return "dün";
  } else if (difference.compareTo(oneWeek) > 0) {
    switch (tm.weekday) {
      case 1:
        return "pazartesi";
      case 2:
        return "salı";
      case 3:
        return "çarşamba";
      case 4:
        return "perşembe";
      case 5:
        return "cuma";
      case 6:
        return "cumartesi";
      case 7:
        return "pazar";
    }
  } else if (tm.year == today.year) {
    return '${tm.day} $month';
  } else {
    return '${tm.day} $month ${tm.year}';
  }
  return "";
}

// _eventDate(String date) {
//   DateTime pDate = DateTime.parse(date);

//   initializeDateFormatting('es');
//   return DateFormat('yyyy-MM-dd hh:mm:ss').format(pDate);
// }
