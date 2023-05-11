import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedplan/view_model/checklist_manager.dart';

class ChecklistScreen extends StatefulWidget {
  final DbManagerChecklist manager;
  const ChecklistScreen({super.key, required this.manager});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<DbManagerChecklist>(
        builder: (context, manager, child) {
          final itemCheck = manager.checklistModels;
          return ListView.builder(
            itemCount: itemCheck.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    itemCheck[index].task!,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: itemCheck[index].isCompleted! ? Colors.grey : null,
                      decoration: itemCheck[index].isCompleted!
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
