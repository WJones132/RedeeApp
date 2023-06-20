import 'dart:async';
import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:io' show Platform;

void main() async {
  // if (!Platform.isLinux && !Platform.isWindows) {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp /*.router*/ (
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
        // routerConfig: GoRouter(
        //   initialLocation: '/selectedInstructor',
        //   routes: [
        //     GoRoute(
        //       path: '/selectedInstructor',
        //       builder: (context, state) => SelectInstructorPage(),
        //     ),
        //     GoRoute(
        //       path: '/instructor',
        //       builder: (context, state) => InstructorPage(),
        //     ),
        //     GoRoute(
        //       path: '/element',
        //       builder: (context, state) => ElementPage(),
        //     ),
        //     GoRoute(
        //       path: '/comments',
        //       builder: (context, state) => CommentsPage(),
        //     ),
        //     GoRoute(
        //       path: '/instructorDetails',
        //       builder: (context, state) => InstructorDetailsPage(),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // var current = WordPair.random();
  // var favorites = <WordPair>[];
  int selectedIndex = 0;

  // void getNext() {
  //   current = WordPair.random();
  //   notifyListeners();
  // }

  // void toggleFavorite() {
  //   if (favorites.contains(current)) {
  //     favorites.remove(current);
  //   } else {
  //     favorites.add(current);
  //   }
  //   notifyListeners();
  // }

  // void changePage(int page) {
  //   selectedIndex = page;
  //   notifyListeners();
  // }

  // var instructors = <String>[];
  var selectedInstructor = {};
  var selectedElement = "";
  // var data = <List<List<List<List, String>>>>{};
  Map data = {
    "elements": {
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
      ],
    },
    "instructors": {
      "7d951eb1-ad1d-4b8a-9090-45e535f0e59b": {
        "CBT": {
          "A": {
            "1": [],
            "2": [],
            "3": [],
            "complete": false,
          },
          "B": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "complete": false,
          },
          "C": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "complete": false
          },
          "D": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "10": [],
            "11": [],
            "12": [],
            "13": [],
            "14": [],
            "complete": false
          },
          "E": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "complete": false
          },
        },
        "DAS": {},
        "email": "inst1@email.com",
        "name": "Garfield Villaneueva",
        "id": "7d951eb1-ad1d-4b8a-9090-45e535f0e59b",
      },
      "3101bc97-c6d8-4529-94a9-2c163d163cd4": {
        "CBT": {
          "A": {
            "1": [],
            "2": [],
            "3": [],
            "complete": false,
          },
          "B": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "complete": false,
          },
          "C": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "complete": false
          },
          "D": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "10": [],
            "11": [],
            "12": [],
            "13": [],
            "14": [],
            "complete": false
          },
          "E": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "complete": false
          },
        },
        "DAS": {},
        "email": "inst2@email.com",
        "name": "Madison Shepard",
        "id": "3101bc97-c6d8-4529-94a9-2c163d163cd4",
      },
      "cee2fbd2-6f64-4422-8a0a-4322f7146073": {
        "CBT": {
          "A": {
            "1": [],
            "2": [],
            "3": [],
            "complete": false,
          },
          "B": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "complete": false,
          },
          "C": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "complete": false
          },
          "D": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "10": [],
            "11": [],
            "12": [],
            "13": [],
            "14": [],
            "complete": false
          },
          "E": {
            "1": [],
            "2": [],
            "3": [],
            "4": [],
            "5": [],
            "6": [],
            "7": [],
            "8": [],
            "9": [],
            "complete": false
          },
        },
        "DAS": {},
        "email": "inst3@email.com",
        "name": "Leighton Drake",
        "id": "cee2fbd2-6f64-4422-8a0a-4322f7146073",
      }
    },
  };

  List<String> comments = [];

  void addComment(String comment) {
    if (comment.isNotEmpty) {
      data['instructors'][selectedInstructor['id']]['CBT']
              [selectedElement.split(" ")[1]][selectedElement.split(" ").last]
          .add(comment);
      notifyListeners();
    }
  }

  void setElementCompletionStatus(int index) {
    bool complete = data['instructors'][selectedInstructor['id']]['CBT']
        [selectedElement.split(" ")[1]]['complete'];
    index == 0 ? complete = true : complete = false;
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
              itemCount: appState.data['instructors'].length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Material(
                  // color: Colors.amber[codes[index]],
                  child: InkWell(
                    onTap: () => {
                      appState.selectedInstructor =
                          appState.data['instructors'].values.elementAt(index),
                      // context.go('/instructor'),
                      Navigator.pushNamed(
                        context,
                        '/instructor',
                      )
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Text(appState.data['instructors'].values
                          .elementAt(index)['name']),
                    ),
                  ),
                );
              },
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

    // if (appState.selectedInstructor == "") {
    //   Navigator.popUntil(
    //     context,
    //     ModalRoute.withName('/selectInstructor'),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appState.selectedInstructor['name']),
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
              itemCount: elements.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Material(
                  child: InkWell(
                    onTap: () => {
                      appState.selectedElement = elements[index],
                      // context.go('/element'),
                      Navigator.pushNamed(context, '/element'),
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
                  // appState.selectedInstructor = {};
                  // context.go('/selectedInstructor');
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

// Map<String, bool> yesNo = {'Yes': false, 'no': true};
const List<Widget> yesNo = <Widget>[Text('Yes'), Text('No')];

class ToggleYesNo extends StatefulWidget {
  ToggleYesNo({super.key});

  @override
  State<ToggleYesNo> createState() => _ToggleYesNo();
}

class _ToggleYesNo extends State<ToggleYesNo> {
  // var _selectedYesNo = <bool>[false, true];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var complete = appState.data['instructors']
            [appState.selectedInstructor['id']]['CBT']
        [appState.selectedElement.split(" ")[1]]['complete'];

    Map<String, Color> yesNoColors = {
      'Yes': Colors.green,
      'no': Theme.of(context).colorScheme.primary
    };

    var selectedYesNo = <bool>[complete, !complete];

    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: ToggleButtons(
        direction: Axis.horizontal,
        onPressed: (int index) {
          appState.setElementCompletionStatus(index);
          for (int i = 0; i < 2; i++) {
            selectedYesNo[i] = i == index;
          }
        },
        borderRadius: BorderRadius.all(Radius.circular(20)),
        isSelected: selectedYesNo,
        // fillColor:  ?  : ,
        constraints: BoxConstraints(
          minHeight: 30,
          minWidth: 60,
        ),
        children: yesNo,
      ),
    );
  }
}

class ElementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // if (appState.selectedInstructor == "") {
    //   Navigator.of(context).pushNamedAndRemoveUntil(
    //       '/selectInstructor', (Route<dynamic> route) => false);
    // }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${appState.selectedInstructor['name']} - ${appState.selectedElement}',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              itemCount: appState
                  .data['elements'][appState.selectedElement.split(" ")[1]]
                  .length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Material(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          appState.data['elements']![
                              appState.selectedElement.split(" ")[1]][index],
                          softWrap: true,
                        ),
                      ),
                      Center(
                        child: ToggleYesNo(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          appState.selectedElement =
                              "${appState.selectedElement} ${(index + 1).toString()}";
                          // context.go('/comments');
                          Navigator.pushNamed(context, '/comments');
                        },
                        child: Text(
                          'Comments [${appState.data['instructors'][appState.selectedInstructor['id']]['CBT'][appState.selectedElement.split(" ")[1]][(index + 1).toString()].length}]',
                        ),
                      ),
                    ],
                  ),
                );
              },
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
    var appState = context.watch<MyAppState>();
    return Center();
  }
}

class ListDisplay extends StatefulWidget {
  @override
  State createState() => DyanmicList();
}

class DyanmicList extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      itemCount: appState
          .data['instructors']![appState.selectedInstructor['id']]['CBT']
              [appState.selectedElement.split(" ")[1]]
              [appState.selectedElement.split(" ").last]
          ?.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return Material(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  appState.data['instructors']
                              [appState.selectedInstructor['id']]['CBT']
                          [appState.selectedElement.split(" ")[1]]
                      [appState.selectedElement.split(" ").last][index],
                  softWrap: true,
                ),
              ),
            ],
          ),
        );
      },
    );
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
          '${appState.selectedInstructor['name']} - ${appState.selectedElement}',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CommentDialog(),
          Expanded(
            child: ListDisplay(),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Save to db
                  appState.selectedElement = appState.selectedElement
                      .substring(0, appState.selectedElement.length - 2);
                  // context.go('/element');
                  Navigator.pop(context);
                },
                child: Text('Submit Comments'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentDialog extends StatefulWidget {
  const CommentDialog({super.key});

  @override
  State<CommentDialog> createState() => _CommentTextButtonState();
}

class _CommentTextButtonState extends State<CommentDialog> {
  var commentText = "";
  String? newComment;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final TextEditingController eCtrl = TextEditingController();

    return TextButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('New comment'),
          content: TextField(
            textInputAction: TextInputAction.go,
            controller: eCtrl,
            onSubmitted: (value) {
              appState.addComment(value);
              eCtrl.clear();
              Navigator.pop(context, "OK");
            },
            decoration: InputDecoration(
              hintText: "Add new comment here...",
              suffixIcon: IconButton(
                onPressed: () {
                  appState.addComment(eCtrl.text);
                  eCtrl.clear();
                  Navigator.pop(context, "OK");
                },
                icon: Icon(Icons.add_comment_outlined),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                Navigator.pop(context, 'Cancel'),
                eCtrl.clear(),
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                appState.addComment(eCtrl.text);
                eCtrl.clear();
                Navigator.pop(context, "OK");
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

// class GeneratorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;

//     IconData icon;
//     if (appState.favorites.contains(pair)) {
//       icon = Icons.favorite;
//     } else {
//       icon = Icons.favorite_border;
//     }

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BigCard(pair: pair),
//           SizedBox(height: 10),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   appState.toggleFavorite();
//                 },
//                 icon: Icon(icon),
//                 label: Text('Like'),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   appState.getNext();
//                 },
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FavouritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var favourites = appState.favorites;

//     if (favourites.isEmpty) {
//       return Center(
//         child: Text('No favourite words yet!'),
//       );
//     }

//     return ListView(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text('You have ${appState.favorites.length} favourites'),
//         ),
//         for (var pair in favourites)
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text(pair.asLowerCase),
//           ),
//       ],
//     );
//   }
// }

// class BigCard extends StatelessWidget {
//   const BigCard({
//     super.key,
//     required this.pair,
//   });

//   final WordPair pair;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.textTheme.displayMedium!.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );

//     return Card(
//       color: theme.colorScheme.primary,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           pair.asLowerCase,
//           style: style,
//           semanticsLabel: "${pair.first} ${pair.second}",
//         ),
//       ),
//     );
//   }
// }
