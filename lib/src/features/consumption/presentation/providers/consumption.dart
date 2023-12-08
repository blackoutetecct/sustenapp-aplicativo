import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/features/consumption/data/models/ConsumptionData.dart';

final electricDataProvider = StateProvider<ConsumptionData>((ref) => ConsumptionData(
      consumption: 0,
      estimatedprice: 0,
      averageDailyConsumption: 0,
      averageWeeklyConsumption: 0,
      type: 'electric',
    ));

final hidricDataProvider = StateProvider<ConsumptionData>((ref) => ConsumptionData(
      consumption: 0,
      estimatedprice: 0,
      averageDailyConsumption: 0,
      averageWeeklyConsumption: 0,
      type: "hidric",
    ));
