import 'package:eventat/components/circular_clipper.dart';
import 'package:eventat/components/content_scroll.dart';
import 'package:eventat/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EventScreen extends StatefulWidget {
  final Event event;

  const EventScreen({Key key, this.event}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.event.poster,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.event.poster,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 400.0,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(Icons.arrow_back_ios,
                                size: 26, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: size.width / 11,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 30),
                    child: InkWell(
                      onTap: () => null,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              height: 20,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(Icons.favorite_border,
                                size: 26, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // IconButton(
                  //   padding: EdgeInsets.only(right: 40.0),
                  //   icon: Icon(Icons.favorite_border),
                  //   iconSize: 30.0,
                  //   color: Colors.black,
                  //   onPressed: () => null,
                  // ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    elevation: 12.0,
                    padding: EdgeInsets.all(15.0),
                    onPressed: () => print('Play Video'),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(Icons.shopping_basket,
                        size: 40.0, color: Colors.redAccent),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                  onPressed: () => print('Add to My List'),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.black,
                  onPressed: () => print('Share'),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.event.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.event.category.name,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
                SizedBox(height: 12.0),
                Text(
                  '⭐⭐⭐⭐',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // children: [
                  //   Column(
                  //     children: [
                  //       Text(
                  //         'Year',
                  //         style:
                  //             TextStyle(color: Colors.black54, fontSize: 16.0),
                  //       ),
                  //       SizedBox(height: 2.0),
                  //       Text(
                  //         widget.event.format.toString(),
                  //         style: TextStyle(
                  //           fontSize: 20.0,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   Column(
                  //     children: [
                  //       Text(
                  //         'Country',
                  //         style:
                  //             TextStyle(color: Colors.black54, fontSize: 16.0),
                  //       ),
                  //       SizedBox(height: 2.0),
                  //       Text(
                  //         widget.event.venue.city.name,
                  //         style: TextStyle(
                  //           fontSize: 20.0,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   Column(
                  //     children: [
                  //       Text(
                  //         'Length',
                  //         style:
                  //             TextStyle(color: Colors.black54, fontSize: 16.0),
                  //       ),
                  //       SizedBox(height: 2.0),
                  //       Text(
                  //         '${widget.event.start.toString()} min',
                  //         style: TextStyle(
                  //           fontSize: 20.0,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ],
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.event.content,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ContentScroll(
          // images: widget.event.poster,
          // title: 'Screenshots',
          // imageHeight: 200.0,
          // imageWidth: 250.0,
          // ),
        ],
      ),
    );
  }
}
