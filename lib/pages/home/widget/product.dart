import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter/services.dart';
import 'package:flutter_goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  static final routeName = '/product';
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool change = true;
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var product =
        Provider.of<ProductProvider>(context).getItemsWithId(arg['id']);
    product.toggleIsSeen();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                product.toggleIsFavorite();
                                setState(() {
                                  change = !change;
                                });
                              },
                              child: Icon(Icons.favorite,
                                  size: sizeIconButton,
                                  color: product.isFavorite
                                      ? Colors.red
                                      : dColorIconButtonNotActive),
                            ),
                            SizedBox(width: 5),
                            Text(
                              product.favorite,
                              style: styleTittleIcon,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              size: sizeIconButton,
                              color: dColorIconButtonNotActive,
                            ),
                            SizedBox(width: 5),
                            Text(product.view, style: styleTittleIcon),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/background/background_product.png'),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(product.title),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Center(
                              child:
                                  Text("Nguyên liệu", style: styleTittleItem)),
                          width: 167,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              textAlign: TextAlign.justify,
                              product.ingredients),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Center(
                              child: Text("Cách thực hiện",
                                  style: styleTittleItem)),
                          width: 167,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              textAlign: TextAlign.justify,
                              product.instructions),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
