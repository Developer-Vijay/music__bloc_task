import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class LoadDetailData extends DetailEvent {}

class LoadDetailApiData extends DetailEvent {
  List<Object> get props => [];
}
