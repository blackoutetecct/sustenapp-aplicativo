import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:susten_app/src/features/consumption/data/models/Consumption.dart";
import 'package:susten_app/src/features/consumption/data/models/GetPortResponse.dart';

abstract class EspRepository {
   Future<GetPortResponse> getPort(WidgetRef ref);
   Future<void> assignPort(int port, WidgetRef ref);
   Future<bool> isDeviceOn(int port, WidgetRef ref);
   Future<void> changeDeviceStatus(int port, WidgetRef ref);
   Future<Consumption> getConsumption(String type,bool renewable,WidgetRef ref);

}