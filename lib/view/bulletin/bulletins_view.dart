import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/controller/bulletins_view_controller.dart';
import 'package:st_anna_goc_app/view/bulletin/bulletin_card.dart';

class BulletinsView extends StatefulWidget {
  final String title;

  const BulletinsView({super.key, required this.title});

  @override
  State<BulletinsView> createState() => _BulletinsViewState();
}

class _BulletinsViewState extends State<BulletinsView> {
  late final BulletinViewController _controller = BulletinViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          scrolledUnderElevation: 16,
          // surfaceTintColor: Theme.of(context).primaryColorLight,
          shadowColor: Theme.of(context).primaryColor,
        ),
        body: FutureBuilder(
            future: _controller.fetchBulletins(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center (
                  child: CircularProgressIndicator(),
                );
              } else {
                return RefreshIndicator(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BulletinCard(
                              bulletin: snapshot.data[index]);
                        }
                    ),
                    onRefresh: () async {
                      setState(() {});
                    });
              }
            }
        )
    );
  }
}