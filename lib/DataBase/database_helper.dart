import 'package:hive_flutter/hive_flutter.dart';
import '../Models/reservation_model.dart';
import '../Models/table_model.dart';

class DatabaseHelper {
  static String tableBoxName = 'tables';
  static String reservationBoxName = 'reservations';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TableModelAdapter());
    Hive.registerAdapter(ReservationModelAdapter());
    await Hive.openBox<TableModel>(tableBoxName);
    await Hive.openBox<ReservationModel>(reservationBoxName);
  }

  static Box<TableModel> get tableBox => Hive.box<TableModel>(tableBoxName);

  static Box<ReservationModel> get reservationBox =>
      Hive.box<ReservationModel>(reservationBoxName);

  static Future<void> addTable(TableModel table) async {
    await tableBox.put(table.id, table);
  }

  static Future<void> addReservation(ReservationModel reservation) async {
    await reservationBox.add(reservation);
    final table = tableBox.get(reservation.tableId);
    if (table != null) {
      table.isReserved = true;
      table.save();
    }
  }

  static Future<void> deleteReservation(int id) async {
    final reservation = reservationBox.get(id);
    if (reservation != null) {
      final table = tableBox.get(reservation.tableId);
      if (table != null) {
        table.isReserved = false;
        table.save();
      }
      await reservation.delete();
    }
  }
}
