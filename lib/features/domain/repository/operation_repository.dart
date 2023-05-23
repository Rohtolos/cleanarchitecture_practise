import 'package:cleanarchitecture/core/error/failure.dart';
import 'package:cleanarchitecture/features/data/datasource/operation_datasource.dart';
import 'package:cleanarchitecture/features/domain/entity/count_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OperationRepository {
  OperationRepository({required this.operationDataSource});
  OperationDataSource operationDataSource;
  Either<OperationFailure, CountEntity> increment(int number);
  Either<OperationFailure, CountEntity> decrement(int number);
  Either<OperationFailure, CountEntity> multiplyWithTwo(int number);
}
