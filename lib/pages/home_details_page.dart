import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}"
                .text
                .bold
                .xl4
                .color(Vx.hexToColor("#F44336"))
                .make(),
            ElevatedButton(
              onPressed: () {},
              child: "Buy".text.xl.make(),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ).wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Hero(
                      tag: Key(catalog.desc.toString()),
                      child: Column(
                        children: [
                          catalog.name.text.xl4.bold.make(),
                          catalog.desc.text.xl.gray400.make(),
                          10.heightBox,
                          Expanded(
                            child:
                                "Diam takimata ipsum tempor amet vero clita ipsum et, elitr no ipsum sed amet et elitr duo nonumy, aliquyam diam magna ea labore labore diam est gubergren et. Invidunt rebum dolor et no dolor et erat amet. Et dolor no dolores rebum sed nonumy dolores. Sed diam diam kasd diam"
                                    .text
                                    .xl
                                    .gray400
                                    .make()
                                    .p16(),
                          ),
                        ],
                      ).py64(),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
