// Created By Jose Ignacio Lara Arandia 2019/09/25/time:22:38

import 'package:flutter/material.dart';
import 'package:hundred_days_of_sweat/features/auth/state/auth_provider.dart';
import 'package:provider/provider.dart';
import 'core/style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Container(
          margin: EdgeInsets.only(top: 12.00),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (_, i) {
              return EventWidget();
            },
          ),
        ));
  }
}

class EventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Center(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8.00),
              height: h / 3,
              width: w - 48,
              decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.color,
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30)),

                  image: DecorationImage(
                      image: NetworkImage(
                          "https://imageresizer.static9.net.au/ppllaSrEZT0nCiTcBq7fDyxPQNI=/0x0/https%3A%2F%2Fprod.static9.net.au%2Ffs%2F8fca15d3-bf2c-45ac-8d48-dea212c1af54"),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 36,
            right: 36,
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                  Text(
                    "Live",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 36,
            left: 36,
            child: Container(
              padding: EdgeInsets.all(8.00),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Match of the evening!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Positioned(bottom: 20, left: 36,
              child: Container(
                width: w/2-50,
                height: w/3,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 10,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://www.freepnglogos.com/uploads/cricket-logo-png/moritz-cricket-10.png")
                          )
                        ) ,
                      ),
                    ),

                    Positioned(
                      right: 10,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://www.freepnglogos.com/uploads/cricket-logo-png/moritz-cricket-10.png")
                            )
                        ) ,
                      ),
                    )
                  ],
          ),
              ))
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Events",
              style: TextStyles.appBarTitle,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.vox-cdn.com/thumbor/ezPg-mfNEaylsrF18ZjEAfWwt9A=/0x0:1280x720/1200x800/filters:focal(502x237:706x441)/cdn.vox-cdn.com/uploads/chorus_image/image/63711865/CHORUS-Recode-Media-Gary-Vaynerchuk-01.0.jpg"),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(50);
}
