import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Redee App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(Colors.white),
            fillColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
        initialRoute: '/selectInstructor',
        routes: {
          // '/': (context) => MyHomePage(),
          '/selectInstructor': (context) => SelectInstructorPage(),
          '/instructor': (context) => InstructorPage(),
          '/element': (context) => ElementPage(),
          '/instructorDetails': (context) => InstructorDetailsPage()
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];
  var instructors = <String>[];
  var selectedInstructor = "";
  var selectedElement = "A";
  int selectedIndex = 0;

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void changePage(int page) {
    selectedIndex = page;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    int selectedIndex = appState.selectedIndex;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = SelectInstructorPage();
        break;
      case 1:
        page = InstructorPage();
        break;
      case 2:
        page = ElementPage();
        break;
      case 3:
        page = InstructorDetailsPage();
      default:
        throw UnimplementedError('No Widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constrains) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('App Title'),
          ),
          body: Row(
            children: [
              // SafeArea(
              //   child: NavigationRail(
              //     extended: constrains.maxWidth >= 600,
              //     destinations: [
              //       NavigationRailDestination(
              //         icon: Icon(Icons.home),
              //         label: Text('Home'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.favorite),
              //         label: Text('Favorites'),
              //       ),
              //     ],
              //     selectedIndex: selectedIndex,
              //     onDestinationSelected: (value) {
              //       setState(() {
              //         context.watch<MyAppState>().changePage(value);
              //       });
              //     },
              //   ),
              // ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelectInstructorPage extends StatelessWidget {
  SelectInstructorPage({super.key});

  final List<String> entries = <String>[
    'Garfield Villanueva',
    'Madison Shepard',
    'Leighton Drake'
  ];
  final List<int> codes = <int>[600, 400, 200];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Instructor'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This will be used to add a new Instructor.'),
                ),
              );
            },
            icon: const Icon(Icons.add),
            tooltip: 'Add new Instructor',
          )
        ],
      ),
      body: Column(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.amber[codes[index]],
                  child: InkWell(
                    onTap: () => {
                      appState.selectedInstructor = entries[index],
                      Navigator.pushNamed(
                        context,
                        '/instructor',
                      )
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Text(entries[index]),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

class InstructorPage extends StatelessWidget {
  InstructorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final elements = <String>[
      'Element A',
      'Element B',
      'Element C',
      'Element D',
      'Element E',
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appState.selectedInstructor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // navigatge to instructor details page
            },
            child: const Text('User details (disabled)'),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    border: Border(
                      top: (index == 0)
                          ? BorderSide(color: Theme.of(context).dividerColor)
                          : BorderSide.none,
                      bottom: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                  ),
                  child: Material(
                    child: InkWell(
                      onTap: () => {
                        appState.selectedElement = elements[index],
                        Navigator.pushNamed(
                          context,
                          '/element',
                        )
                      },
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            child: Text(elements[index]),
                          ),
                          Spacer(),
                          Checkbox(
                            value: false,
                            onChanged: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: elements.length,
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Save to db
                  Navigator.pop(context);
                },
                child: Text('Submit Element'),
              ),
            ),
          ),
        ],
      ),
    );

    // return Center(
    //   child: Text('Instructor: ${appState.selectedInstructor}'),
    // );
  }
}

class CheckboxExample extends StatefulWidget {
  CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.green,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class ElementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    Map<String, List<String>?> elements = {
      "A": [
        "The aims of the compulsory basic training course.",
        "The importance of having the right equipment and clothing.",
        "Read a vehicle registration plate 79.4 mm in height at 20.5m.",
      ],
      "B": [
        "Be familiar with motorcycle, its controls and how it works.",
        "Be able to carry out basic machine checks.",
        "Be able to wheel the machine around to the left and right showing proper balance and bring to a controlled halt by braking. Take the bike on/off stand.",
        "Be able to start and stop the engine satisfactorily.",
      ],
      "C": [
        "Ride the machine in a straight line and bring to a controlled halt.",
        "Ride the machine slowly under control.",
        "Carry out controlled braking using both brakes.",
        "Change gear satisfactorily.",
        "Ride the machine round in a figure of eight circuit under control.",
        "Bring the machine to a stop under full control as in an emergency.",
        "Carry out rear observation correctly.",
        "Carry out simulated left and right turns correctly using OSM & PSL routines.",
        "Carry out a U-turn manoeuvre satisfactorily.",
      ],
      "D": [
        "Be clearly visible to other road users (Conspicuity aids).",
        "The importance of knowing the legal requirements for riding on the road.",
        "Why motorcyclists are more vulnerable than most road users.",
        "Drive at the correct speed according to the road and traffic conditions.",
        "The importance of knowing the highway code.",
        "Ride defensively and anticipate the actions of other road users.",
        "Use rear observation at appropriate times.",
        "Assume the correct road position when riding.",
        "Leave sufficient space when following another vehicle.",
        "Pay due regard to the effect of varying weather conditions when riding.",
        "The effects of various types of road surface on a vehicle.",
        "The dangers of drug and alcohol use.",
        "The consequences of aggressive attitudes when driving.",
        "The importance of hazard perception.",
      ],
      "E": [
        "Traffic lights.",
        "Roundabouts.",
        "Junctions.",
        "Pedestrian crossings.",
        "Gradients.",
        "Bends.",
        "Obstructions",
        "Carry out a U-turn manoeuvre satisfactorily.",
        "Bring the machine to a stop under full control as in an emergency.",
      ]
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${appState.selectedInstructor} - ${appState.selectedElement}',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                // return Container(
                // decoration: BoxDecoration(
                //   color: Theme.of(context).dividerColor,
                //   border: Border(
                //     top: (index == 0)
                //         ? BorderSide(color: Theme.of(context).dividerColor)
                //         : BorderSide.none,
                //     bottom: BorderSide(color: Theme.of(context).dividerColor),
                //   ),
                // ),
                return Material(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          elements[appState.selectedElement.split(" ").last]![
                              index],
                          softWrap: true,
                        ),
                      ),
                      Center(
                        child: CheckboxExample(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Go to comments page
                        },
                        child: Text(
                            'Comments [0]'), // Update [0] with number of comments
                      )
                    ],
                  ),
                );
              },
              itemCount:
                  elements[appState.selectedElement.split(" ").last]!.length,
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Save to db
                  Navigator.pop(context);
                },
                child: Text('Submit Element'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InstructorDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    return Center();
  }
}

// OLD

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favourites = appState.favorites;

    if (favourites.isEmpty) {
      return Center(
        child: Text('No favourite words yet!'),
      );
    }

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${appState.favorites.length} favourites'),
        ),
        for (var pair in favourites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
