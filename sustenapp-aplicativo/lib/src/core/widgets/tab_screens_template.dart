import 'package:flutter/material.dart';
import 'package:susten_app/src/core/enums/consumption_tempalte_icon_position.dart';
import 'package:susten_app/src/core/enums/consumption_template_container_size.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/redirect.dart';
import 'package:susten_app/src/core/widgets/my_text.dart';
import 'package:susten_app/src/features/authentication/domain/usecases/logout.dart';

class TabScreensTemplate extends StatelessWidget {
  final bool? includesBackButton;
  final Widget child;
  final String title;
  final ConsumptionTemplateIconPosition? iconPosition;
  final ConsumptionTemplateContainerSize? containerSize;
  final bool? waterImage;
  final bool? rainImage;

  const TabScreensTemplate({
    Key? key,
    this.includesBackButton = true,
    required this.child,
    required this.title,
    this.iconPosition = ConsumptionTemplateIconPosition.LEFT,
    this.containerSize = ConsumptionTemplateContainerSize.BIG,
    this.waterImage = false,
    this.rainImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final logoutUseCase = LogoutUseCase();

    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Container(
      color: primaryColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              iconPosition == ConsumptionTemplateIconPosition.LEFT
                  ? Positioned(
                      left: -constraints.maxWidth * 0.14,
                      top: -constraints.maxHeight * 0.015,
                      child: Image.asset(
                        'assets/images/bubbles-left.png',
                        height: constraints.maxHeight * 0.25,
                        width: constraints.maxWidth * 0.52,
                      ),
                    )
                  : Positioned(
                      right: -constraints.maxWidth * 0.14,
                      top: -constraints.maxHeight * 0.015,
                      child: Image.asset(
                        'assets/images/bubbles-right.png',
                        height: constraints.maxHeight * 0.25,
                        width: constraints.maxWidth * 0.52,
                      ),
                    ),
              Positioned(
                top: statusBarHeight,
                child: Container(
                  color: Colors.transparent,
                  height: 50,
                  width: constraints.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        includesBackButton == true
                            ? IconButton(
                                onPressed: () {
                                  redirectToPage("/tab_routes", context);
                                  // redirectToPreviousPage(context);
                                  // FIX
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              )
                            : IconButton(onPressed: () {}, icon: Container()),
                        MyText(
                          text: title.toUpperCase(),
                          color: Colors.white,
                          fontFamily: 'Lexend',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        IconButton(
                          onPressed: () async {
                            await logoutUseCase.call(context);
                          },
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: containerSize == ConsumptionTemplateContainerSize.BIG
                    ? 0
                    : -constraints.maxHeight * 0.15,
                child: Container(
                  height: constraints.maxHeight * 0.86,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(constraints.maxHeight * 0.07),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(constraints.maxHeight * 0.02),
                    child: child,
                  ),
                ),
              ),
              waterImage == true
                  ? Positioned(
                      top: constraints.maxHeight * 0.11,
                      left: 0,
                      child: Image.asset(
                        "assets/images/water.png",
                        height: constraints.maxHeight * 0.27,
                        width: constraints.maxWidth * 0.47,
                      ),
                    )
                  : Container(),
              rainImage == true
                  ? Positioned(
                      top: constraints.maxHeight * 0.105,
                      right: -constraints.maxWidth * 0.10,
                      child: Image.asset(
                        "assets/images/rain.png",
                        height: constraints.maxHeight * 0.30,
                        width: constraints.maxWidth * 0.50,
                      ),
                    )
                  : Container()
            ],
          );
        },
      ),
    );
  }
}
