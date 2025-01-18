import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 246, 255),
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
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Text(
              'قیمت بروز ارزها',
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 8),
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
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                const SizedBox(width: 8),
                const Text('نرخ ارز آزاد '),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "برای اطلاع از نرخ ارز آزاد امروز به اینجا مراجعه کنید تا در لحظه از قیمت ها با خبر شوید .",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontFamily: 'Tanha',
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 130, 130, 130),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(' نام ارز '),
                  Text('  قیمت '),
                  Text('  تغییرات '),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 430,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (BuildContext context, int position) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MyItem(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index % 5 == 0) {
                    return const Ads();
                  } else {
                    return const SizedBox(
                      width: 0,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      child: TextButton.icon(
                        onPressed: () => _showSnackBar(context, " بروزرسانی انجام شد .",),
                        icon: const Icon(
                          CupertinoIcons.refresh_bold,
                          size: 30,
                        ),
                        label: const Text('بروزرسانی'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        'زمان بروزرسانی : 2025-01-11 19:20',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      backgroundColor: Colors.green,
    ),
  );
}

class MyItem extends StatelessWidget {
  const MyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
            blurRadius: 1.0,
            color: Colors.grey,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text('دلار'),
          Text('5200000'),
          Text('+50', textDirection: TextDirection.ltr),
        ],
      ),
    );
  }
}

class Ads extends StatelessWidget {
  const Ads({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
            blurRadius: 1.0,
            color: Colors.grey,
          )
        ],
        color: Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Center(
        child: Text('تبلیغات برای شما با ما تماس بگیرید .'),
      ),
    );
  }
}
