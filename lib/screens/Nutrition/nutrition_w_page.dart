import 'package:fitness_flutter/screens/workout_details_screen/page/workout_details_page.dart';
import 'package:fitness_flutter/screens/Nutrition_details_screen/Page/Nutrition_details_page.dart';
import 'package:fitness_flutter/screens/workouts/bloc/workouts_bloc.dart';
import 'package:fitness_flutter/screens/workouts/widget/workout_content.dart';
import 'package:fitness_flutter/screens/Nutrition/widget/nutrition_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NutritionWPage extends StatelessWidget {
  const NutritionWPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContext(context));
  }

  BlocProvider<WorkoutsBloc> _buildContext(BuildContext context) {
    return BlocProvider<WorkoutsBloc>(
      create: (context) => WorkoutsBloc(),
      child: BlocConsumer<WorkoutsBloc, WorkoutsState>(
        buildWhen: (_, currState) => currState is WorkoutsInitial,
        builder: (context, state) {
          return NutritionContent();
        },
        listenWhen: (_, currState) => currState is CardTappedState,
        listener: (context, state) {
          if (state is CardTappedState) {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (_) => NutritionDetaisPage(recipes: state.workout),
              ),
            );
          }
        },
      ),
    );
  }
}
