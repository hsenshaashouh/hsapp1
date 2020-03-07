import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hsapp/shared/partial.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/hsapp_icons.dart';
import './ProductPage.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';
import 'ViewAllPage.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      Text('Tab3'),
      Text('Tab4'),
      Text('Tab5'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Hsapp.magnifier),
          ),
          backgroundColor: primaryColor,
          title:
              Text('HSAPP', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Hsapp.mail),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Hsapp.alarm),
            )
          ],
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Hsapp.shop),
                title: Text(
                  'Main',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Hsapp.heart),
                title: Text(
                  'Favorites',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Hsapp.plus_circle),
                title: Text(
                  'ADD',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Hsapp.money),
                title: Text(
                  'Balance',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Hsapp.cog_1),
                title: Text(
                  'Setting',
                  style: tabLinkStyle,
                ))
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: primaryColor,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeTab(BuildContext context) {
  // will pick it up from here
  // am to start another template
  List<Product> foods = [
    Product(
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Pasta",
        image: "images/5.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Akara",
      image: 'images/2.png',
      price: '\$10.99',
      userLiked: false,
      discount: 20),
    Product(
        name: "Strawberry",
        image: "images/1.png",
        price: '\$50.00',
        userLiked: true,
        discount: 14)
  ];

  List<Product> ads = [
    Product(
        name: "Grand-resto",
        image: "images/6.png",
        price: '2.3',
        userLiked: true,
        discount: 30),
    Product(
        name: "Car rental",
        image: "images/7.png",
        price: '10.3',
        userLiked: false,
        discount: 60),
    Product(
        name: "Wafer shop",
        image: "images/8.png",
        price: '7.6',
        userLiked: false,
        discount: 25),
    Product(
        name: "Massager",
        image: "images/9.png",
        price: '5.5',
        userLiked: true,
        discount: 50)
  ];

  return ListView(children: <Widget>[

  CarouselSlider.builder(
    itemCount: 3,
    aspectRatio: 16/9,
    viewportFraction: 0.6,
    enableInfiniteScroll: true,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 1000),
    pauseAutoPlayOnTouch: Duration(seconds: 10),
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int itemIndex) =>
        Container(
          child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(ads[itemIndex].image),
                ),
        )
  ),

    headerTopCategories(context),
    deals('Hot Deals', onViewMore: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {return new ViewAllPage();},),);
    }, items: <Widget>[
      foodItem(foods[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[0],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(foods[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[1],
              );
            },
          ),
        );
      }, imgWidth: 250, onLike: () {

      }),
      foodItem(foods[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[2],
              );
            },
          ),
        );
      }, imgWidth: 200, onLike: () {

      }),
      foodItem(foods[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[3],
              );
            },
          ),
        );
      }, onLike: () {

      }),
    ]),
  deals('Trending', onViewMore: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) {return new ViewAllPage();},),);
  },
      items: <Widget>[
        placeItem(ads[0], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: ads[0],
                );
              },
            ),
          );
        }, onLike: () {}, imgWidth: 150),
        placeItem(ads[1], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: ads[1],
                );
              },
            ),
          );
        }, onLike: () {}, imgWidth: 150),
        placeItem(ads[2], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: ads[2],
                );
              },
            ),
          );
        }, imgWidth: 150, onLike: () {}),
        placeItem(ads[3], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: ads[3],
                );
              },
            ),
          );
        }, onLike: () {},imgWidth: 150),
      ]),
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('All Categories', onViewMore: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {return new ViewAllPage();},),);
      }),
      SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Restaurant', Hsapp.dinner, onPressed: () {}),
            headerCategoryItem('Shop ', Hsapp.store, onPressed: () {}),
            headerCategoryItem('Fashion', Hsapp.diamond_1, onPressed: () {}),
            headerCategoryItem('Hotel', Hsapp.home, onPressed: () {}),
            headerCategoryItem('Cars', Hsapp.car, onPressed: () {}),
            headerCategoryItem('Doctor Clinic', Hsapp.heart_pulse, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 70,
            height: 70,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 40, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
