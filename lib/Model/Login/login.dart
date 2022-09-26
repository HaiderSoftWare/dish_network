class Login {
  User? user;
  String? accessToken;
  String? tokenType;
  String? expiresIn;

  Login({this.user, this.accessToken, this.tokenType, this.expiresIn});

  Login.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? image;

  User(
      {this.id,
      this.name,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }
}
