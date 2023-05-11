import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/db_manager.dart';
import 'guest_item_card.dart';
import 'guest_item_screen.dart';

class GuestListScreen extends StatefulWidget {
  final DbManager manager;
  const GuestListScreen({super.key, required this.manager});

  @override
  State<GuestListScreen> createState() => _GuestListScreenState();
}

class _GuestListScreenState extends State<GuestListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17203A),
        title: Text(
          'Daftar Tamu',
          style: GoogleFonts.acme(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<DbManager>(
          builder: (context, manager, child) {
            final itemGuest = manager.guestModels;
            return ListView.separated(
              itemCount: itemGuest.length,
              itemBuilder: (context, index) {
                final item = itemGuest[index];
                return InkWell(
                  onTap: () async {
                    final selectedTask = await manager.getGuestById(item.id!);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuestItemScreen(
                          guestModels: selectedTask,
                        ),
                      ),
                    );
                  },
                  child: GuestItemCard(
                    guestModel: item,
                    onPressed: () {
                      manager.deleteGuest(item.id!);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.name} Deleted')),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
