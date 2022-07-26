import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_task/bloc/trending_event.dart';
import 'package:music_app_task/bloc/trending_state.dart';
import 'package:music_app_task/models/api_a_model.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final ApiAService _apiAService;

  TrendingBloc(this._apiAService) : super(TrendingLoadingInitial()) {
    on<LoadApiEvent>(((event, emit) async {
      final activity = await _apiAService.getApiA();

      emit(TrendingLoadedState(activity, activity.message));

      // if (mList.message.header!.statusCode != 200) {
      //   emit(TrendingError("Failed to fetch"));

      // }
    }));
  }
}
