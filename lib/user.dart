class User {
  late String name;
  late String city;
  late String image;

  User({required this.name, required this.city, required this.image});

// convert json =>User object
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    image = json['image'];
  }
//converts user object => json
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': city,
        'image': image,
      };

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['name'] = name;
  //   data['city'] = city;
  //   data['image'] = image;

  // }
}
