import 'package:flutter/material.dart';
import 'package:web_view/pages/web.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Web View",
      routes: {
        "/": (context) => const WebPage(),
        "web": (context) => const WebLoad(),
      },
    ),
  );
}

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  Map m1 = <String, String>{
    "images/netflix.png": "https://miminogames.com/",
    "images/disney+.png": "https://poki.com/",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Web View Test"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: m1.entries
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("web", arguments: e);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 30),
                      height: 150,
                      width: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(e.key),
                          ),
                          color: Colors.pink.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
