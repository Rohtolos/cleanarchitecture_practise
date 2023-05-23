import 'package:cleanarchitecture/features/domain/entity/count_entity.dart';
import 'package:cleanarchitecture/features/domain/repository/operation_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class OperationRepositoryImpl extends OperationRepository {
  OperationRepositoryImpl({required super.operationDataSource});

  @override
  Either<OperationFailure, CountEntity> increment(int number) {
    try {
      return right(operationDataSource.calculateIncrement(number));
    } catch (e) {
      return left(OperationFailure(errorMessage: 'Increment error!'));
    }
  }

  @override
  Either<OperationFailure, CountEntity> decrement(int number) {
    try {
      return right(operationDataSource.calculateDecrement(number));
    } catch (e) {
      return left(OperationFailure(errorMessage: 'Decrement error!'));
    }
  }

  @override
  Either<OperationFailure, CountEntity> multiplyWithTwo(int number) {
    try {
      return right(operationDataSource.calculateMultiply(number));
    } catch (e) {
      return left(OperationFailure(errorMessage: 'Multiply error!'));
    }
  }
}
