import 'package:flutter/material.dart';
import 'package:the_phone_shop/constants/cart.dart';
import 'package:the_phone_shop/constants/theme.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "My Cart".text.make()),
      body: Column(
        children: [
          cartList(context).p16().expand(),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Total".text.headline4(context).make(),
                  "\$${cartModel.cartTotal}".text.headline5(context).make()
                ],
              ).py16(),
              "Buy"
                  .text
                  .headline6(context)
                  .makeCentered()
                  .box
                  .color(context.theme.primaryColor.withOpacity(0.3))
                  .roundedSM
                  .p12
                  .make()
                  .onTap(() {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: MyFullTheme.kPrimary,
                    content: "Buying Not Supported Yet".text.make()));
              }),
            ],
          ).p16(),
        ],
      ),
    );
  }

  Widget cartList(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cartModel.items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                const Icon(Icons.done),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cartModel.items[index].name.text.headline6(context).make(),
                    cartModel.items[index].price.text.headline5(context).make()
                  ],
                ).px16().expand(),
                const Icon(Icons.remove_circle_outline).onTap(() {
                  cartModel.remove(cartModel.items[index]);
                  setState(() {});
                })
              ],
            ).p16(),
          );
        });
  }
}
