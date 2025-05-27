class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? password;
  String? masothue;
  String? phone;
  String? soCCCD;
  String? adress;
  String? soGPLX;
  String? imgGPLXPath;
  String? status;
  String? profilePhotoPath;
  List<String>? roles;

  User(
      this.id,
      this.name,
      this.username,
      this.email,
      this.password,
      this.masothue,
      this.phone,
      this.soCCCD,
      this.adress,
      this.soGPLX,
      this.imgGPLXPath,
      this.status,
      this.profilePhotoPath,
      this.roles);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] as String?;
    username = json['username'] as String?;
    email = json['email'] as String?;
    masothue = json['masothue'] as String?;
    phone = json['phone'] as String?;
    soCCCD = json['soCCCD'] as String?;
    adress = json['adress'] as String?;
    soGPLX = json['soGPLX'] as String?;
    imgGPLXPath = json['img_GPLX_path'] as String?;
    status = json['status'] as String?;
    profilePhotoPath = json['profile_photo_path'] as String?;

    // Xử lý roles một cách an toàn
    if (json['roles'] != null) {
      if (json['roles'] is List) {
        roles = (json['roles'] as List).map((item) => item.toString()).toList();
      }
    } else {
      roles = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['masothue'] = masothue;
    data['phone'] = phone;
    data['soCCCD'] = soCCCD;
    data['adress'] = adress;
    data['soGPLX'] = soGPLX;
    data['img_GPLX_path'] = imgGPLXPath;
    data['status'] = status;
    data['profile_photo_path'] = profilePhotoPath;
    data['roles'] = roles;
    return data;
  }

  bool isDriver() {
    return roles?.contains('tai_xe') ?? false;
  }

  bool isContractor() {
    return roles?.contains('nha_thau') ?? false;
  }
}
