import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/home/home_event.dart';
import 'package:flutter_shop_application/bloc/home/home_state.dart';
import 'package:flutter_shop_application/data/repository/banner_repository.dart';
import 'package:flutter_shop_application/data/repository/category_repository.dart';
import 'package:flutter_shop_application/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICateogoryRepository _categoryRepository = locator.get();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeGetInitalizedDataEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        var bannerList = await _bannerRepository.getBanners();
        var categoryList = await _categoryRepository.getRepositories();
        emit(HomeRequestSuccessState(bannerList, categoryList));
      },
    );
  }
}
