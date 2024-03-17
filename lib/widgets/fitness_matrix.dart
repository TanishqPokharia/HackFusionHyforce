import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prognosify/router/app_router_constants.dart';
import 'package:prognosify/widgets/frosted_options.dart';

class FitnessMatrix extends StatelessWidget {
  const FitnessMatrix({super.key});

  double mq(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * (size / 1000);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FrostedOptions(
      color: Colors.white,
      child: Container(
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(AppRouterConstants.bmiScreen);
                      },
                      child: FrostedOptions(
                          color: Colors.indigo,
                          child: Container(
                              alignment: Alignment.center,
                              height: mq(context, 80),
                              width: mq(context, 150),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.scale,
                                    color: Colors.indigo,
                                  ),
                                  Text(
                                    "BMI",
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold,
                                        fontSize: mq(context, 20)),
                                  )
                                ],
                              ))),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(AppRouterConstants.calorieScreen);
                      },
                      child: FrostedOptions(
                          color: Colors.orange,
                          child: Container(
                              alignment: Alignment.center,
                              height: mq(context, 80),
                              width: mq(context, 150),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.whatshot,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    "Calorie",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: mq(context, 20)),
                                  )
                                ],
                              ))),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(AppRouterConstants.sleepMonitorScreen);
                      },
                      child: FrostedOptions(
                          color: Colors.deepPurple,
                          child: Container(
                              alignment: Alignment.center,
                              height: mq(context, 80),
                              width: mq(context, 150),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.hotel,
                                    color: Colors.deepPurple,
                                  ),
                                  Text(
                                    "Sleep",
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: mq(context, 20)),
                                  )
                                ],
                              ))),
                    ),
                  ),
                  Container(
                    child: FrostedOptions(
                        color: Colors.amber,
                        child: Container(
                            alignment: Alignment.center,
                            height: mq(context, 80),
                            width: mq(context, 150),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "Feature",
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                      fontSize: mq(context, 20)),
                                )
                              ],
                            ))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
