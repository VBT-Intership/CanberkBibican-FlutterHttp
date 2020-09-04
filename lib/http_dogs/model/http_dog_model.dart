class HttpDogModel {
  String dogName;
  String dogImage;
  String dogProperty;

  HttpDogModel({this.dogName, this.dogImage, this.dogProperty});

  HttpDogModel.fromJson(Map<String, dynamic> json) {
    dogName = json['dog_name'];
    dogImage = json['dog_image'];
    dogProperty = json['dog_property'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dog_name'] = this.dogName;
    data['dog_image'] = this.dogImage;
    data['dog_property'] = this.dogProperty;
    return data;
  }
}
