import 'package:flutter/material.dart';
import 'package:state_management/models/plan.dart';
import 'package:state_management/views/plan_creator_screen.dart';
import '../views/plan_screen.dart';
import 'package:state_management/provider/plan_provider.dart';
void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State management Alvaro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}