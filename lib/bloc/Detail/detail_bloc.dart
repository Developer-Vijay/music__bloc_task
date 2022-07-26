import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_task/bloc/Detail/detail_event.dart';
import 'package:music_app_task/bloc/Detail/detail_state.dart';
import 'package:music_app_task/models/detail_api_model.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailApiAService detailApiAService;
  final tokenId;
  DetailBloc(this.detailApiAService, this.tokenId)
      : super(DetailLoading()) {
    on<LoadDetailApiData>(
      (event, emit) async {
        final activity = await detailApiAService.getApi(tokenId);
      },
    );
  }
}

// void _onLoadDetailApiData(
//     LoadDetailApiData event, Emitter<DetailState> emit) {
//       final activity=await detail
//     }
