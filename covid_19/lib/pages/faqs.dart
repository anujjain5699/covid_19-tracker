import 'package:covid_19/dataSource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index){
          return ExpansionTile(
            tilePadding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
            title: Text(DataSource.questionAnswers[index]['question'],
            style: TextStyle(fontSize: 22),),
            children: [
              Card(
                elevation: 10,
                  child: Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(DataSource.questionAnswers[index]['answer'],
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                ),
              ),
            ],
            );
        },
        ),
    );
  }
}