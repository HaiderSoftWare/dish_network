class Products {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? image;
  List<Status>? status;

  Products(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.status});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(Status.fromJson(v));
      });
    }
  }
}

class Status {
  int? id;
  String? name;
  String? time;
  bool? status;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Status(
      {this.id,
      this.name,
      this.time,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
