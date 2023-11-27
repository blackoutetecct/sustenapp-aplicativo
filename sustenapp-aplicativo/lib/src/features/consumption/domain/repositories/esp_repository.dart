import 'package:susten_app/src/features/consumption/data/models/GetPortResponse.dart';

abstract class EspRepository {
   Future<GetPortResponse> getPort();
   Future<void> assignPort(int port);
   Future<bool> isDeviceOn(int port);
   Future<void> changeDeviceStatus(int port);
}