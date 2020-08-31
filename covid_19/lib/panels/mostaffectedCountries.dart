import 'package:flutter/material.dart';

class MostaffectedPanel extends StatelessWidget {


  final List countryData;

  const MostaffectedPanel({Key key, this.countryData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics:NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
           margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
           child: Row(
             children: [
               Image.network(countryData[index]['countryInfo']['flag'],
               height: 35,
               ),
               SizedBox(width: 12),
               Text(countryData[index]['country'],
               style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.w700,
               ),
               ),
               SizedBox(width: 12),
               Text(" Deaths: "+countryData[index]['deaths'].toString(),
               style: TextStyle(
                 color: Colors.red,
                 fontSize: 19,
                 fontWeight: FontWeight.bold,
               ),
               ),
             ],
           ),
            );
        },
        itemCount: 5,
        ),
    );
  }
}