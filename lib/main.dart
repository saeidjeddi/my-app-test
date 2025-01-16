import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Estedad',
      ),
      debugShowCheckedModeBanner: false,
      title: 'My App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        // Locale('en'), // English
        Locale('fa'), // persian
      ],
      home: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 32,
                  height: 32,
                ),
              ),

                            Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                child: Text(
                  'قیمت بروز ارزها',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.black),
                ),
              ),

              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),
                        child: Image.asset(
                          'assets/images/menu.png',
                          width: 20,
                          height: 20,
                        ),
                      ))),

            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/12.png',
                      width: 15,
                      height: 15,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'نرخ ارز آزاد ',
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "برای اطلاع از نرخ ارز آزاد امروز به اینجا مراجعه کنید تا در لحظه از قیمت ها با خبر شوید .",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.red, fontSize: 12, fontFamily: 'Tanha'),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(),
              ],
            ),
          )),
    );
  }
}
