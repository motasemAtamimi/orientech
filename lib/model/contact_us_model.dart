class ContactUsModel {
  String? name;
  String? email;
  String? phone;
  String? message;
  List<String>? photo;


  ContactUsModel(
      {
        this.name,
        this.email,
        this.phone,
        this.message,
        this.photo,
      });

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    message = json['message'];
    photo = json['photo'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['message'] = this.message;
    data['photo'] = this.photo;


    return data;
  }
}