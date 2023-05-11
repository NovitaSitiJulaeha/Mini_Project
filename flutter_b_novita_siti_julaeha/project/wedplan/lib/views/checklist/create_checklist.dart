import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wedplan/models/checklist_model.dart';
import 'package:wedplan/view_model/checklist_manager.dart';

class CreateChecklist extends StatefulWidget {
  final ChecklistModel? checklistModels;
  const CreateChecklist({Key? key, this.checklistModels}) : super(key: key);

  @override
  State<CreateChecklist> createState() => _CreateChecklistState();
}

class _CreateChecklistState extends State<CreateChecklist> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();
  final _notesController = TextEditingController();
  bool _isUpdate = false;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    if (widget.checklistModels != null) {
      _taskController.text = widget.checklistModels!.task!;
      _notesController.text = widget.checklistModels!.notes!;
      _isUpdate = true;
    }
  }

  @override
  void dispose() {
    _taskController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17203A),
        title: const Text(
          'Create Task Checklist',
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.zero,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                buildNameField(),
                const SizedBox(
                  height: 16,
                ),
                buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _taskController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'task',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'Insert new task',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'notes',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'Insert new notes',
                ),
              ),
              Checkbox(
                value: _isCompleted,
                onChanged: (value) {
                  setState(() {
                    _isCompleted = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: () {
        if (!_isUpdate) {
          final item = ChecklistModel(
            task: _taskController.text,
            notes: _notesController.text,
            isCompleted: _isCompleted,
          );
          Provider.of<DbManagerChecklist>(context, listen: false)
              .addChecklist(item);
        } else {
          final item = ChecklistModel(
            id: widget.checklistModels!.id,
            task: _taskController.text,
            notes: _notesController.text,
            isCompleted: _isCompleted,
          );
          Provider.of<DbManagerChecklist>(context, listen: false)
              .updateChecklist(item);
        }
        Navigator.pop(context);
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(340.0, 40.0)),
      ),
      child: Text(
        'Submit',
        style: GoogleFonts.roboto(fontSize: 17),
      ),
    );
  }
}
