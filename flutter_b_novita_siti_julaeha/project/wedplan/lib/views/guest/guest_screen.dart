import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/db_manager.dart';
import 'guest_list_screen.dart';
import 'empty_guest_screen.dart';
import 'guest_item_screen.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GuestItemScreen(),
            ),
          );
        },
      ),
      body: buildGuestScreen(),
    );
  }

  Widget buildGuestScreen() {
    return Consumer<DbManager>(
      builder: (context, manager, child) {
        if (manager.guestModels.isNotEmpty) {
          return GuestListScreen(manager: manager);
        } else {
          return const EmptyGuestScreen();
        }
      },
    );
  }
}
