import 'package:flutter/material.dart';

class UIReadPage extends StatelessWidget {
  const UIReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          //SliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
