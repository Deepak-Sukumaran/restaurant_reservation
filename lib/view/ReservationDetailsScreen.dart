import 'package:flutter/material.dart';

import 'package:restaurant_reservation/models/reservation_model.dart';

import '../DataBase/database_helper.dart';

class ReservationDetailsScreen extends StatelessWidget {
  final ReservationModel reservation;

  const ReservationDetailsScreen({super.key, required this.reservation});

  void _cancelReservation(BuildContext context) async {
    await DatabaseHelper.deleteReservation(reservation.id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reservation cancelled')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer Name: ${reservation.customerName}', style: const TextStyle(fontSize: 18)),
            Text('Customer Phone: ${reservation.customerPhone}', style: const TextStyle(fontSize: 18)),
            Text('Number of Guests: ${reservation.numberOfGuests}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _cancelReservation(context),
              child: const Text('Cancel Reservation'),
            ),
          ],
        ),
      ),
    );
  }
}
