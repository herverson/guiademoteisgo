import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tab_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: Colors.red,
      leading: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SizedBox(
                  width: screenWidth * 0.6,
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      indicatorColor: Colors.transparent,
                      indicatorWeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      onTap: (index) {
                        context.read<TabStateCubit>().toggleTab(index);
                      },
                      tabs: [
                        Tab(
                          text: "ir agora",
                          icon: Icon(
                            Icons.flash_on_sharp,
                            color: Colors.white,
                          ),
                        ),
                        Tab(
                          text: "ir outro dia",
                          icon: Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search, color: Colors.white),
        ),
      ],
    );
  }
}
