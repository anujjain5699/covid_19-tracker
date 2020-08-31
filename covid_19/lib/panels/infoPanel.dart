import 'package:covid_19/dataSource.dart';
import 'package:covid_19/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context)=>FAQPage()),);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
              color: Theme.of(context).brightness==Brightness.dark?Colors.white:primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FAQs",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.grey[100],
                    ), 
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color:Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.grey[100],
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              launch('https://covid19responsefund.org/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
              color: Theme.of(context).brightness==Brightness.dark?Colors.white:primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DONATE",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.grey[100],
                    ), 
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.grey[100],
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
              child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
              color: Theme.of(context).brightness==Brightness.dark?Colors.white:primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MYTH BUSTERS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.grey[100],
                    ), 
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.grey[100],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}