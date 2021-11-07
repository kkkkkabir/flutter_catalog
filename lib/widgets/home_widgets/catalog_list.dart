import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final catalog = CatalogModel.items[index];
                    return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeDetailsPage(catalog: catalog))),
                        child: CatalogItem(catalog: catalog));
                  },
                  itemCount: CatalogModel.items.length,
                ),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final catalog = CatalogModel.items[index];
                    return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeDetailsPage(catalog: catalog))),
                        child: CatalogItem(catalog: catalog));
                  },
                  itemCount: CatalogModel.items.length,
                ),
              ),
            ],
          );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  catalog.name.toString(),
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                Text(
                  catalog.desc.toString(),
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
                10.heightBox,
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}"
                    .text
                    .bold
                    .xl
                    .color(context.theme.highlightColor)
                    .make(),
                AddtoCart(
                  catalog: catalog,
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}
