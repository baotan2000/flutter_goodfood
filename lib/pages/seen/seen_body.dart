import 'package:flutter/material.dart';
import 'package:flutter_goodfood/config/const.dart';

class SeenBody extends StatefulWidget {
  const SeenBody({super.key});

  @override
  State<SeenBody> createState() => _SeenBodyState();
}

class _SeenBodyState extends State<SeenBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey<int>(index),
          // onDismissed: (DismissDirection direction) {
          //   setState(() {
          //     items.removeAt(index);
          //   });
          // },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 140,
              child: GridTile(
                  footer: GridTileBar(
                    trailing: Icon(
                      Icons.swipe,
                      color: dColorIconButtonNotActive,
                      size: sizeIconButton,
                    ),
                    backgroundColor: Colors.white70,
                    title: Text(
                      "Est nobis at qui",
                      style: styleTittleItem,
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1683610960469-948a0c541f86?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"),
                      ),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
