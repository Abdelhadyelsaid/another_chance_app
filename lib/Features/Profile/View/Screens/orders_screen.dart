import 'package:another_chance/Features/Orders/cubit/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/header_text_widget.dart';
import '../Widgets/order_card_widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrdersCubit()..getOrders(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: .04.sw),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SafeArea(
                  child: HeaderTextWidget(
                    title: "My Orders",
                  ),
                ),
                SizedBox(height: 16.h),
                BlocBuilder<OrdersCubit, OrdersState>(
                  builder: (context, state) {
                    var cubit = OrdersCubit.get(context);
                    return ListView.builder(
                      itemCount: cubit.orders.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: OrderCard(
                            orders: cubit.orders[index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
