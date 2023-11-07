import 'package:flutter/material.dart';
import 'package:state_management/models/plan.dart';
import '../views/plan_screen.dart';
import 'package:state_management/provider/plan_provider.dart';
void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  theme: ThemeData(primarySwatch: Colors.purple),
  home: PlanProvider(
    notifier: ValueNotifier<Plan>(const Plan()),
    child: const PlanScreen(),
   ),
);
  }
}