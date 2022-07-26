import 'package:equatable/equatable.dart';
import 'package:music_app_task/models/api_a_model.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();
}

class TrendingLoadingInitial extends TrendingState {
  @override
  List<Object> get props => [];
}

class TrendingLoadedState extends TrendingState {
  final ApiAModel apiAModel;
  final apiData;
  TrendingLoadedState(this.apiAModel, this.apiData);

  @override
  //TODO: Implement props

  List<Object?> get props => [apiAModel, apiData];
}

class TrendingError extends TrendingState {
  final String? message;
  const TrendingError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
