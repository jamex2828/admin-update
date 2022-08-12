import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_menu_page/administrator/details.dart';
import 'package:main_menu_page/data_class.dart';
import 'package:main_menu_page/http_helper.dart';
import 'dart:async';

class MyList extends StatefulWidget {
  MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
  List<Item> items = [];
  Future<List<Item>> getItems() async {
    var data = await http.get(Uri.parse('http://192.168.1.19:1337/api/items'));
    var jsonData = json.decode(data.body);

    final item = jsonData['data'];

    return item.map((userJson) => Item.fromJson(userJson)).toList();
  }
  // Future<void> getItems() async {
  //   resultNotifier.value = RequestLoadInProgress();
  //   Response response = await http.get(
  //     Uri.parse('http://localhost:1337/api/items'),
  //   );
  //   print('Status code: ${response.statusCode}');
  //   print('Headers: ${response.headers}');
  //   print('Items: ${response.body}');
  //   _handleResponse(response);
  // }

  // void _handleResponse(Response response) {
  //   if (response.statusCode >= 400) {
  //     resultNotifier.value = RequestLoadFailure();
  //   } else {
  //     resultNotifier.value = RequestLoadSuccess(response.body);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getItems(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text("Loading..."),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].propertyNum),
                    subtitle: Text(snapshot.data[index].description),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyDetail(snapshot.data[index])));
                    },
                  );
                });
          }
        });
  }
}
