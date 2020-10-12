import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hot_news/constants.dart';
import 'package:hot_news/source/data/source.dart';
import 'package:hot_news/source/presentation/bloc/source_bloc.dart';
import 'package:hot_news/source/presentation/bloc/source_bloc_state.dart';
import 'package:hot_news/source/presentation/source_item.dart';

import 'bloc/source_bloc_event.dart';

class SourceScreen extends StatefulWidget {
  @override
  _SourceScreenState createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot News'),
        backgroundColor: toolbarColor,
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => SourceBloc()..add(SourceRequestListEvent()),
          child: BlocBuilder<SourceBloc, SourceState>(
            builder: (context, state) {
              if (state is SourceListSuccessState) {
                return displayItems(state.sources);
              }
              if (state is SourceListFailureState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return Center(
                  child: SpinKitThreeBounce(
                    color: toolbarColor,
                    size: 30,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget displayItems(List<Source> sources) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: sources.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: SourceItem(
            sources[index],
          ),
          onTap: () => {
            context.bloc<SourceBloc>().add(SourceChosenEvent(sources[index])),
          },
        );
      },
    );
  }
}
