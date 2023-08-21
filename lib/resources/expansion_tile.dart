import 'package:flutter/material.dart';

class ExpansionTileAssessments extends StatefulWidget {
  const ExpansionTileAssessments({super.key});

  @override
  State<ExpansionTileAssessments> createState() =>
      _ExpansionTileAssessmentsState();
}

class _ExpansionTileAssessmentsState extends State<ExpansionTileAssessments> {
final elements = <String>[
      'Element A',
      'Element B',
      'Element C',
      'Element D',
      'Element E',
    ];


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: elements.length,
                  shrinkWrap: true,
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
                              initialLabelIndex:
                                  instructors[appState.selectedInstructor]
                                              ['CBT']
                                          [String.fromCharCode(index + 65)]
                                      ['complete'],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
  }
}
