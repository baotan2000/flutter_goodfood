import 'package:flutter/material.dart';
import 'package:flutter_goodfood/config/const.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage
({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height:20);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: Colors.amber,
            ),
          width: double.infinity,
          height: 200,
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: dColorFooterImage,
              title: Center(child: Text("ECHO MEDI", style:styleTittleItem)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite,size:sizeIconButton),
                  SizedBox(width:5),
                  Text("123",style:styleTittleIcon),
                  SizedBox(width:10),
                  Icon(Icons.remove_red_eye,size:sizeIconButton),
                  SizedBox(width:5),
                  Text("123",style:styleTittleIcon),
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://images.unsplash.com/photo-1682686580849-3e7f67df4015?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
              fit: BoxFit.cover,
              ),
          )
            ),
        );
      },
    );
  }
}