import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget childView;

  const HomeCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.childView});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
      child: Card(
        // color: Theme.of(context).canvasColor,
        shadowColor: Theme.of(context).primaryColor,
        elevation: 8.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: 240,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/stannagocapp.appspot.com/o/Images%2FCapitalCampaignTileImage.jpg?alt=media&token=56f1e516-e026-46df-b7f9-9e454b142b66"),
            fit: BoxFit.fitWidth,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Spacer(),
              Container(
                color: Theme.of(context).cardColor.withOpacity(0.85),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          child: FilledButton(
                              onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => childView))
                                  },
                              child: const Text("View More", style: TextStyle(fontSize: 16),)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
