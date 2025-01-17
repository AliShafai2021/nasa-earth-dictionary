import 'package:flutter/material.dart';
import 'package:nasa/screens/view_image/image.dart';

MaterialPageRoute findMeaning(
    String text, List list, Map map, BuildContext context) {
  bool check(String text) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == text) return true;
    }
    return false;
  }

  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(title: const Text("Meaning")),
      body: check(text)
          ? Center(
              child: Card(
                //color: Color(0xFFEAE3F5),
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 50)
                    .copyWith(top: 10),
                elevation: 10,
                shadowColor: Colors.black.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      text,
                      style: const TextStyle(fontSize: 50.0),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 500.0,
                      width: 500.0,
                      child:Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                            child: Text(map[text],style: const TextStyle(fontSize: 20),),
                            onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ViewPhoto(
                                  text: text)))
                        ),
                      )
                      ),


                  ],
                ),
              ),
            )
          : const Center(
              child: Text(
                "Not Found\nTry another Word",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
    ),
  );
}
