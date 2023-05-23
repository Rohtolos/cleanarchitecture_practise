import 'package:cleanarchitecture/features/presentation/page/homepage/homepagebloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageBloc homePageBloc = BlocProvider.of<HomePageBloc>(context);
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc managed app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 300,
              ),
              (state is HomePageFailureState)
                  ? const Text('An error occured')
                  : const Text(
                      'You have pushed the button this many times:',
                    ),
              Text(
                (state is HomePageInitial)
                    ? state.countEntity.count.toString()
                    : (state is HomePageCountState)
                        ? state.countEntity.count.toString()
                        : (state is HomePageFailureState)
                            ? state.operationFailure.errorMessage
                            : "Haven't found state",
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (state is HomePageInitial ||
                          state is HomePageCountState) {
                        homePageBloc.add(
                          IncrementEvent(
                              number: (state is HomePageInitial)
                                  ? state.countEntity.count
                                  : (state as HomePageCountState)
                                      .countEntity
                                      .count),
                        );
                      }
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (state is HomePageInitial ||
                          state is HomePageCountState) {
                        homePageBloc.add(
                          DecrementEvent(
                              number: (state is HomePageInitial)
                                  ? state.countEntity.count
                                  : (state as HomePageCountState)
                                      .countEntity
                                      .count),
                        );
                      }
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (state is HomePageInitial ||
                          state is HomePageCountState) {
                        homePageBloc.add(
                          MultiplyWithTwoEvent(
                              number: (state is HomePageInitial)
                                  ? state.countEntity.count
                                  : (state as HomePageCountState)
                                      .countEntity
                                      .count),
                        );
                      }
                    },
                    tooltip: 'Multiply by two',
                    child: const Icon(Icons.multiple_stop),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
    });
  }
}
