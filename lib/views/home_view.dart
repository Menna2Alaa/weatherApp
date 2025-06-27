import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import 'package:weather_app/main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        String? weatherCondition;
        if (state is WeatherDataLoadedSuccess) {
          weatherCondition = state.weatherModel.weatherCondition;
        }

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  getThemeColor(weatherCondition),
                  getThemeColor(weatherCondition)[300]!,
                  getThemeColor(weatherCondition)[50]!,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // Custom AppBar integrated into the screen
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weather App',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SearchView();
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Main content
                  Expanded(
                    child: BlocBuilder<GetWeatherCubit, WeatherState>(
                      builder: (context, state) {
                        if (state is WeatherDataLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is WeatherDataLoadedSuccess) {
                          return WeatherInfoBody();
                        } else {
                          return Center(
                            child: Text(
                              'Oops there is an error, please try later',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
