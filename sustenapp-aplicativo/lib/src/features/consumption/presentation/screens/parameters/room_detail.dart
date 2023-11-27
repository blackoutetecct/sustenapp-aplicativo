import 'package:susten_app/src/features/consumption/data/models/Device.dart';

class RoomDetailArguments {
  final String title;
  final String id;
  final List<DeviceModel> devices;

  RoomDetailArguments(this.title, this.devices, this.id);
}