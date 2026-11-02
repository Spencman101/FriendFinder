import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Color scheme defined before all data of the app is loaded, ensures all themes are read.
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF4C6085),
      primary: const Color(0xFF4C6085),
      secondary: const Color(0xFFCF995F),
      tertiary: const Color(0xFF6D9F71),
    );
    
    return MaterialApp(
      title: 'FriendFinder',
      theme: ThemeData(
        // This is the theme of the application.

        colorScheme: colorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: colorScheme.secondary,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            minimumSize: const Size(0, 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.tertiary;
              }
              return colorScheme.secondary;
            }),
          ),
        ),
      ),
      home: const MyHomePage(title: 'FriendFinder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isInterested = false;
  bool _isToggledByInterests = false;
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Chats')
                ),
                Text(
                  'FriendFinder',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const LoginOptions(),
                      ),
                    );
                  },
                  child: Text('Acc')
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter city',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton( 
                        onPressed: () {},
                        child: 
                          Text(
                            'Use your location', 
                            style: 
                              TextStyle(
                                decoration: TextDecoration.underline
                              ),
                          )
                      ),
                      ElevatedButton(
                        onPressed: () {
                                  setState(() {
                                    _isToggledByInterests = !_isToggledByInterests;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isToggledByInterests
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                        child: Text('Filter By Interests')
                      )
                    ]
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Events near you',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SizedBox(
              height: 215,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: 
                Row(
                  children: [
                    SizedBox(
                      width: 280,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: Image.asset(
                                  'assets/images/placeholder-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text('Shakespeare in the Park'),
                              SizedBox(height: 8),
                              Text('October 23, 5:00 PM - Rexburg'),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isInterested = !_isInterested;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isInterested
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: const Text('Join'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 280,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: Image.asset(
                                  'assets/images/placeholder-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text('Shakespeare in the Park'),
                              SizedBox(height: 8),
                              Text('October 23, 5:00 PM - Rexburg'),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isInterested = !_isInterested;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isInterested
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: const Text('Join'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 280,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: Image.asset(
                                  'assets/images/placeholder-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text('Shakespeare in the Park'),
                              SizedBox(height: 8),
                              Text('October 23, 5:00 PM - Rexburg'),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isInterested = !_isInterested;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isInterested
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: const Text('Join'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                  Text(
                    'Your Joined Events',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
              ),
            ),
            SizedBox(
              height: 215,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: 
                Row(
                  children: [
                    SizedBox(
                      width: 280,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: Image.asset(
                                  'assets/images/placeholder-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text('Shakespeare in the Park'),
                              SizedBox(height: 8),
                              Text('October 23, 5:00 PM - Rexburg'),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isInterested = !_isInterested;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isInterested
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: const Text('Join'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 280,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: Image.asset(
                                  'assets/images/placeholder-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text('Shakespeare in the Park'),
                              SizedBox(height: 8),
                              Text('October 23, 5:00 PM - Rexburg'),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isInterested = !_isInterested;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isInterested
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: const Text('Join'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 280,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: Image.asset(
                                  'assets/images/placeholder-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text('Shakespeare in the Park'),
                              SizedBox(height: 8),
                              Text('October 23, 5:00 PM - Rexburg'),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isInterested = !_isInterested;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isInterested
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: const Text('Join'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
