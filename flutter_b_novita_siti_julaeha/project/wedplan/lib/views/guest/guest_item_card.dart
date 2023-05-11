import 'package:flutter/material.dart';
import '../../models/guest_model.dart';

class GuestItemCard extends StatelessWidget {
  final GuestModel guestModel;
  final Function() onPressed;

  const GuestItemCard({
    Key? key,
    required this.guestModel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                guestModel.name.substring(0, 1),
              ),
            ),
            title: Text(
              guestModel.name,
            ),
            subtitle: Text(
              guestModel.address,
            ),
            trailing: IconButton(
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
                        onPressed: onPressed,
                        child: const Text(
                          'YES',
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete_forever_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
