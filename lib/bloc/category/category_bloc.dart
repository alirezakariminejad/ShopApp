import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/category/category_event.dart';
import 'package:flutter_shop_application/bloc/category/category_state.dart';
import 'package:flutter_shop_application/data/repository/category_repository.dart';
import 'package:flutter_shop_application/di/di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICateogoryRepository _repository = locator.get();

  CategoryBloc() : super(CategoryInitialState()) {
    on<CategoryRequestListEvent>(
      (event, emit) async {
        emit(CategoryLodingState());
        var response = await _repository.getRepositories();
        emit(CategoryResponseState(response));
      },
    );
  }
}
