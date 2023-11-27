class DeviceModel {
  final String id;
  final String nome;
  final int porta;

  DeviceModel({required this.id, required this.nome, required this.porta});

  static DeviceModel fromJson(Map<dynamic, dynamic> json) {
    return DeviceModel(
        id: json['id'], nome: json['nome'], porta: json['porta']);
  }
}
