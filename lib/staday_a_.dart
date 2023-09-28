import 'package:flutter/material.dart';

class staday extends StatefulWidget {
  const staday({super.key});

  @override
  State<staday> createState() => _stadayState();
}

class _stadayState extends State<staday> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "SDM GROUP OF INSTITUTIONS",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            // Image.asset(
            //   "assets/images/insta.png",
            //   height: 50,
            // ),

            SizedBox(
              height: 200,
              width: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, index) {
                    return (Container(
                      color: Colors.amber,
                      height: 100,
                      width: 100,
                      child: Center(child: Text("p")),
                    ));
                  }),
            )
          ]),
    );
  }
}
