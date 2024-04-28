import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workouts/bloc/workouts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutData recipes;
  WorkoutCard({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WorkoutsBloc>(context);
    return Container(
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.6, 1.0], // Adiciona mais pontos de parada
          colors: [Colors.grey, Colors.white, Colors.white],
        ),
        boxShadow: [BoxShadow(color: ColorConstants.textBlack.withOpacity(0.12), blurRadius: 5.0, spreadRadius: 1.1)],
      ),
      child: Material(
        color: Colors.transparent,
        child: BlocBuilder<WorkoutsBloc, WorkoutsState>(
          buildWhen: (_, currState) => currState is CardTappedState,
          builder: (context, state) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                bloc.add(CardTappedEvent(workout: recipes));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(recipes.image, fit: BoxFit.fill))),
                    SizedBox(width: 60),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15.0), // Defina o valor da margem superior como desejar
                            child: Text(recipes.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          ),
                          const SizedBox(height: 3),
                          Text(recipes.exercices + " " + TextConstants.recipeUppercase,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorConstants.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                          const SizedBox(height: 3),
                          Text(recipes.minutes + " " + TextConstants.minutes,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorConstants.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
