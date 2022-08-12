import 'package:flutter/material.dart';
import 'package:main_menu_page/data_class.dart';
import './main.dart';
import 'package:http/http.dart' as http;

class MyDetail extends StatefulWidget {
  Item item;
  MyDetail(this.item);
  @override
  _MyDetailState createState() => _MyDetailState(this.item);
}

class _MyDetailState extends State<MyDetail> {
  Item item;
  _MyDetailState(this.item);
  void edit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home(0, item.id)));
  }

  void delete() async {
    // await http.delete('http://10.10.10.15:1337/api/items${item.id}');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home(1, 0)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text(item.propertyNum)),
          body: Container(
              child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Id: " + item.id.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Property Number: " + item.propertyNum,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: Text(
                    "Description: " + item.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: edit,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text("Edit"),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: delete,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text("Delete"),
                    ),
                  ],
                )
              ],
            ),
          ))),
    );
  }
}
