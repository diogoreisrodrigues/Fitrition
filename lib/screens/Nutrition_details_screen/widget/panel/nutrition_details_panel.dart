import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/panel/exercises_list.dart';
import 'package:fitness_flutter/screens/Nutrition_details_screen/widget/panel/recipes_list.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/panel/workout_tag.dart';
import 'package:flutter/material.dart';

class NutritionDetailsPanel extends StatelessWidget {
  final WorkoutData recipe;

  NutritionDetailsPanel({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return _createPanelData();
  }

  Widget _createPanelData() {
    return Column(
      children: [
        const SizedBox(height: 15),
        _createRectangle(),
        const SizedBox(height: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createHeader(),
              const SizedBox(height: 20),
              //_createWorkoutData(),
              SizedBox(height: 20),
              _createExerciesList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createRectangle() {
    return Image(image: AssetImage(PathConstants.rectangle));
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        recipe.title + "  " + TextConstants.recipe,
        style: TextStyle(
          //dark
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createWorkoutData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          WorkoutTag(
            icon: PathConstants.timeTracker,
            content: "${recipe.minutes}:00",
          ),
          const SizedBox(width: 15),
          WorkoutTag(
            icon: PathConstants.exerciseTracker,
            content: "${recipe.exercices} ${TextConstants.exercisesLowercase}",
          ),
        ],
      ),
    );
  }

  Widget _createExerciesList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RecipesList(receitas: recipe.exerciseDataList, recipe: recipe),
      ),
    );
  }
}
