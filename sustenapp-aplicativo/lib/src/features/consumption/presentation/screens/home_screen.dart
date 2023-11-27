import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/core/widgets/tab_screens_template.dart';
import 'package:susten_app/src/features/authentication/presentation/providers/user_data.dart';
import 'package:susten_app/src/features/consumption/data/repositories/consumption_repository.dart';
import 'package:susten_app/src/features/consumption/domain/usecases/GetAllRooms.dart';
import 'package:susten_app/src/features/consumption/domain/usecases/GetConsumptionData.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/home_consumption_card.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/home_greetings.dart';
import 'package:susten_app/src/features/consumption/presentation/widgets/rooms_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GetConsumptionDataUseCase useCase =
      GetConsumptionDataUseCase(consumptionRepo: ConsumptionRepositoryImpl());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GetAllRoomsUseCase getAllRoomsUseCase =
        GetAllRoomsUseCase(consumptionRepo: ConsumptionRepositoryImpl());

    getAllRoomsUseCase.call(ref: ref);
    useCase.call(ref: ref);

    return TabScreensTemplate(
      title: "INICIO",
      includesBackButton: false,
      child: Container(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(builder: (context, ref, _) {
                final userName = ref.watch(userNameProvider);

                return HomeGreetings(userName: userName);
              }),
              SizedBox(
                height: constraints.maxHeight * 0.03,
              ),
              HomeConsumptionCard(parentConstraints: constraints),
              SizedBox(
                height: constraints.maxHeight * 0.03,
              ),
              const MyText(
                text: "CÔMODOS",
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: darkBrawn,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.42,
                child: const RoomsList(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
