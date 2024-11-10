import 'package:flutter/material.dart';
import 'package:soltech/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soltech/modules/scanpay/qr_screen.dart';
import 'modules/auth/login/login_screen.dart';
import 'modules/auth/register/register_screen.dart';
import 'modules/bank/add_bank.dart';
import 'modules/home/home_page.dart';
import 'modules/redeem/redeem_container.dart';
import 'modules/scanpay/payment.dart';
import 'modules/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soltech',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: bgColor,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: textColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),

        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home':(context) => const HomeScreen(),
        '/scanPay': (context) => QrScannerScreen(),
        '/redeem': (context) => RedeemRewardPointsWidget(),
        '/manageAccount': (context) => ManageAccountScreen(),
        '/payment': (context) => PaymentScreen(),


      },
    );
  }
}
