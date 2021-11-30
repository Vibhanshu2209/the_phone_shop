import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_phone_shop/constants/cart.dart';
import 'package:the_phone_shop/constants/colors.dart';
import 'package:the_phone_shop/constants/model.dart';
import 'package:the_phone_shop/constants/theme.dart';
import 'package:the_phone_shop/pages/cart_page.dart';
import 'package:the_phone_shop/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  onitempressed(Item item) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => ProductDetails(item: item)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "Tech.kart".text.headline6(context).make(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: Key(widget.item.id.toString() + "image"),
              child: Image.network(widget.item.url)
                  .h40(context)
                  .centered()
                  .expand(flex: 2),
            ),
            VxArc(
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                height: 20.1,
                child: Container(
                  margin: Vx.mH16,
                  width: double.infinity,
                  padding: Vx.m32,
                  color: Theme.of(context).canvasColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Hero(
                          tag: Key(widget.item.id.toString() + "name"),
                          child:
                              widget.item.name.text.headline4(context).make()),
                      Hero(
                          tag: Key(widget.item.id.toString() + "manu"),
                          child: widget.item.manufacture.text
                              .headline6(context)
                              .make()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Hero(
                            tag: Key(widget.item.id.toString() + "price"),
                            child: "\$${widget.item.price}"
                                .text
                                .headline5(context)
                                .make(),
                          ),
                          CartButton(itemToBeAdded: widget.item),
                        ],
                      ).py16(),
                      "Similar"
                          .text
                          .headline6(context)
                          .make()
                          .opacity75()
                          .p12()
                          .objectCenterLeft(),
                      GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: 3,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 1),
                        itemBuilder: (context, _) {
                          final int r =
                              Random().nextInt(CatalogModel.products.length);
                          final Item item = CatalogModel.products[r];
                          return Card(
                            color:
                                context.theme.selectedRowColor.withOpacity(0.3),
                            child: Image.network(item.url)
                                .p8()
                                .onTap(() => onitempressed(item)),
                          );
                        },
                      ).expand()
                    ],
                  ),
                )).expand(flex: 3),
          ],
        ));
  }
}

class CartButton extends StatefulWidget {
  final Item itemToBeAdded;
  const CartButton({Key? key, required this.itemToBeAdded}) : super(key: key);

  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  final _catalogModel = CatalogModel();
  final _cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isAddedtoCart =
        _cartModel.items.contains(widget.itemToBeAdded) ? true : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            child: Text(isAddedtoCart ? "Remove" : "Add to Cart")
                .text
                .buttonText(context)
                .makeCentered()
                .box
                .color(context.theme.indicatorColor)
                .leftRounded()
                .p12
                .make(),
            onTap: () {
              _cartModel.setCatalog = _catalogModel;
              if (isAddedtoCart) {
                _cartModel.remove(widget.itemToBeAdded);
              } else {
                _cartModel.add(widget.itemToBeAdded);
              }
              setState(() {});
            }),
        "Buy"
            .text
            .headline6(context)
            .makeCentered()
            .box
            .color(context.theme.primaryColor.withOpacity(0.3))
            .rightRounded()
            .p12
            .make()
            .onTap(() {
          _cartModel.setCatalog = _catalogModel;
          if (!isAddedtoCart) {
            _cartModel.add(widget.itemToBeAdded);
          }
          Navigator.pushReplacementNamed(context, MyRoutes.cartRoute);
        })
      ],
    );
  }
}
