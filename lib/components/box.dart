import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          getBook();
        },
        child: Text('API'),
      ),
    );
  }
}

Future<String> getBook() async {
  try {
    final response =
        await http.get(new Uri.http("localhost:8080", "/v1/book/list"));
    if (response.statusCode == 200) {
// 成功
      return response.body;
    } else {
// 失敗
    }
  } catch (e) {
    return e;
  }
}
