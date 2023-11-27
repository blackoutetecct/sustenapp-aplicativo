import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/consumption/presentation/providers/Rooms.dart';
import 'package:susten_app/src/features/consumption/presentation/screens/parameters/room_detail.dart';

class RoomsList extends ConsumerWidget {
  const RoomsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final rooms = ref.watch(roomsProvider);

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        child: rooms.isNotEmpty
            ? Visibility(
                visible: rooms.isNotEmpty,
                child: SizedBox(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: rooms.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                    itemBuilder: (context, index) {
                      final item = rooms[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/room_detail",
                            arguments: RoomDetailArguments(
                              item.name,
                              item.devices,
                              item.id,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/${item.name.toLowerCase().replaceAll(" ", "")}.png",
                                height: constraints.maxHeight * 0.62,
                                fit: BoxFit.contain,
                              ),
                              MyText(
                                text: item.name.toString().toUpperCase(),
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: darkBrawn,
                              ),
                              MyText(
                                text:
                                    "${item.devices.length.toString()} dispositivo${item.devices.length > 1 || item.devices.isEmpty ? "s" : ""}",
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: darkBrawn,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : Visibility(
                visible: ref.watch(roomsProvider).isEmpty,
                child: Container(
                  child: const Center(
                    child: Text(
                      "Nenhum dispositivo cadastrado. Clique no ícone + para registrar um novo dispositivo.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
