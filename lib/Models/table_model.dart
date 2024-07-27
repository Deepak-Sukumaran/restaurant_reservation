import 'package:hive/hive.dart';

part 'table_model.g.dart';

@HiveType(typeId: 0)
class TableModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int seats;

  @HiveField(2)
  bool isReserved;

  TableModel({required this.id, required this.seats, this.isReserved = false});

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      id: json['id'],
      seats: json['seats'],
      isReserved: json['isReserved'] ?? false,
    );
  }
}

