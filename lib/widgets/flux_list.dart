import 'package:flutter/material.dart';
import 'package:rss_reader_app/models/flux.dart';
import 'package:rss_reader_app/widgets/flux_card.dart';

//
class FluxList extends StatelessWidget {
  final List<Flux> listFlux;

  FluxList(this.listFlux);

  //
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: listFlux.length,
      itemBuilder: (context, index) {
        return FluxCard(
          flux: listFlux[index],
        );
      },
    );
  }
}
