import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/data_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/Nutrition/widget/nutrition_card.dart';
import 'package:flutter/material.dart';

class NutritionContent extends StatelessWidget {
  NutritionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.homeBackgroundColor,
      height: double.infinity,
      width: double.infinity,
      child: _createHomeBody(context),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Nutrition',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: DataConstants.recipes
                  .map(
                    (e) => _createWorkoutCard(e),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createWorkoutCard(WorkoutData workoutData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: WorkoutCard(recipes: workoutData),
    );
  }
}
