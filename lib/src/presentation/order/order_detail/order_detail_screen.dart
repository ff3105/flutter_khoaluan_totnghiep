import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/configs.dart';
import '../../../utils/utils.dart';
import '../../../resources/resources.dart';
import '../../presentation.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderDatum order;

  const OrderDetailScreen({Key key, @required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: const WidgetAppBar(
        title: 'Order Details',
      ),
      body: SafeArea(
        child: BaseWidget<OrderDetailViewModel>(
          viewModel: OrderDetailViewModel(repository: OrderRepository()),
          onViewModelReady: (vm) {
            vm.init();
          },
          builder: (context, vm, widget) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _body(context, vm);
            }
          },
        ),
      ),
    );
  }

  Widget _body(BuildContext context, OrderDetailViewModel vm) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              _header(order.status),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  'Delivery Address',
                  style: theme.textTheme.bodyText2,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(order.address.name),
                        const SizedBox(width: 4),
                        Text(order.address.phone),
                      ],
                    ),
                    Text(
                      '${order.address.address}, '
                      '${order.address.ward}, '
                      '${order.address.district}, '
                      '${order.address.city}',
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              ListView.builder(
                padding: AppStyles.paddingBody,
                shrinkWrap: true,
                itemCount: order.orderDetail.length,
                itemBuilder: (context, index) {
                  final item = order.orderDetail[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: AppStyles.radiusNormal,
                                child: item.product.images.isEmpty
                                    ? Image.asset(
                                        'assets/images/placeholder.jpg')
                                    : Image.network(
                                        AppEndpoint.domain +
                                            item.product.images.first.image,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.product.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Formats.money(item.product.price),
                                    style: const TextStyle(
                                        color: AppColors.dark45),
                                  ),
                                  Text(
                                    'x${item.quantity}',
                                    style: const TextStyle(
                                        color: AppColors.dark45),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Divider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order No. ${order.id}',
                      /* style: const TextStyle(fontSize: 16),*/
                      style: theme.textTheme.bodyText2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Placed on ${Formats.dateTime(order.createdAt)}',
                      style: const TextStyle(color: AppColors.dark45),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal ()',
                          style: theme.textTheme.bodyText2,
                        ),
                        Text(
                          Formats.money(order.total),
                          style: theme.textTheme.bodyText2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Fee',
                          style: theme.textTheme.bodyText2,
                        ),
                        Text(
                          Formats.money(0),
                          style: theme.textTheme.bodyText2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total (VAT Incl.)',
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          Formats.money(order.total),
                          style: theme.textTheme.bodyText2.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        ),
        if (vm.isCanCancel(order))
          WidgetButton(
            onTap: () => vm.cancelOrder(order.id),
            text: 'Cancel',
            color: Colors.red,
          )
        else
          const SizedBox()
      ],
    );
  }

  Widget _header(OrderStatus status) {
    var text;
    switch (status) {
      case OrderStatus.pending:
        text = 'Pending';
        break;
      case OrderStatus.completed:
        text = 'Completed';
        break;
      case OrderStatus.cancelled:
        text = 'Cancelled';
        break;
      case OrderStatus.shipping:
        text = 'Shipping';
        break;
    }

    return Container(
      height: 80,
      width: double.infinity,
      color: statusColor(status),
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
