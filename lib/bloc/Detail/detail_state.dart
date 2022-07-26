import 'package:equatable/equatable.dart';
import 'package:music_app_task/models/detail_api_model.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailLoading extends DetailState {}

class DetailsLoaded extends DetailState {
  final DetialApiModel detialApiModel;
  DetailsLoaded(this.detialApiModel);

  @override
  List<Object> get props => [detialApiModel];
}
