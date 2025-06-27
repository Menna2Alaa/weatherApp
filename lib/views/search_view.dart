import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        String? weatherCondition;
        if (state is WeatherDataLoaded) {
          weatherCondition = state.weatherModel.weatherCondition;
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: getThemeColor(weatherCondition),
            title: const Text(
              'Search a city',
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onSubmitted: (value) async {
                  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                    context,
                  );
                  getWeatherCubit.getWeather(cityName: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  labelText: ('Search'),
                  hintText: 'Enter city name',
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
