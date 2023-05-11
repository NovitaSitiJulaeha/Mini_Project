import 'package:flutter/material.dart';
import 'package:wedplan/helper/database_helper.dart';
import 'package:wedplan/models/checklist_model.dart';

class DbManagerChecklist extends ChangeNotifier {
  List<ChecklistModel> _checklistModels = [];
  late DatabaseHelper _dbHelper;

  List<ChecklistModel> get checklistModels => _checklistModels;

  DbManagerChecklist() {
    _dbHelper = DatabaseHelper();
    _getAllChecklist();
  }

  void _getAllChecklist() async {
    _checklistModels = await _dbHelper.getChecklists();
    notifyListeners();
  }

  Future<void> addChecklist(ChecklistModel checklistModel) async {
    await _dbHelper.insertChecklist(checklistModel);
    _getAllChecklist();
  }

  Future<ChecklistModel> getChecklistById(int id) async {
    return await _dbHelper.getChecklistById(id);
  }

  void updateChecklist(ChecklistModel checklistModel) async {
    await _dbHelper.updateChecklist(checklistModel);
    _getAllChecklist();
  }

  void deleteChecklist(int id) async {
    await _dbHelper.deleteChecklist(id);
    _getAllChecklist();
  }
}
