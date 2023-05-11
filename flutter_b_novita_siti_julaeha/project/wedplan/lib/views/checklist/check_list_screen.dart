import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedplan/view_model/checklist_manager.dart';
import 'package:wedplan/views/checklist/create_checklist.dart';

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
              final item = itemCheck[index];
              return InkWell(
                onTap: () async {
                  final selectedTask = await manager.getChecklistById(item.id!);
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateChecklist(
                        checklistModels: selectedTask,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemCheck[index].task!,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: itemCheck[index].isCompleted
                                ? Colors.grey
                                : null,
                            decoration: itemCheck[index].isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: const Text(
                                  'Are you sure?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'NO',
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        manager.deleteChecklist(item.id!);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'YES',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
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
