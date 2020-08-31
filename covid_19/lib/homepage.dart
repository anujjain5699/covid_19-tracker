import 'dart:convert';

import 'package:covid_19/dataSource.dart';
import 'package:covid_19/pages/countryPage.dart';
import 'package:covid_19/panels/infoPanel.dart';
import 'package:covid_19/panels/mostaffectedCountries.dart';
import 'package:covid_19/panels/worldwidepanel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldwideData() async{
    http.Response response= await http.get("https://disease.sh/v3/covid-19/all");
    setState(() {
      worldData=json.decode(response.body);
    }
    );
  }

    List countryData;
  fetchCountryData() async{
    http.Response response= await http.get("https://disease.sh/v3/covid-19/countries?sort=cases");
    setState(() {
      countryData=json.decode(response.body);
    }
    );
  }

  @override
  void initState() {
    fetchWorldwideData();
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 30,
            icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.wb_sunny:Icons.brightness_4),
            onPressed: (){
              DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
            },
          ),
        ],
        title: Text(
          "Covid-19 Tracker",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.amber[100],
              child: Text(
                DataSource.quote,
              style: TextStyle(
                color: Colors.orange[900],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Worldwide",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Poppins",
                      letterSpacing: 1.3,
                    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>CountryPage()));
                      },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(17.0),
                        ),
                        padding: EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Icon(Icons.touch_app,size: 30,color: Colors.black,),
                            Text(
                            "Regional",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ],
                        ),
                      ),
                    ), 
                ],
              ),
            ),
            worldData==null?CircularProgressIndicator():WorldwidePanel(worldData: worldData,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal :10.0,vertical: 8),
              child: Text(
                      "Most affected Countries",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        letterSpacing: 1.1,
                      ),
                      ),
            ),
            countryData==null?Container():MostaffectedPanel(countryData: countryData,),
            SizedBox(height: 17.0),
            InfoPanel(),
            SizedBox(height: 20.0),
            Center(
              //heightFactor: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.group,size:40,),
                  Text(
                    "WE ARE TOGETHER IN THE FIGHT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35.0),
          ],
        ),
      ),
    );
  }
}