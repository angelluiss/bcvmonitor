class LoginModel {
  late bool ok;
  late Usuario usuario;
  late String token;

  LoginModel({required this.ok, required this.usuario, required this.token});

  LoginModel.withError(String errorMessage);

  LoginModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    usuario =
        (json['usuario'] != null ? Usuario.fromJson(json['usuario']) : null)!;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ok'] = ok;
    data['usuario'] = usuario.toJson();
    data['token'] = token;
    return data;
  }
}

class Usuario {
  late int id;
  late String uuid;
  late String email;
  late String name;
  late bool online;
  late bool isAdmin;
  late bool isMonitor;
  late String createdAt;
  late String updatedAt;

  Usuario(
      {required this.id,
      required this.uuid,
      required this.email,
      required this.name,
      required this.online,
      required this.isAdmin,
      required this.isMonitor,
      required this.createdAt,
      required this.updatedAt});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    email = json['email'];
    name = json['name'];
    online = json['online'];
    isAdmin = json['isAdmin'];
    isMonitor = json['isMonitor'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['uuid'] = uuid;
    data['email'] = email;
    data['name'] = name;
    data['online'] = online;
    data['isAdmin'] = isAdmin;
    data['isMonitor'] = isMonitor;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
