import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_task/bloc/trending_bloc.dart';
import 'package:music_app_task/bloc/trending_event.dart';
import 'package:music_app_task/bloc/trending_state.dart';
import 'package:music_app_task/models/api_a_model.dart';
import 'package:music_app_task/view/detail_page.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrendingBloc(
              RepositoryProvider.of<ApiAService>(context),
            )..add(LoadApiEvent()),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Trending"),
            ),
            body: BlocBuilder<TrendingBloc, TrendingState>(
              builder: ((context, state) {
                if (state is TrendingLoadingInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is TrendingLoadedState) {
                  return ListView.builder(
                    itemCount: state
                        .apiAModel.message.body!.trackList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10)),
                          child: ListTile(
                            style: ListTileStyle.list,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(
                                              data: state
                                                  .apiAModel
                                                  .message
                                                  .body!
                                                  .trackList![index]
                                                  .track)));
                            },
                            title: Text(state.apiAModel.message.body!
                                .trackList![index].track!.albumName
                                .toString()),
                            leading:
                                const Icon(Icons.music_note_outlined),
                            subtitle: Text(state
                                .apiAModel
                                .message
                                .body!
                                .trackList![index]
                                .track!
                                .trackName
                                .toString()),
                            trailing: Text(state
                                .apiAModel
                                .message
                                .body!
                                .trackList![index]
                                .track!
                                .artistName
                                .toString()),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              }),
            ),
          ),
        ));
  }
}
