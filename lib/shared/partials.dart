import 'package:flutter/material.dart';
import '../shared/Product.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';

Widget foodItem(Product food,
    {double imgWidth, onLike, onTapped, bool isProductPage = false}) {

  return Container(
    width: 180,
    height: 180,
    // color: Colors.red,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
        Container(
            width: 180,
            height: 180,
            child: RaisedButton(
                color: white,
                elevation: (isProductPage) ? 20 : 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: onTapped,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: food.name,
                    child: Image.asset(food.image,
                        width: (imgWidth != null) ? imgWidth : 110)))),

        Positioned(
          bottom: 20,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food.name, style: foodNameText),
                    Row(
                        children: <Widget>[
                    Text(food.price, style: oldpriceText),
                    Text(food.price, style:newpriceText)
                        ]
                    )
                  ],
                )
              : Text(' '),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: (food.discount != null)
                ? Container(
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(food.discount.toString() + '%',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white, fontWeight: FontWeight.w700)),
                  )
                : SizedBox(width: 0)),
        Positioned(
            top: 145,
            right: 10,
            child: (food.discount != null)
                ? Container(
              padding:
              EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Colors.red,
                      size: 10,
                    ),
                    Text('12:50'+' h' ,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white, fontWeight: FontWeight.w500)),
                  ]
              )
              ,)
                : SizedBox(width: 0)),

      ],
    ),
  );
}
