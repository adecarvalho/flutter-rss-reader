import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rss_reader_app/models/flux.dart';
import 'package:rss_reader_app/state/app_state.dart';

class FluxCard extends StatelessWidget {
  final Flux flux;

  FluxCard({this.flux});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppState>(context, listen: false);

    //
    void onActionHandler(String zeid) {
      print("flux with id= $zeid");
      store.changeFlux(zeid);
      Navigator.of(context).pop();
    }

    //
    return Card(
      color: Colors.grey[200],
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //
            Text(
              "${flux.source}",
              style: TextStyle(fontSize: 20),
            ),
            //
            Text(
              '${flux.url}',
            ),
            //
            RaisedButton(
              onPressed: () {
                onActionHandler(flux.id);
              },
              color: Colors.white,
              child: Text('Ouvrir'),
            ),
            //
          ],
        ),
      ),
    );
  }
}
