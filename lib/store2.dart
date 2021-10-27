import 'package:flutter/material.dart';
import 'package:layout/Product.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StoreApp2 extends StatelessWidget {
  const StoreApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Store(),
    );
  }
}

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  var fkey = GlobalKey<FormState>();
  var txtcount = TextEditingController();
  late Future<List<Product>> lsProduct;
  @override
  void initState() {
    super.initState();
    lsProduct = Product.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.store),
        title: Text("Products Store"),
      ),
      body: FutureBuilder(
        future: lsProduct,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return CarouselSlider(
                  items: data!.map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Stack(
                      children: [
                              Image.network(e.image),
                      ],
                    ),
                  )).toList(), 
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  )
                );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
