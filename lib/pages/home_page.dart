import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_phone_shop/constants/model.dart';
import 'package:the_phone_shop/constants/theme.dart';
import 'package:the_phone_shop/pages/product_details.dart';
import 'package:the_phone_shop/routes.dart';
import 'package:the_phone_shop/widgets/home_page_widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class CatalogItemView extends StatefulWidget {
  const CatalogItemView({Key? key}) : super(key: key);

  @override
  State<CatalogItemView> createState() => _CatalogItemViewState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    //var json = await rootBundle.loadString("assets/files/catalog.json");
    var json = await http
        .read(Uri.parse("https://api.jsonbin.io/b/61a4cbce62ed886f9156b197"));
    var decodeData = jsonDecode(json);
    CatalogModel.products = List.from(decodeData["products"])
        .map<Item>((e) => Item.fromMap(e))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
            isExtended: false,
            icon: const Icon(Icons.shopping_cart_rounded),
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            label: "Buy Now".text.headline5(context).make()),
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Column(
            children: [
              const CatalogHeader().h15(context),
              if (CatalogModel.products.isNotEmpty)
                const CatalogItemView().expand()
              else
                const CircularProgressIndicator().centered().expand()
            ],
          ),
        ));
  }
}

class _CatalogItemViewState extends State<CatalogItemView> {
  bool isListView = true;
  switchView() {
    setState(() {
      isListView = !isListView;
    });
  }

  onitempressed(Item item) {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => ProductDetails(item: item)));
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (_, __, ___) => ProductDetails(item: item)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "Recommended".text.subtitle1(context).make(),
          IconButton(
              onPressed: switchView,
              icon: Icon(isListView
                  ? Icons.grid_goldenratio_rounded
                  : Icons.list_rounded)),
        ],
      ),
      isListView
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: CatalogModel.products.length,
              itemBuilder: (context, index) =>
                  ListCard(item: CatalogModel.products[index])
                      .onTap(() => onitempressed(CatalogModel.products[index])),
            ).expand()
          : GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: CatalogModel.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 4,
                  childAspectRatio: 0.6,
                  crossAxisCount: 2),
              itemBuilder: (context, index) =>
                  GridCard(item: CatalogModel.products[index])
                      .onTap(() => onitempressed(CatalogModel.products[index])),
            ).expand(),
    ]).p16();
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MyFullTheme.kPaddingSmall(),
      child: Column(
        children: [
          "Tech.kart".text.headline3(context).bold.makeCentered(),
          "Trending Products".text.headline6(context).makeCentered().expand()
        ],
      ),
    );
  }
}
