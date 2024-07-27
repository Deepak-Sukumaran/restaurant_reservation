
import 'package:flutter/material.dart';
import 'package:restaurant_reservation/Services/api_services.dart';
import 'package:restaurant_reservation/models/table_model.dart';
import 'package:hive/hive.dart';
import 'package:restaurant_reservation/view/ReservationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<TableModel>> futureTables;
  late Box<TableModel> tableBox;

  @override
  // ignore: must_call_super
  void initState() {
    futureTables = ApiServices().fetchTables() as Future<List<TableModel>>;
    tableBox = Hive.box<TableModel>('tables');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Table Reservations'),
      ),
      body: FutureBuilder<List<TableModel>>(
        future: futureTables,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tables available'));
          } else {
            return ListView(
              children: snapshot.data!.map((table) {
                return ListTile(
                  title: Text('Table ${table.id} - ${table.seats} seats'),
                  subtitle: Text(
                    table.isReserved ? 'Reserved' : 'Available',
                  ),
                  onTap: table.isReserved
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReservationScreen(table: table)
                            ),
                          );
                        },
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}


