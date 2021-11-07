import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        children: [
          Expanded(child: _CartList().p32()),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, dynamic, vxStatus) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.highlightColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying is not supported yet".text.make(),
                    ));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          context.theme.primaryColorLight)),
                  child: "Buy".text.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/empty_cart.png",
              ),
              SizedBox(
                height: 20,
              ),
              "There is nothing in your cart!".text.xl2.white.make(),
            ],
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  Icons.done,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: IconButton(
                    onPressed: () => RemoveMutation(_cart.items[index]),
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Theme.of(context).primaryColor,
                    )),
                // ignore: unrelated_type_equality_checks
                title: Text(
                  _cart.items[index].name.toString(),
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                )));
  }
}
