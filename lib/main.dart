import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fleet Management'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseReference _dbref;
  String databasejson = '';
  String? status;

  double? longitude;
  double? latitude;

  _realdb_once() {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('Adxl345/');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      setState(() {
        databasejson = data.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: _dbref.onValue,
              builder: (context, AsyncSnapshot snap) {
                if (snap.hasData &&
                    !snap.hasError &&
                    snap.data.snapshot.value != null) {
                  Map data = snap.data.snapshot.value;
                  List item = [];
                  data.forEach(
                      (index, data) => item.add({"key": index, ...data}));

                  return Expanded(
                    child: ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        var speed = item[index]['x'];
                        var fallIndicator = item[index]['z'];
                        var temp = item[index]['temperature'];
                        var time = item[index]['time'];
                        var hum = item[index]['humidity'];

                        // if (temp > 20) {
                        //   status = 'Vechicles accident Detected';
                        //   var random = Random(20);
                        //   int randomInt = random.nextInt(100);
                        //   double randTemp = random.nextDouble() * randomInt;
                        //   longitude = randTemp;
                        //   latitude = randTemp;
                        // } else {
                        //   status = 'Vechicles Safe';
                        //   longitude = null;
                        //   latitude = null;
                        // }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.blue,
                            shadowColor: Colors.black,
                            elevation: 10,
                            child: ListTile(
                              title: Text("Sensor: ${item[index]['key']}"),
                              subtitle: Text(
                                  'Z-index: $fallIndicator  \nSpeed: $speed \nTemperature: $temp \nHumidity: $hum  \nStatus: $status \n\nAt Attitudet\nLongitude: $longitude \nLatitude: $latitude'),
                              isThreeLine: true,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(child: Text("No data"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
