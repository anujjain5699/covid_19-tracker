import 'package:flutter/material.dart';

class Search extends SearchDelegate{

    final List countryList;

  Search(this.countryList);


  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed:(){
            query='';
          } )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
     return IconButton(
       icon: Icon(Icons.arrow_back_ios),
       onPressed: (){
         Navigator.pop(context);
       },
       );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {

      final suggestionList=
      query.isEmpty?countryList:
      countryList.where((element) => 
      element['country'].toString().
      toLowerCase().startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
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
                      suggestionList[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                      Image.network(suggestionList[index]['countryInfo']['flag'],height: 50,width: 60),

                    ], 
                  ),
                ),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CONFIRMED: "+suggestionList[index]['cases'].toString(),
                      style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                      Text("ACTIVE: "+suggestionList[index]['active'].toString(),
                      style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),),
                      Text("RECOVERED: "+suggestionList[index]['recovered'].toString(),
                      style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
                      Text("DEATHS: "+suggestionList[index]['deaths'].toString(),
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
      });
  }

}