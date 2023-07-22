class RequestContactInfoModel {
  RequestContactInfoModel({
    this.name,
    this.email,
    this.message,
  });

  String? name;
  String? email;
  String? message;

  factory RequestContactInfoModel.fromJson(Map<String, dynamic> json) =>
      RequestContactInfoModel(
        name: json["name"],
        email: json["email"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "message": message,
      };
}
