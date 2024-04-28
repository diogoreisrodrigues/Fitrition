import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_button.dart';
import 'package:fitness_flutter/screens/start_workout/bloc/start_workout_bloc.dart';
import 'package:fitness_flutter/screens/start_workout/page/start_workout_page.dart';
import 'package:fitness_flutter/screens/start_workout/widget/start_workout_video.dart';
import 'package:fitness_flutter/screens/workout_details_screen/bloc/workoutdetails_bloc.dart' as workout_bloc;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ingredient {
  final String image;
  final String name;
  final String many;

  Ingredient({required this.image, required this.name, required this.many});
}

class StartRecipetContent extends StatelessWidget {
  final ExerciseData exercise;
  final ExerciseData? nextExercise;



  List<Ingredient> ingredients = [
    Ingredient(image: 'assets/icons/home/logoB.png', name: 'milho', many: '2 gr'),
    Ingredient(image: 'assets/icons/home/logoF.png', name: 'azeite', many: '100 ml'),
    Ingredient(image: 'assets/icons/home/logoB.png', name: 'milho', many: '2 gr'),
    Ingredient(image: 'assets/icons/home/logoF.png', name: 'azeite', many: '100 ml'),
  ];

  StartRecipetContent({required this.exercise, required this.nextExercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(25, 33, 38, 1),
      child: SafeArea(
        child: _createDetailedExercise(context),
      ),
    );
  }

  Widget _createDetailedExercise(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createBackButton(context),
          const SizedBox(height: 23),
          _createVideo(context),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(children: [
              _createTitle(),
              const SizedBox(height: 9),
              _createDescription(),
              const SizedBox(height: 9),
              _createIngredients(),
              const SizedBox(height: 30),
              _createPassoApasso(),
              const SizedBox(height: 9),
              _createSteps(),
            ]),
          ),
          //_createTimeTracker(context),
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<StartWorkoutBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: GestureDetector(
        child: BlocBuilder<StartWorkoutBloc, StartWorkoutState>(
          builder: (context, state) {
            return Row(
              children: [
                Image(image: AssetImage(PathConstants.back)),
                const SizedBox(width: 17),
                Text(
                  TextConstants.back,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            );
          },
        ),
        onTap: () {
          bloc.add(BackTappedEvent());
        },
      ),
    );
  }

  Column _createIngredients() {
    int num = ingredients.length;
    String numItens = num.toString() + ' itens';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ingredients',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              numItens,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Container(
          height: 145,
          child: ListView.separated(
              itemCount: ingredients.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 15,),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(ingredients[index].image),
                          )
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      //alignment: Alignment.centerLeft,
                      width: 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ingredients[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize:14
                            ),
                          ),
                          Text(
                            ingredients[index].many,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize:14
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
          ),
        ),
      ],
    );
  }


  Widget _createVideo(BuildContext context) {
    final bloc = BlocProvider.of<StartWorkoutBloc>(context);
    return Container(
      height: 235,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorConstants.white),
      child: StartWorkoutVideo(
        exercise: exercise,
        onPlayTapped: (time) {
          bloc.add(PlayTappedEvent(time: time));
        },
        onPauseTapped: (time) {
          bloc.add(PauseTappedEvent(time: time));
        },
      ),
    );
  }

  Widget _createTitle() {
    return Text(exercise.title, style: TextStyle(fontSize: 24, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold));
  }

  Widget _createDescription() {
    return Text(exercise.description, style: TextStyle(fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.5), fontWeight: FontWeight.w500));
  }

  Widget _createPassoApasso() {
    int num = exercise.steps.length;
    String numItens = num.toString() + ' steps';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Step by Step",
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          numItens,
          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _createSteps() {
    return Column(
      children: [
        for (int i = 0; i < exercise.steps.length; i++) ...[
          Step(number: "${i + 1}", description: exercise.steps[i]),
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  Widget _createTimeTracker(BuildContext context) {
    // final bloc = BlocProvider.of<StartWorkoutBloc>(context);
    return Padding(
        padding: const EdgeInsets.only(top: 0.0), // Adicione a margem que deseja aqui
        child: Container(
          width: double.infinity,
          color: Color.fromRGBO(25, 33, 38, 1),
          child: Column(
            children: [
              nextExercise != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TextConstants.nextExercise,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          nextExercise?.title ?? "",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6.5),
                        Icon(Icons.access_time, size: 20, color: Colors.white),
                        const SizedBox(width: 6.5),
                        Text(
                          '00:${nextExercise!.minutes > 10 ? nextExercise!.minutes : '0${nextExercise!.minutes}'}',
                          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5), fontSize: 15),
                        )
                        // BlocBuilder<StartWorkoutBloc, StartWorkoutState>(
                        //   buildWhen: (_, currState) => currState is PlayTimerState || currState is PauseTimerState,
                        //   builder: (context, state) {
                        //     return StartWorkoutTimer(
                        //       time: bloc.time,
                        //       isPaused: !(state is PlayTimerState),
                        //     );
                        //   },
                        // ),
                      ],
                    )
                  : SizedBox.shrink(),
              const SizedBox(height: 18),
              _createButton(context),
            ],
          ),
        ),
    );
  }

  Widget _createButton(BuildContext context) {
    return FitnessButton(
      title: nextExercise != null ? TextConstants.next : 'Finish',
      onTap: () {
        if (nextExercise != null) {
          List<ExerciseData> exercisesList = BlocProvider.of<workout_bloc.WorkoutDetailsBloc>(context).workout.exerciseDataList;
          int currentExerciseIndex = exercisesList.indexOf(exercise);
          if (currentExerciseIndex < exercisesList.length - 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<workout_bloc.WorkoutDetailsBloc>(context),
                        child: StartWorkoutPage(
                          exercise: exercisesList[currentExerciseIndex + 1],
                          currentExercise: exercisesList[currentExerciseIndex + 1],
                          nextExercise: currentExerciseIndex + 2 < exercisesList.length ? exercisesList[currentExerciseIndex + 2] : null,
                        ),
                      )),
            );
          }
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }
}

class Step extends StatelessWidget {
  final String number;
  final String description;

  Step({required this.number, required this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.primaryColor.withOpacity(0.12),
          ),
          child: Center(child: Text(number, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor))),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.5), // Alterado para branco
            ),
          ),
        ),
      ],
    );
  }
}
