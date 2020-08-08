import 'package:flutter/material.dart';
import 'package:product_card/provider_product_card.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderProductCard>(
      create: (context) {
        return ProviderProductCard();
      },
      child: Stack(
        children: <Widget>[
          // notifikasi
          Consumer<ProviderProductCard>(
            builder: (context, provProdCard, child) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 150,
                margin: EdgeInsets.only(left: 50, top: 20),
                height: (provProdCard.getNotif()) ? 373 : 350,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Notifikasi",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 200,
            height: 350,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 4),
                borderRadius: BorderRadius.circular(16),
                color: Colors.white),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg",
                      )),
                  Text("buah"),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.red[400], width: 3)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Material(
                                color: Colors.transparent,
                                child: Consumer<ProviderProductCard>(
                                  builder: (context, provProdCard, child) {
                                    return InkWell(
                                      onTap: () {
                                        provProdCard.incTotalVegetable();
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              height: 30,
                              width: 30,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 112,
                              child: Consumer<ProviderProductCard>(
                                builder: (context, provProdCard, child) {
                                  return Center(
                                      child: Text(
                                    provProdCard.getTotalVeg().toString(),
                                    style: TextStyle(fontSize: 20),
                                  ));
                                },
                              ),
                            ),
                            Container(
                              child: Material(
                                color: Colors.transparent,
                                child: Consumer<ProviderProductCard>(
                                  builder: (context, provProdCard, child) {
                                    return InkWell(
                                      onTap: () {
                                        provProdCard.decTotalVegetable();
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              height: 30,
                              width: 30,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 50,
                        margin: EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          child: RaisedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                            color: Colors.red[400],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
