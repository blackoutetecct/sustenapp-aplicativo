import 'package:susten_app/src/features/consumption/data/models/Device.dart';

abstract class DeviceRepository {
  Future<DeviceModel> create({required String name, required String room, required int port});
}
