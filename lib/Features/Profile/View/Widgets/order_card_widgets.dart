import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../routing/routes.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orders});

  final Map<String, dynamic> orders;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.ordersDetailsScreen.name,
            extra: {"orderDetails": orders});
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Order Number: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: orders['orderId'].toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            DateFormat('yyyy-MM-dd')
                                .format(DateTime.parse(orders['createdAt'])),
                            style: const TextStyle(fontSize: 15)),
                        Text(
                          '${orders['totalPrice'].toString()} EGP',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F288),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${orders['orderStatus']}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Right Section (Image Grid)
              const SizedBox(width: 12),
              SizedBox(
                height: 80,
                width: 80,
                child: Stack(
                  children: [
                    Image.network(
                      orders['products'][0]["image"],
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 4,
                      bottom: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '+${orders['products'].length.toString()}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
