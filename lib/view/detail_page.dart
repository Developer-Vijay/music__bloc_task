import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Detail Page"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    data.trackName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Artist",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    data.artistName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Album",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    data.albumName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Explicit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    data.explicit == 0
                        ? false.toString()
                        : true.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Rating",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    data.trackRating.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Has Lryics",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    data.hasLyrics == 0
                        ? false.toString()
                        : true.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
