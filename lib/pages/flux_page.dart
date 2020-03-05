import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rss_reader_app/state/app_state.dart';
import 'package:rss_reader_app/widgets/flux_list.dart';

class FluxPage extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    //
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Les flux Rss',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: FluxList(state.listFlux),
      ),
    ));
  }
}
