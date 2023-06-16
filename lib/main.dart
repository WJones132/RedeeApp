import 'package:english_words/english_words.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:io' show Platform;

void main() {
  // if (!Platform.isLinux && !Platform.isWindows) {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // }
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
          '/instructorDetails': (context) => InstructorDetailsPage(),
          '/comments': (context) => CommentsPage(),
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

    if (appState.selectedInstructor == "") {
      Navigator.popUntil(
        context,
        ModalRoute.withName('/selectInstructor'),
      );
    }

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
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return Material(
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
                );
              },
              itemCount: elements.length,
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
                  appState.selectedInstructor = "";
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

    if (appState.selectedInstructor == "") {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/selectInstructor', (Route<dynamic> route) => false);
    }

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
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
                          Navigator.pushNamed(
                            context,
                            '/comments',
                          );
                        },
                        // Update [0] with number of comments
                        child: Text('Comments [0]'),
                      ),
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

class CommentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${appState.selectedInstructor} - ${appState.selectedElement}: Comments',
        ),
      ),
      body: CommentBoxWidget(),
    );
  }
}

class CommentBoxWidget extends StatefulWidget {
  CommentBoxWidget({super.key});

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBoxWidget> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'pic': 'assets/img/userpic.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CommentBox(
      // userImage: CommentBox.commentImageParser(
      //   imageURLorPath: "assets/img/userpic.jpg",
      // ),
      labelText: 'Add a new comment here...',
      errorText: 'Comment cannot be blank',
      withBorder: false,
      formKey: formKey,
      commentController: commentController,
    );
  }
}

class CommentDialog extends StatefulWidget {
  const CommentDialog({super.key});

  @override
  State<TextButton> createState() => _CommentTextButtonState();
}

class _CommentTextButtonState extends State<TextButton> {
  var commentText = "";
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('New comment'),
          content: TextField(
            onChanged: (value) {
              setState(
                () {
                  commentText = value;
                },
              );
            },
            controller: _textEditingController,
            decoration: InputDecoration(hintText: "Add new comment here..."),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                print(commentText);
                Navigator.pop(context, 'OK');
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
      child: Text('Add comment'),
    );
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
