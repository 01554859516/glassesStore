// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/common/appbar.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/common/custom_button.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/provider/cart.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              (new Color(0xffDC54FE)),
              new Color(0xff8A02AE),
            ]),
          ),
        ),
        title: Text("Checkout"),
        actions: [
          ProductAndPrice(),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: carttt.selectedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(carttt.selectedProducts[index].name),
                        subtitle: Text(
                            "${carttt.selectedProducts[index].price} - ${carttt.selectedProducts[index].location}"),
                        leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                carttt.selectedProducts[index].imgPath)),
                        trailing: IconButton(
                          onPressed: () {
                            carttt.delete(carttt.selectedProducts[index]);
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          CustomBotton(
            text: "pay \$${carttt.price} ",
            width: 150,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
