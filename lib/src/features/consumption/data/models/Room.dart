import 'package:susten_app/src/features/consumption/data/models/Device.dart';

class RoomModel {
  final String name;
  final String user;
  final String id;
  final List<DeviceModel> devices;

  RoomModel({
    required this.id,
    required this.name,
    required this.user,
    required this.devices,
  });

  static RoomModel fromJson(Map<dynamic, dynamic> json) {
    final List<DeviceModel> devices = [];

    if (json['dispositivos'] != null) {
      final devicesJson = json['dispositivos'] as List<dynamic>;
      devices.addAll(devicesJson.map((device) {
        return DeviceModel.fromJson(device);
      }));
    }

    return RoomModel(
      id: json['id'],
      name: json['nome'],
      user: json['usuario'],
      devices: devices,
    );
  }
}
