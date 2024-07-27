


import 'package:hive/hive.dart';

part 'reservation_model.g.dart';

@HiveType(typeId: 1)
class ReservationModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int tableId;

  @HiveField(2)
  final String customerName;

  @HiveField(3)
  final String customerPhone;

  @HiveField(4)
  final int numberOfGuests;

  ReservationModel({
    required this.id,
    required this.tableId,
    required this.customerName,
    required this.customerPhone,
    required this.numberOfGuests,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      tableId: json['tableId'],
      customerName: json['customerName'],
      customerPhone: json['customerPhone'],
      numberOfGuests: json['numberOfGuests'],
    );
  }
}
