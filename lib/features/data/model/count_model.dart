import 'package:cleanarchitecture/features/domain/entity/count_entity.dart';

class CountModel extends CountEntity {
  CountModel({required super.count, required this.b});
  final int a = 4;
  final String b;
}
