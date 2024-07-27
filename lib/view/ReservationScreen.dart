// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_reservation/Models/reservation_model.dart' as r;
import 'package:restaurant_reservation/models/table_model.dart';

import '../DataBase/database_helper.dart';

class ReservationScreen extends StatefulWidget {
  final TableModel table;

  const ReservationScreen({super.key, required this.table});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _guestsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _guestsController.dispose();
    super.dispose();
  }

  void _saveReservation() async {
    if (_formKey.currentState!.validate()) {
      final reservation = r.ReservationModel(
        id: DateTime.now().millisecondsSinceEpoch,
        tableId: widget.table.id,
        customerName: _nameController.text,
        customerPhone: _phoneController.text,
        numberOfGuests: int.parse(_guestsController.text),
      );

      await DatabaseHelper.addReservation(reservation);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reservation saved')),
      );

      Navigator.pop(context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    throw UnimplementedError();
  }

 
}
