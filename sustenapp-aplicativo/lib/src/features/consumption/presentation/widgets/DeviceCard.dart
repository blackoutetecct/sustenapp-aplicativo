import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/features/consumption/domain/repositories/esp_repository.dart';

class DeviceCard extends ConsumerStatefulWidget {
  final BoxConstraints constrants;
  final String name;
  final int port;
  final EspRepository espRepo;

  const DeviceCard(
      {Key? key,
      required this.constrants,
      required this.name,
      required this.port,
      required this.espRepo})
      : super(key: key);

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends ConsumerState<DeviceCard> {
  bool isActive = false;
  bool firstLoad = true;

  String url = "";

  void updateState(bool? value) {
    if (mounted) {
      setState(() {
        isActive = (value ?? !isActive);
        final sufix = isActive ? "-on" : "-off";
        url = "assets/images/${widget.name.toLowerCase()}$sufix.png";
      });
    }
  }

  void changeDeviceStatus() {
    widget.espRepo.changeDeviceStatus(widget.port, ref).then((value) {
      updateState(null);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
        url = "assets/images/${widget.name.toLowerCase()}-off.png";
    });
    widget.espRepo.isDeviceOn(widget.port, ref).then((value) {
      updateState(value);
    });
  }

  @override
  Widget build(BuildContext context) {

    if (firstLoad) {
      setState(() {
        firstLoad = false;
      });
      widget.espRepo.isDeviceOn(widget.port, ref).then((value) {
        updateState(value);
      });
    }

    return GestureDetector(
      onTap: changeDeviceStatus,
      child: Container(
        width: widget.constrants.maxWidth * 0.45,
        decoration: BoxDecoration(
          color: isActive ? primaryColor : Colors.white,
          borderRadius:
              BorderRadius.circular(widget.constrants.maxWidth * 0.07),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Visibility(
                      visible: url.isNotEmpty,
                      child: Image.asset(
                        url,
                        width: widget.constrants.maxWidth * 0.15,
                        height: widget.constrants.maxHeight * 0.13,
                      ),
                    ),
                  ),
                  //MOME
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.name.toUpperCase(),
                      style: TextStyle(
                          color: isActive ? Colors.white : primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Poppins"),
                    ),
                  ),
                  Container(
                    height: widget.constrants.maxHeight * 0.005,
                  ),
                  //STATUS
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      isActive ? "ON" : "OFF",
                      style: TextStyle(
                        color: isActive ? Colors.white : primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Poppins",
                      ),
                    ),
                  )
                ],
              ),
            ),
            //STATUS INDICATOR
            Positioned(
              top: widget.constrants.maxHeight * 0.02,
              right: widget.constrants.maxHeight * 0.02,
              child: Container(
                width: widget.constrants.maxWidth * 0.07,
                height: widget.constrants.maxHeight * 0.035,
                decoration: BoxDecoration(
                  color: isActive ? yellowColor : lightGray,
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
