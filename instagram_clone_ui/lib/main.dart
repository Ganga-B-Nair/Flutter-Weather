iimport 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WeatherHome(),
    );
  }
}

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    "Bengaluru",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.cloud, color: Colors.white, size: 80),
                  SizedBox(height: 10),
                  Text(
                    "24°C",
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Cloudy",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // WEATHER DETAILS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                InfoTile(icon: Icons.water_drop, label: "Humidity", value: "68%"),
                InfoTile(icon: Icons.air, label: "Wind", value: "12 km/h"),
                InfoTile(icon: Icons.speed, label: "Pressure", value: "1012 hPa"),
              ],
            ),

            const SizedBox(height: 25),

            // FORECAST
            const Padding(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Next Days",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ForecastCard(day: "Wed", temp: "25°C", icon: Icons.sunny),
                  ForecastCard(day: "Thu", temp: "23°C", icon: Icons.cloud),
                  ForecastCard(day: "Fri", temp: "22°C", icon: Icons.cloudy_snowing),
                  ForecastCard(day: "Sat", temp: "26°C", icon: Icons.sunny),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SMALL INFO WIDGET
class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 5),
        Text(label),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// FORECAST CARD
class ForecastCard extends StatelessWidget {
  final String day;
  final String temp;
  final IconData icon;

  const ForecastCard({
    super.key,
    required this.day,
    required this.temp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
          Icon(icon, color: Colors.orange, size: 40),
          Text(temp),
        ],
      ),
    );
  }
}
