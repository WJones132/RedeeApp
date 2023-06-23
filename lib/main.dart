import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:io' show Platform;

void main() async {
  // if (!Platform.isLinux && !Platform.isWindows) {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
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

  var selectedInstructor = {};
  var selectedElement = "";
  var selectedCommentIndex = 0;
  var elementCompletion = 1;
  List<int> completeElements = [1, 1, 1, 1, 1];
  String commentDialogTitle = 'New comment';

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
          "A": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "B": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "C": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "D": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "E": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
        },
        "DAS": {},
        "email": "inst1@email.com",
        "name": "Garfield Villaneueva",
        "id": "7d951eb1-ad1d-4b8a-9090-45e535f0e59b",
      },
      "3101bc97-c6d8-4529-94a9-2c163d163cd4": {
        "CBT": {
          "A": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "B": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "C": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "D": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "E": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
        },
        "DAS": {},
        "email": "inst2@email.com",
        "name": "Madison Shepard",
        "id": "3101bc97-c6d8-4529-94a9-2c163d163cd4",
      },
      "cee2fbd2-6f64-4422-8a0a-4322f7146073": {
        "CBT": {
          "A": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "B": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "C": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "D": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
          "E": [
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            {
              "complete": 1,
              'comments': [],
            },
            1
          ],
        },
        "DAS": {},
        "email": "inst3@email.com",
        "name": "Leighton Drake",
        "id": "cee2fbd2-6f64-4422-8a0a-4322f7146073",
      }
    },
  };

  void fixElement() {
    if ([
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
    ].any(selectedElement.contains)) {
      var s = selectedElement.split(" ");
      selectedElement = "${s[0]} ${s[1]}";
    }
  }

  String editOrSave = "save";

  void editOrSaveComment(String comment, [int index = -1]) {
    if (comment.isNotEmpty) {
      if (editOrSave.toLowerCase() == "edit") {
        // edit comment
        data['instructors'][selectedInstructor['id']]['CBT']
                    [selectedElement.split(" ")[1]]
                [int.parse(selectedElement.split(" ").last)]['comments']
            [selectedCommentIndex] = comment;
      } else if (editOrSave.toLowerCase() == "save") {
        data['instructors'][selectedInstructor['id']]['CBT']
                    [selectedElement.split(" ")[1]]
                [int.parse(selectedElement.split(" ").last)]['comments']
            .add(comment);
      }
    }
    editOrSave = "save";
    commentDialogTitle = 'New comment';
    notifyListeners();
  }

  void deleteComment(int index) {
    data['instructors'][selectedInstructor['id']]['CBT']
                [selectedElement.split(" ")[1]]
            [int.parse(selectedElement.split(" ").last)]['comments']
        .removeAt(index);

    notifyListeners();
  }

  void setStatusCompletion(int index, int yesNo) {
    data['instructors'][selectedInstructor['id']]['CBT']
        [selectedElement.split(" ")[1]][index]['complete'] = yesNo;

    setElementCompletion();

    notifyListeners();
  }

  void setElementCompletion() {
    var complete = true;
    var letters = ['A', 'B', 'C', 'D', 'E'];
    var elementsComplete = data['instructors'][selectedInstructor['id']]['CBT'];

    for (var i = 0; i < letters.length; i++) {
      for (var j = 0; j < elementsComplete[letters[i]].length - 1; j++) {
        if (elementsComplete[letters[i]][j]['complete'] == 1) {
          complete = false;
        }
      }
      complete ? completeElements[i] = 0 : completeElements[i] = 1;
      complete = true;
    }
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
                        ToggleSwitch(
                          changeOnTap: false,
                          totalSwitches: 1,
                          labels: ['Complete'],
                          minWidth: 90,
                          minHeight: 30,
                          activeBgColors: [
                            [Colors.greenAccent, Colors.green]
                          ],
                          initialLabelIndex: appState.completeElements[index],
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
  var _selectedYesNo = <bool>[false, true];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var complete = appState.data['instructors']
            [appState.selectedInstructor['id']]['CBT']
        [appState.selectedElement.split(" ")[1]]['complete'];

    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: ToggleButtons(
        direction: Axis.horizontal,
        onPressed: (int index) {
          appState.setStatusCompletion(index, 0);
          setState(() {
            for (int i = 0; i < 2; i++) {
              _selectedYesNo[i] = i == index;
            }
          });
        },
        borderRadius: BorderRadius.all(Radius.circular(20)),
        isSelected: _selectedYesNo,
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
                        // child: ToggleYesNo(),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: ToggleSwitch(
                            totalSwitches: 2,
                            labels: ['Complete', ''],
                            icons: [null, Icons.close],
                            customWidths: [90, 50],
                            minHeight: 30,
                            activeBgColors: [
                              [Colors.greenAccent, Colors.green],
                              [Colors.redAccent, Colors.red]
                            ],
                            initialLabelIndex: appState.data['instructors']
                                            [appState.selectedInstructor['id']]
                                        ['CBT']
                                    [appState.selectedElement.split(" ")[1]]
                                [index]['complete'],
                            onToggle: (yesNo) {
                              appState.setStatusCompletion(
                                index,
                                yesNo!,
                              );
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          appState.selectedElement =
                              "${appState.selectedElement} ${(index).toString()}";
                          // context.go('/comments');
                          Navigator.pushNamed(context, '/comments');
                        },
                        child: Text(
                          'Comments [${appState.data['instructors'][appState.selectedInstructor['id']]['CBT'][appState.selectedElement.split(" ")[1]][index]['comments'].length}]',
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
                  Navigator.pop(context, true);
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
    var commentText = appState.data['instructors']
                [appState.selectedInstructor['id']]['CBT']
            [appState.selectedElement.split(" ")[1]]
        [int.parse(appState.selectedElement.split(" ").last)]['comments'];

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      itemCount: commentText?.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return Material(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  commentText[index],
                  softWrap: true,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  final TextEditingController eCtrl = TextEditingController();
                  appState.commentDialogTitle = 'Edit comment';
                  appState.editOrSave = "Edit";
                  appState.selectedCommentIndex = index;
                  showCommentDialog(
                      context, appState, eCtrl, commentText[index]);
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  appState.deleteComment(index);
                },
                icon: Icon(Icons.delete),
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
    appState.editOrSave = 'Save';

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
      onPressed: () => showCommentDialog(context, appState, eCtrl, ""),
      child: Text('Add comment'),
    );
  }
}

Future<dynamic> showCommentDialog(BuildContext context, MyAppState appState,
    TextEditingController eCtrl, String initText) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(appState.commentDialogTitle),
      content: TextField(
        textInputAction: TextInputAction.go,
        controller: eCtrl..text = initText,
        onSubmitted: (value) {
          appState.editOrSaveComment(value);
          eCtrl.clear();
          Navigator.pop(context, "OK");
        },
        decoration: InputDecoration(
          hintText: "Add new comment here...",
          suffixIcon: IconButton(
            onPressed: () {
              appState.editOrSaveComment(eCtrl.text);
              eCtrl.clear();
              Navigator.pop(context, "OK");
            },
            icon: Icon(Icons.add_comment_outlined),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            appState.commentDialogTitle = "New comment";
            Navigator.pop(context, 'Cancel');
            eCtrl.clear();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            appState.editOrSaveComment(eCtrl.text);
            eCtrl.clear();
            Navigator.pop(context, "OK");
          },
          child: Text(appState.editOrSave),
        ),
      ],
    ),
  ).then((value) {
    appState.commentDialogTitle = "New comment";
  });
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
