import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/order/orderList.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      appBar: CustomAppBar(showBackArrow: true,title: Text('My Order'),),
      body:SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Orderlist(),
          ],
        ),),
      ) ,
    );
  }
}