# Weather App 🌤️

A simple Flutter weather application that provides current weather information for any city worldwide.

## Features

- **Real-time Weather Data**: Get current weather conditions for any city
- **Dynamic UI**: App theme changes based on weather conditions (sunny, cloudy, rainy, etc.)
- **Beautiful Gradients**: Visually appealing gradient backgrounds that match the weather
- **Weather Details**: Display temperature, min/max temps, weather condition, and weather icon
- **Search Functionality**: Easy-to-use search interface to find weather for any city
- **Responsive Design**: Clean and intuitive user interface

## Built With

- **Flutter** - Cross-platform mobile development framework
- **BLoC/Cubit** - State management pattern for reactive programming
- **Dio** - HTTP client for API requests
- **WeatherAPI** - Weather data provider


## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Get your free API key from [WeatherAPI](https://www.weatherapi.com/)
4. Replace the API key in `weather_service.dart`
5. Run the app using `flutter run`

## Weather Conditions Supported

The app dynamically changes its theme based on various weather conditions including:
- Sunny/Clear
- Cloudy/Overcast
- Rainy conditions
- Snowy conditions
- Foggy/Misty
- Thunderstorms
- And more...
