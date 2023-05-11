import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/guest_model.dart';
import '../../view_model/db_manager.dart';

class GuestItemScreen extends StatefulWidget {
  final GuestModel? guestModels;
  const GuestItemScreen({
    Key? key,
    this.guestModels,
  }) : super(key: key);

  @override
  State<GuestItemScreen> createState() => _GuestItemScreenState();
}

class _GuestItemScreenState extends State<GuestItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.guestModels != null) {
      _nameController.text = widget.guestModels!.name;
      _addressController.text = widget.guestModels!.address;
      _isUpdate = true;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  String? _validateName(String value) {
    if (value.isNotEmpty && !value.trim().startsWith(RegExp('[A-Z]'))) {
      return 'Name must start with a capital letter';
    } else {
      return null; // form is valid
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17203A),
        title: const Text(
          'Create Guest',
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
                controller: _nameController,
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
                  labelText: 'Name',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'Insert guest name',
                ),
                validator: (value) => _validateName(_nameController.text),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _addressController,
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
                  labelText: 'Address',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'Insert guest address',
                ),
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
          final guest = GuestModel(
            name: _nameController.text,
            address: _addressController.text,
          );
          Provider.of<DbManager>(context, listen: false).addGuest(guest);
        } else {
          final guest = GuestModel(
            id: widget.guestModels!.id,
            name: _nameController.text,
            address: _addressController.text,
          );
          Provider.of<DbManager>(context, listen: false).updateGuest(guest);
        }
        Navigator.pop(context);
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(340.0, 40.0)),
      ),
      child: const Text(
        'Submit',
      ),
    );
  }
}
