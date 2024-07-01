A simple Flutter application to fetch and display weather information with support for light and dark themes. Users can search for the weather in a specific location and view current weather conditions.

### Features

- Fetch weather data by user's current location.
- Search weather by city name.
- Light and dark theme support.
- Persistent theme preference using `SharedPreferences`.

### Screenshots

![Light Theme](https://via.placeholder.com/150 "Light Theme") ![Dark Theme](https://via.placeholder.com/150 "Dark Theme")

### Installation

1. **Clone the repository:**

   ```bash
   https://github.com/HGSChandeepa/Weather-API-with-Persistent-Theme
   cd Weather-API-with-Persistent-Theme
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Add your API key:**

   - Create a `.env` file in the root directory of the project.
   - Add your OpenWeather API key to the `.env` file:

     ```env
     OPEN_WEATHER_API_KEY=your_api_key_here
     ```

4. **Run the app:**

   ```bash
   flutter run
   ```

### Project Structure

```
lib/
|-- models/
|   |-- weather_model.dart
|-- pages/
|   |-- home_page.dart
|   |-- search_weather_page.dart
|-- providers/
|   |-- theme_provider.dart
|-- services/
|   |-- weather_service.dart
|-- utils/
|   |-- themes.dart
|   |-- theme_persistence.dart
|-- widgets/
|   |-- weather_display.dart
|-- main.dart
```

### Usage

1. **Home Page:**
   - Displays weather information for the user's current location.
   - Includes a button to navigate to the search weather page.

2. **Search Weather Page:**
   - Allows users to search for weather information by city name.
   - Displays weather information for the specified city.

3. **Theme Toggle:**
   - The theme can be toggled between light and dark modes using the icon in the app bar.
   - The selected theme preference is persisted across app sessions.

### Dependencies

- `provider`
- `shared_preferences`
- `http`
- `flutter_dotenv`

### Credits

- **API:** [OpenWeather](https://openweathermap.org/api)

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

