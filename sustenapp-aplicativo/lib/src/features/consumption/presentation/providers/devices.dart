import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/features/consumption/data/models/Device.dart';

final devicesProvider = StateProvider<List<DeviceModel>>((ref) => []);
