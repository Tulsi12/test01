import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/const/const.dart';
import 'package:myapp/dao/CartDAO.dart';
import 'package:myapp/database/database.dart';
import 'package:myapp/entity/cart.dart';
import 'package:myapp/pallate.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/screens/addproduct/addproduct_screen.dart';
import 'package:myapp/screens/cart/cart_screen.dart';
import 'package:myapp/screens/cart_detail.dart';
import 'package:myapp/screens/home/home_screen.dart';
import 'package:myapp/screens/login/forgotpassword.dart';
import 'package:myapp/screens/login/login_screen.dart';
import 'package:myapp/screens/orders/orders_screen.dart';
import 'package:myapp/screens/product/product_list_screen.dart';
import 'package:myapp/screens/signup/signup_screen.dart';
import 'package:myapp/screens/splash/splash_screen.dart';
import 'package:myapp/screens/user_profile/user_profile_screen.dart';
import 'package:myapp/screens/widgets/product_cart.dart';
import 'package:myapp/theme.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'model/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'myapp',
            channelName: 'myap',
            channelDescription: "TrendyFits Notification",
            defaultColor: const Color(0xFF105F49),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            enableVibration: true)
      ]);

  final database =
      await $FloorAppDatabase.databaseBuilder('trendy_fits_cart').build();
  final dao = database.cartDAO;

  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dao}) : super(key: key);
  final CartDAO dao;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trendy",
      // theme: theme(),
      theme: ThemeData(
        backgroundColor: bgcolor,
        primaryColor: primaycol,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: accentcol),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ForgotPassword.routename: (context) => const ForgotPassword(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        ProductList.routeName: (context) => ProductList(dao: dao),
        CartScreen.routeName: (context) => CartScreen(dao: dao),
        AddProductScreen.routeName: (context) => const AddProductScreen(),
        OrdersScreen.routeName: (context) => const OrdersScreen(),
        UserProfileScreen.routeName: (context) => const UserProfileScreen(),
      },
    );
  }
}
