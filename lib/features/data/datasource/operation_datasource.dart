import 'package:cleanarchitecture/core/error/exception.dart';
import 'package:cleanarchitecture/features/data/model/count_model.dart';

abstract class OperationDataSource {
  CountModel calculateIncrement(int number);
  CountModel calculateDecrement(int number);
  CountModel calculateMultiply(int number);
}

class OperationDataSourceImpl extends OperationDataSource {
  @override
  CountModel calculateIncrement(int number) {
    int a = number + 1;
    if (a > 300) {
      throw OperationException();
    } else {
      return CountModel(count: a, b: 'b');
    }
  }

  @override
  CountModel calculateDecrement(int number) {
    int a = number - 1;
    if (a > 300) {
      throw OperationException();
    } else {
      return CountModel(count: a, b: 'b');
    }
  }

  @override
  CountModel calculateMultiply(int number) {
    int a = number * 2;
    if (a > 300) {
      throw OperationException();
    } else {
      return CountModel(count: a, b: 'b');
    }
  }
}
