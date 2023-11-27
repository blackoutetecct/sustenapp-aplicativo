import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/features/consumption/data/models/Room.dart';

final roomsProvider = StateProvider<List<RoomModel>>((ref) => []);
