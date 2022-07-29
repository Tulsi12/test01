
import 'package:flutter/material.dart';
import 'package:myapp/components/appbar.dart';
import 'package:myapp/components/bottom_nav.dart';
import 'package:myapp/http/httporder.dart';
import 'package:myapp/model/order.dart';
import 'package:myapp/pallate.dart';
import 'package:myapp/screens/orders/components/body.dart';



class OrdersScreen extends StatefulWidget {
  const OrdersScreen({ Key? key }) : super(key: key);
  static String routeName= '/myorders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
    List<Order> orders = List<Order>.empty(growable: true);

  late Future<List<Order>> futureOrder;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    futureOrder = HttpConnectOrder().getOrders();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,"Orders History"),
      body: Body(),
      bottomNavigationBar: BottomNav(),
    );
  
  }
}