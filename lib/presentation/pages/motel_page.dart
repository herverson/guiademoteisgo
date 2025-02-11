import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/motel_cubit.dart';
import '../bloc/motel_state.dart';
import '../components/filter_bar.dart';
import '../components/motel_card.dart';
import '../components/suite_card.dart';

class MotelPage extends StatelessWidget {
  const MotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MotelCubit, MotelState>(
      builder: (context, state) {
        if (state is MotelLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MotelLoaded) {
          final moteis = state.moteis;

          if (moteis.isEmpty) {
            return Center(child: Text('Nenhum motel encontrado'));
          }

          return ListView.builder(
            itemCount: moteis.length,
            itemBuilder: (context, index) {
              final motel = moteis[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FilterBar(),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        MotelCard(
                          motel: motel,
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: motel.suites.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SuiteCard(
                          suite: motel.suites[index],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 10,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      enableInfiniteScroll: false,
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is MotelError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Nenhum motel encontrado'));
        }
      },
    );
  }
}
