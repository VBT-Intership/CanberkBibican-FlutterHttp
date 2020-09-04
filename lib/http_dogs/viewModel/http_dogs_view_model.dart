import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_http_example/http_dogs/model/http_dog_model.dart';
import 'package:flutter_http_example/http_dogs/view/http_dogs.dart';

import 'package:http/http.dart' as http;

abstract class HttpDogsViewModel extends State<HttpDogs> {
  final baseUrl = "https://fb-dog.firebaseio.com";
  bool isLoading = false;
  List<HttpDogModel> httpDogs = [];

  @override
  void initState() {
    super.initState();
    callItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> callItems() async {
    changeLoading();
    await _getHttpDogs();
    changeLoading();
    checkErrorList();
  }

  void checkErrorList() {
    if (httpDogs.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text(".statusCode.toString()"),
        ),
      );
    }
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> _getHttpDogs() async {
    final response = await http.get("$baseUrl/dog.json");
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          httpDogs = jsonBody.map((e) => HttpDogModel.fromJson(e)).toList();
        break;
      default:
    }
  }
}
