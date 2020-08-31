import 'package:covid_19/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  List countryData;
  fetchCountryData() async{
    http.Response response= await http.get("https://disease.sh/v3/covid-19/countries");
    setState(() {
      countryData=json.decode(response.body);
    }
    );
  }


   @override
  void initState() { 
    fetchCountryData();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search,size: 30,), 
            onPressed: (){
              showSearch(
                context: context, 
                delegate: Search(countryData));
            }),
        ],
        title: Text(
          "Country Stats"),
      ),
      body: countryData==null?Center(
        child: CircularProgressIndicator(),)
        :ListView.builder(itemBuilder: (context,index){
      return Card(
         child: Container(
          height: 130,
            child: Row(
              children: [
                Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      countryData[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                      Image.network(countryData[index]['countryInfo']['flag'],height: 50,width: 60),

                    ], 
                  ),
                ),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CONFIRMED: "+countryData[index]['cases'].toString(),
                      style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                      Text("ACTIVE: "+countryData[index]['active'].toString(),
                      style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),),
                      Text("RECOVERED: "+countryData[index]['recovered'].toString(),
                      style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
                      Text("DEATHS: "+countryData[index]['deaths'].toString(),
                      style: TextStyle(fontSize: 15,
                      color: Theme.of(context).
                      brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900],
                      fontWeight: FontWeight.bold),),
                    ],
                  ),
                )),
              ],
            ),
        ),
      );
    },
      itemCount: countryData==null?0:countryData.length,
    ),
    );
  }
}