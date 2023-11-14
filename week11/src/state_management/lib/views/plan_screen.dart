import 'package:state_management/provider/plan_provider.dart';
import 'package:state_management/models/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:state_management/views/plan_creator_screen.dart';
class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({
    super.key,
    required this.plan,
  });

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // Plan plan = const Plan();
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        int planIndex = planNotifier.value.indexWhere((p) => p.name == plan.name);
        Plan currentPlan = planNotifier.value[planIndex];
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)..add(const Task());
        planNotifier.value = List<Plan>.from(planNotifier.value)..[planIndex] = Plan(
          name: currentPlan.name,
          tasks: updatedTasks,
        );
        // plan = Plan(
        //   name: currentPlan.name,
        //   tasks: updatedTasks,
        // );
      },
    );
  }

  // Widget _buildAddTaskButton(BuildContext context) {
  //   ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
  //   return FloatingActionButton(
  //     child: const Icon(Icons.add),
  //     onPressed: () {
  //       Plan currentPlan = planNotifier.value;
  //       planNotifier.value = Plan(
  //         name: currentPlan.name,
  //         tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
  //       );
  //       // setState(() {
  //       //   plan = Plan(
  //       //     name: plan.name,
  //       //     tasks: List<Task>.from(plan.tasks)
  //       //     ..add(const Task()),
  //       //   );
  //       // });
  //     },
  //   );
  // }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          int planIndex = planNotifier.value.indexWhere((p) => p.name == plan.name);
          Plan currentPlan = planNotifier.value[planIndex];
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
        }
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          int planIndex = planNotifier.value.indexWhere((p) => p.name == plan.name);
          Plan currentPlan = planNotifier.value[planIndex];
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name, 
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
        },
      ),
    );
  }

  // Widget _buildTaskTile(Task task, int index, BuildContext context) {
  //   ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
  //   return ListTile(
  //     leading: Checkbox(
  //         value: task.complete,
  //         onChanged: (selected) {
  //           Plan currentPlan = planNotifier.value;
  //           planNotifier.value = Plan(
  //             name: currentPlan.name,
  //             tasks: List<Task>.from(currentPlan.tasks)
  //               ..[index] = Task(
  //                 description: task.description,
  //                 complete: selected ?? false,
  //               ),
  //           );
  //           // setState(() {
  //           //   plan = Plan(
  //           //     name: plan.name,
  //           //     tasks: List<Task>.from(plan.tasks)
  //           //       ..[index] = Task(
  //           //         description: task.description,
  //           //         complete: selected ?? false,
  //           //       ),
  //           //   );
  //           // });
  //         }
  //       ),
  //     title: TextFormField(
  //       initialValue: task.description,
  //       onChanged: (text) {
  //         Plan currentPlan = planNotifier.value;
  //         planNotifier.value = Plan(
  //           name: currentPlan.name,
  //           tasks: List<Task>.from(currentPlan.tasks)
  //             ..[index] = Task(
  //               description: text,
  //               complete: task.complete,
  //             ),
  //         );
  //         // setState(() {
  //         //   plan = Plan(
  //         //     name: plan.name,
  //         //     tasks: List<Task>.from(plan.tasks)
  //         //       ..[index] = Task(
  //         //         description: text,
  //         //         complete: task.complete,
  //         //       ),
  //         //   );
  //         // });
  //       },
  //     ),
  //   );
  // }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform ==TargetPlatform.iOS
        ? ScrollViewKeyboardDismissBehavior.onDrag
        : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
      _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context,),
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Master Plan Roziq Mahbubi')),
    //   body: ValueListenableBuilder<Plan>(
    //     valueListenable: PlanProvider.of(context),
    //     builder: (context, plan, child) {
    //       return Column(
    //         children: [
    //           Expanded(child: _buildList(plan)),
    //           SafeArea(
    //             child: Container(
    //               margin: EdgeInsets.only(bottom: 1),
    //               child: Column(
    //                 children: [
    //                   Text(plan.completenessMessage),
    //                   ProgressBar(
    //                     width: double.infinity,
    //                     value: (plan.completedCount/plan.length),
    //                     height: 5.0,
    //                     backgroundColor: Colors.grey,
    //                     gradient: LinearGradient(
    //                       begin: Alignment.topLeft,
    //                       end: Alignment.bottomRight,
    //                       colors: [Color.fromARGB(255, 170, 229, 115), Color.fromARGB(255, 108, 223, 0)],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    //   floatingActionButton: _buildAddTaskButton(context),
    // );
  }

}