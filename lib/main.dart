// import 'package:flutter/material.dart';
// import 'home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       home: const MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    TextStyle kTextStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: Colors.white);
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        backgroundColor: const Color(0XFF000F1D),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Internet Connectivity Checker"),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 100,
            margin: const EdgeInsets.all(20),
            child: ConnectivityBuilder(
              interval: const Duration(seconds: 5),
              builder: (ConnectivityStatus status) {
                if (status == ConnectivityStatus.online) {
                  return Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Column(
                      children: [
                        Text("Online", style: kTextStyle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.public, size: 30),
                        )
                        // Text(time as String),
                      ],
                    )),
                  );
                } else if (status == ConnectivityStatus.offline) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // trigger file write method here like ( read the json file update the file sync with the new value  )
                    // void writeToJson()
                    child: Center(
                        child: Column(
                      children: [
                        Text("Offline", style: kTextStyle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.public_off),
                        )
                        // Text(time as String),
                      ],
                    )),
                  );
                } else if (status == ConnectivityStatus.checking) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 166, 207, 226),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text("No Network", style: kTextStyle)),
                  );
                } else {
                  // status == ConnectivityStatus.checking
                  return const Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
