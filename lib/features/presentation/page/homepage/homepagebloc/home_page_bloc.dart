import 'package:bloc/bloc.dart';
import 'package:cleanarchitecture/core/error/failure.dart';
import 'package:cleanarchitecture/features/data/datasource/operation_datasource.dart';
import 'package:cleanarchitecture/features/data/repositoryimpl/operation_repositoryimpl.dart';
import 'package:cleanarchitecture/features/domain/entity/count_entity.dart';
import 'package:cleanarchitecture/features/domain/repository/operation_repository.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    OperationRepository operationRepository = OperationRepositoryImpl(
      operationDataSource: OperationDataSourceImpl(),
    );
    on<IncrementEvent>((event, emit) {
      operationRepository.increment(event.number).fold(
            (l) => emit(HomePageFailureState(operationFailure: l)),
            (r) => emit(
              HomePageCountState(countEntity: r),
            ),
          );
    });
    on<DecrementEvent>((event, emit) {
      operationRepository.decrement(event.number).fold(
            (l) => emit(HomePageFailureState(operationFailure: l)),
            (r) => emit(
              HomePageCountState(countEntity: r),
            ),
          );
    });
    on<MultiplyWithTwoEvent>((event, emit) {
      operationRepository.multiplyWithTwo(event.number).fold(
            (l) => emit(HomePageFailureState(operationFailure: l)),
            (r) => emit(
              HomePageCountState(countEntity: r),
            ),
          );
    });
  }
}
