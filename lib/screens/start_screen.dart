import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prognosify/main.dart';
import 'package:prognosify/router/app_router_constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi,",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser!.displayName ?? "User",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Welcome To Prognosify",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Assess your vulnerabilities and guard your tomorrow",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Enter your age to proceed",
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: kColorScheme.primary, width: 2)),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: ElevatedButton(
                onPressed: () {
                  try {
                    int age = _textEditingController.text.toInt();
                    if (age > 110 || age < 1) return;
                    GoRouter.of(context).pushNamed(
                        AppRouterConstants.questionsScreen,
                        extra: age);
                  } on Exception catch (e) {
                    showDialog(
                        context: context,
                        builder: ((context) => Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: Colors.white,
                            child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Text("Invalid Age!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall),
                                      ),
                                    ])))));
                  }
                },
                child: const Text("Start Assessment")),
          )
        ],
      ),
    );
  }
}