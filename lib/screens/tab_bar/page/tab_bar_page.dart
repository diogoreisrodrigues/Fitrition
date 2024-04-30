import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/screens/home/page/home_page.dart';
import 'package:fitness_flutter/screens/Nutrition/Nutrition_page.dart';
import 'package:fitness_flutter/screens/Nutrition/nutrition_w_page.dart';
import 'package:fitness_flutter/screens/settings/settings_screen.dart';
import 'package:fitness_flutter/screens/tab_bar/bloc/tab_bar_bloc.dart';
import 'package:fitness_flutter/screens/workouts/page/workouts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarBloc>(
      create: (BuildContext context) => TabBarBloc(),
      child: BlocConsumer<TabBarBloc, TabBarState>(
        listener: (context, state) {},
        buildWhen: (_, currState) =>
            currState is TabBarInitial || currState is TabBarItemSelectedState,
        builder: (context, state) {
          final bloc = BlocProvider.of<TabBarBloc>(context);
          return Scaffold(
            body: _createBody(context, bloc.currentIndex),
            bottomNavigationBar: _createdBottomTabBar(context),
          );
        },
      ),
    );
  }

  Widget _createdBottomTabBar(BuildContext context) {
    final bloc = BlocProvider.of<TabBarBloc>(context);
    return Transform.translate(
      offset: Offset(0, -MediaQuery.of(context).size.height * 0.01), // Move 10% para cima
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03), // Adiciona padding nas laterais
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50), // Arredonda os cantos
          child: BottomNavigationBar(
            currentIndex: bloc.currentIndex,
            fixedColor: ColorConstants.primaryColor,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(25, 33, 38, 1),
                icon: Image(
                  image: AssetImage(PathConstants.home),
                  color: bloc.currentIndex == 0 ? ColorConstants.primaryColor : null,
                ),
                label: TextConstants.homeIcon,
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(25, 33, 38, 1),
                icon: Image(
                  image: AssetImage(PathConstants.workouts),
                  color: bloc.currentIndex == 1 ? ColorConstants.primaryColor : null,
                ),
                label: TextConstants.workoutsIcon,
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(25, 33, 38, 1),
                icon: Image(
                  image: AssetImage(PathConstants.salad),
                  color: bloc.currentIndex == 2 ? ColorConstants.primaryColor : ColorConstants.white,
                ),
                label: TextConstants.NutritionIcon,
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(25, 33, 38, 1),
                icon: Image(
                  image: AssetImage(PathConstants.settings),
                  color: bloc.currentIndex == 3 ? ColorConstants.primaryColor : null,
                ),
                label: TextConstants.settingsIcon,
              ),
            ],
            onTap: (index) {
              bloc.add(TabBarItemTappedEvent(index: index));
            },
          ),
        ),
      ),
    );
  }

  Widget _createBody(BuildContext context, int index) {
    final children = [
      HomePage(),
      WorkoutsPage(),
      NutritionWPage(),
      SettingsScreen()
      // Scaffold(
      //   body: Center(
      //     child: RawMaterialButton(
      //       fillColor: Colors.red,
      //       child: Text(
      //         TextConstants.signOut,
      //         style: TextStyle(
      //           color: ColorConstants.white,
      //         ),
      //       ),
      //       onPressed: () {
      //         AuthService.signOut();
      //         Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(builder: (_) => SignInPage()),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    ];
    return children[index];
  }
}
