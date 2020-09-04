import 'package:flutter/material.dart';
import 'package:flutter_http_example/http_dogs/model/http_dog_model.dart';
import 'package:flutter_http_example/http_dogs/viewModel/http_dogs_view_model.dart';

class HttpDogsView extends HttpDogsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView.builder(
        itemCount: httpDogs.length,
        itemBuilder: (context, index) => buildCardHttp(httpDogs[index]),
      ),
    );
  }

  Card buildCardHttp(HttpDogModel dog) {
    const TEXT_PADDING = 10.0;
    return Card(
      margin: EdgeInsets.all(TEXT_PADDING),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(TEXT_PADDING), child: Text(dog.dogName)),
          Padding(
            padding: EdgeInsets.all(TEXT_PADDING),
            child: Image.network(dog.dogImage),
          ),
          Padding(
              padding: EdgeInsets.all(TEXT_PADDING),
              child: Text(dog.dogProperty, textAlign: TextAlign.justify)),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: buildTextAppBar(),
      leading: buildPaddingProgress,
    );
  }

  Widget get buildPaddingProgress {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  Text buildTextAppBar() => Text("Dogs");
}
