import 'package:bmi/core/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: OnBoarding(),
    );
  }
}

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/first_img.png'),
          SizedBox(height: 120),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.all(21),
              child: Column(
                children: [
                  Text(
                    'Know Your Body Better ,Get Your BMI Score in Less Than a Minute!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'It takes just 30 seconds – and your health is worth it!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.greyWhite,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 24),
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Get Start",
                        style: TextStyle(color: Colors.white),
                      ),

                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // Adjust the radius here
                        ),

                        backgroundColor: AppColors.darkPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
