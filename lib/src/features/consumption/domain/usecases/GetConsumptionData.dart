import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/features/consumption/data/models/ConsumptionData.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/consumptio_repository.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/consumption.dart';

class GetConsumptionDataUseCase {
  final ConsumptionRepository consumptionRepo;

  GetConsumptionDataUseCase({required this.consumptionRepo});

  call({required WidgetRef ref}) async {
    List<ConsumptionData> consumptionData =
        await consumptionRepo.getConsumption();
    final electricState = ref.read(electricDataProvider.notifier);
    final hidricState = ref.read(hidricDataProvider.notifier);

    for (var data in consumptionData) {
      if (data.type == "electric") {
        electricState.state = data;
        continue;
      }
      hidricState.state = data;
    }
  }
}
