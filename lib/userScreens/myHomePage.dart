import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:letsgo/tools/app_data.dart';
import 'package:letsgo/tools/app_methods.dart';
import 'package:letsgo/tools/app_tools.dart';
import 'package:letsgo/tools/firebase_methods.dart';
import 'package:letsgo/userScreens/add_products.dart';
import 'favourite.dart';
import 'messages.dart';
import 'cart.dart';
import 'notifications.dart';
import 'history.dart';
import 'profile.dart';
import 'delivery.dart';
import 'about_us.dart';
import 'login.dart';
import 'package:letsgo/tools/Store.dart';
import 'itemDetails.dart';
import 'add_products.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  String accName = "";
  String accEmail="";
  String accPhotoURL ="";
  bool isLoggedIn;
  AppMethods appMethod= new FirebaseMethods();
  @override
  void initState() {
    // TODO: implement initState
    ClearDataLocally();
    getCurrentUser();
    super.initState();
  }


  Future getCurrentUser() async{

    accName =  await getStringDataLocally(key: UserFullName);
    accEmail = await getStringDataLocally(key: emailAddress);
    accPhotoURL = await getStringDataLocally(key:photoUrl);
    isLoggedIn =  await getBoolDataLocally(key:loggedIN);

    accName== null? accName= "Guest User": accName;
    accEmail == null? accEmail="guestuser@email.com": accEmail;
    print(accEmail);
    print(isLoggedIn);
    print(accName);
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    this.context = context;

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("DietList"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new Favourite();
                 }));
              }),
          new Stack(
            children: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        new CupertinoPageRoute(builder: (BuildContext context) {
                      return new Messages();
                    }));
                  }),
              new CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
                child: new Text("0", style: new TextStyle(color: Colors.white)),
              )
            ],
          )

//          new IconButton(icon: new Icon(Icons.chat, color: Colors.white,), onPressed: null)
        ],
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Flexible(
                child: new GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: storeItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:(){ Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context)=> new ItemDetails(
                        itemImage: storeItems[index].itemImage,
                        itemName: storeItems[index].itemName,
                        itemPrice: storeItems[index].itemPrice,
                        itemRating: storeItems[index].itemRating,
                      )));
                  },
                  child:new Card(
                  child:  Stack(
                    alignment: FractionalOffset.topLeft,
                    children: <Widget>[
                      new Stack(
                        alignment: FractionalOffset.bottomCenter,
                        children: <Widget>[

                          new Container(
                              child: Image.network(storeItems[index].itemImage),
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                      image: new NetworkImage(
                                          storeItems[index].itemImage)))),
                          new Container(
                            height: 35.0,
                            color: Colors.black.withAlpha(100),
                            child: new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Text(
                                    "${storeItems[index].itemName.substring(0, 8)}",
                                    style: new TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  new Text(
                                    "NP ${storeItems[index].itemPrice}",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            height: 30.0,
                            width: 60.0,
                            decoration: new BoxDecoration(
                              color: Colors.black,
                              borderRadius: new BorderRadius.only(
                                topRight: new Radius.circular(5.0),
                                bottomRight: new Radius.circular(5.0)
                              )
                            ),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Icon(Icons.star, color: Colors.blue,size: 20.0,),
                                new Text("${storeItems[index].itemRating}",
                                style: new TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          new IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,), onPressed: null)
                        ],
                      )
                    ],
                  ),

                ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new CupertinoPageRoute(builder: (BuildContext context){
                return new Cart();
              }));
            },
            child: new Icon(Icons.shopping_cart),
          ),
          new CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: new Text("0",
                style: new TextStyle(color: Colors.white, fontSize: 12.0)),
          )
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(accName),
              accountEmail: new Text(accEmail),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Icon(Icons.person),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Icon(Icons.notifications)),
              title: new Text("Order Notifications"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new Notifications();
                }));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Icon(Icons.history)),
              title: new Text("Order History"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new OrderHistory();
                }));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Icon(Icons.history)),
              title: new Text("Sell your Products"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                      return new AddProducts();
                    }));
              },
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                  backgroundColor: Colors.green, child: new Icon(Icons.person)),
              title: new Text("Profile Settings"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new ProfileSettings();
                }));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                  backgroundColor: Colors.green, child: new Icon(Icons.home)),
              title: new Text("Delivery Address"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new DeliverAddress();
                }));
              },
            ),
            new Divider(),
            new ListTile(
              trailing: new CircleAvatar(
                  backgroundColor: Colors.green, child: new Icon(Icons.help)),
              title: new Text("About us"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new AboutUs();
                }));
              },
            ),
            new ListTile(
              trailing: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Icon(Icons.exit_to_app)),
              title: new Text(isLoggedIn== true? "LogOut":"Login"),
              onTap: checkLoggedIn,
            )
          ],
        ),
      ),
    );
  }

  checkLoggedIn() async{
    if(isLoggedIn != true){
     bool response = await Navigator.of(context).push(
          new CupertinoPageRoute(builder: (BuildContext context) => Login()));
     if(response == true) getCurrentUser();
      return;
    }
    bool response = await appMethod.loggedOut();
    if(response== true)
      getCurrentUser();

  }
}
