import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/utils/dateTimeInfo.dart';

class HomeGreetings extends StatelessWidget {
  final String userName;

  const HomeGreetings({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weekDay = DateTimeInfo.getWeekday();
    final monthDay = DateTimeInfo.getDayOfMonth();
    final month = DateTimeInfo.getMonth();

    final formattedDate = "$weekDay,  $monthDay, $month";

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Row(
            children: [
              Hero(
                tag: 'userPic',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(constraints.maxWidth),
                  child: Container(
                    width: constraints.maxWidth * 0.2,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: Image.asset(
                      "assets/images/user.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olá, $userName",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 21,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      formattedDate,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color(0xFF878781),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
