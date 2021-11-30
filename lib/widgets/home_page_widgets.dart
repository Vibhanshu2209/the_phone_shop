import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_phone_shop/constants/colors.dart';
import 'package:the_phone_shop/constants/model.dart';
import 'package:velocity_x/velocity_x.dart';

class GridCard extends StatelessWidget {
  const GridCard({Key? key, required this.item}) : super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Hero(
              tag: Key(item.id.toString() + "name"),
              child: item.name.text
                  .softWrap(false)
                  .headline6(context)
                  .bold
                  .make()),
          Hero(
              tag: Key(item.id.toString() + "manu"),
              child: item.manufacture.text.subtitle1(context).make()),
          Hero(
                  tag: Key(item.id.toString() + "image"),
                  child: Image.network(item.url).p4())
              .expand(),
          Hero(
              tag: Key(item.id.toString() + "price"),
              child: "\$${item.price}".text.headline5(context).extraBold.make())
        ],
      ).p16(),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 80, maxHeight: 80),
              child: Hero(
                  tag: Key(item.id.toString() + "image"),
                  child: Image.network(item.url).p4())),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: Key(item.id.toString() + "name"),
                  child: item.name.text.headline6(context).bold.make().p4()),
              Hero(
                  tag: Key(item.id.toString() + "manu"),
                  child: item.manufacture.text.subtitle1(context).make().p4()),
            ],
          ).p12().expand(),
          Hero(
              tag: Key(item.id.toString() + "price"),
              child: "\$${item.price}".text.headline5(context).extraBold.make())
        ],
      ).p12(),
    );
  }
}
