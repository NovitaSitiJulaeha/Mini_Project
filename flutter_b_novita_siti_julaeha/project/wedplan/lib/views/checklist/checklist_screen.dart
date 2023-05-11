import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedplan/view_model/checklist_manager.dart';
import 'package:wedplan/views/checklist/check_list_screen.dart';
import 'package:wedplan/views/checklist/create_checklist.dart';
import 'package:wedplan/views/checklist/empty_check_screen.dart';

class Checklist extends StatefulWidget {
  const Checklist({Key? key}) : super(key: key);

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateChecklist(),
            ),
          );
        },
      ),
      body: buildGuestScreen(),
    );
  }

  Widget buildGuestScreen() {
    return Consumer<DbManagerChecklist>(
      builder: (context, manager, child) {
        if (manager.checklistModels.isNotEmpty) {
          return ChecklistScreen(manager: manager);
        } else {
          return const EmptyCheckScreen();
        }
      },
    );
  }
}
