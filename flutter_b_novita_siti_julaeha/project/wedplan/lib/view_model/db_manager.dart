import 'package:flutter/material.dart';
import 'package:wedplan/models/guest_model.dart';
import '../helper/database_helper.dart';

class DbManager extends ChangeNotifier {
  List<GuestModel> _guestModels = [];
  late DatabaseHelper _dbHelper;

  List<GuestModel> get guestModels => _guestModels;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllGuest();
  }

  void _getAllGuest() async {
    _guestModels = await _dbHelper.getGuests();
    notifyListeners();
  }

  Future<void> addGuest(GuestModel guestModel) async {
    await _dbHelper.insertGuest(guestModel);
    _getAllGuest();
  }

  Future<GuestModel> getGuestById(int id) async {
    return await _dbHelper.getGuestById(id);
  }

  void updateGuest(GuestModel guestModel) async {
    await _dbHelper.updateGuest(guestModel);
    _getAllGuest();
  }

  void deleteGuest(int id) async {
    await _dbHelper.deleteGuest(id);
    _getAllGuest();
  }
}
