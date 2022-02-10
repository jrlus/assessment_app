import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:dio/dio.dart';

import 'screens/card_app.dart';
import 'screens/button_list_horizontal.dart';
import 'screens/svg_button_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: 'Three Astronauts',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String url = "https://innovasalud.com.ve";
  final String recordsPerPage = '?recordsPerPage=-1';
  List doctors = [];

  getStateDoctor() async {
    var response = await Dio().get(url + "/api/medicos" + recordsPerPage);
    return response.data['data'];
  }

  @override
  void initState() {
    getStateDoctor().then((data) {
      setState(() {
        doctors = data;
        //print(doctors.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    const paddingListH =
        EdgeInsets.only(top: 5.0, bottom: 15.0, left: 6.0, right: 6.0);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              // TODO: Heading
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/nasa.png', width: width * 0.28),
                    Row(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: const Icon(
                            MdiIcons.bellOutline,
                            color: Colors.black,
                          ),
                          mini: true,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: const Icon(MdiIcons.cogOutline,
                              color: Colors.black),
                          mini: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // TODO: Favorites
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: SizedBox(
                  height: height * 0.05,
                  child: Material(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Favorites",
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FloatingActionButton.small(
                          onPressed: null,
                          child: Icon(MdiIcons.plus, color: Colors.black),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // TODO: List Horizontal => Widget
              Container(
                color: const Color(0xfffbfbfb),
                height: height * 0.08,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    ButtonListHorizontal(
                      paddingListH: paddingListH,
                      textButton: "All",
                      backgroundColorButton: Colors.white,
                    ),
                    ButtonListHorizontal(
                      paddingListH: paddingListH,
                      textButton: "Happy Hours",
                      backgroundColorButton: Color(0xffff7723),
                    ),
                    ButtonListHorizontal(
                      paddingListH: paddingListH,
                      textButton: "Drinks",
                      backgroundColorButton: Colors.white,
                    ),
                    ButtonListHorizontal(
                      paddingListH: paddingListH,
                      textButton: "Beer",
                      backgroundColorButton: Colors.white,
                    ),
                    ButtonListHorizontal(
                      paddingListH: paddingListH,
                      textButton: "Others",
                      backgroundColorButton: Colors.white,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: SizedBox(
                  height: height * 0.05,
                  child: Material(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Happy Hours",
                          style: TextStyle(
                            fontSize: 25.0,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        FloatingActionButton.small(
                          onPressed: null,
                          child:
                              Icon(Icons.delete_outlined, color: Colors.black),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // TODO: List Vertical => Widget
              SizedBox(
                height: height * 0.5,
                child: doctors.isNotEmpty
                    ? ListView.builder(
                        itemCount: doctors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CardApp(
                              imgCard: NetworkImage(
                                  "$url/${doctors[index]['foto']}"),
                              titleCard: doctors[index]['nombre'],
                            ),
                          );
                        },
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){},
              child: const SvgButtonBar(
                  imgSvg: 'images/home.svg'
              ),
            ),
            InkWell(
              onTap: (){},
              child: const SvgButtonBar(
                  imgSvg: 'images/calendar.svg'
              ),
            ),
            InkWell(
              onTap: (){},
              child: const SvgButtonBar(
                  imgSvg: 'images/search.svg'
              ),
            ),
            InkWell(
              onTap: (){},
              child: const SvgButtonBar(
                imgSvg: 'images/heart.svg',
                colorSvg: Colors.black,
              ),
            ),
            const Text(
              "Favorites",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
