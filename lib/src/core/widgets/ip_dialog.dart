import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/form_validator.dart';
import 'package:susten_app/src/features/consumption/domain/usecases/SaveEspIp.dart';

class EspIpDialog {
  static SaveEspIpUseCase saveEspIpUseCase = SaveEspIpUseCase();

  static GlobalKey<FormState> globaFormKey = GlobalKey<FormState>();

  static save(String ip, BuildContext context, WidgetRef ref) {
    if (globaFormKey.currentState?.validate() == true) {
      saveEspIpUseCase.call(ip, ref);
      Navigator.pop(context);
      return;
    }
  }

  static showMyDialog(
    BuildContext context,
  ) async {
    TextEditingController textController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            insetPadding: EdgeInsets.zero,
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height / 1.7),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    // CLOSE BUTTON
                    Align(
                      alignment: Alignment.centerRight,
                      child: TapRegion(
                        onTapInside: Navigator.of(context).pop,
                        child: const Icon(
                          Icons.close,
                          size: 35,
                        ),
                      ),
                    ),
                    // ADD ICON + TITLE
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(999)),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(constraints.maxWidth * 0.01),
                              child: Icon(
                                Icons.add,
                                size: constraints.maxWidth * 0.12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Text(
                            "  Conexão",
                            style: TextStyle(
                              color: darkBrawn,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lexend',
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.023,
                    ),
                    // INPUT
                    Form(
                      key: globaFormKey,
                      child: TextFormField(
                        controller: textController,
                        validator: (value) {
                          return FormValidator.validateIpAddress(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: secondaryColor,
                          hintText: 'Endereço IP do SustenControl',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    // ADD BUTTON
                    Consumer(
                      builder: (_, ref, __) {
                        return MaterialButton(
                          onPressed: () {
                            save(textController.text, context, ref);
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          color: primaryColor,
                          child: SizedBox(
                            width: constraints.maxWidth * 0.95,
                            height: constraints.maxWidth * 0.20,
                            child: const Center(
                              child: Text(
                                "CONFIGURAR",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
