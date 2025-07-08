import 'package:com_russia_game_flutter_ui/core/utils/sdp.dart';
import 'package:com_russia_game_flutter_ui/feature/game/parking/presentation/pages/parking_screen.dart';
import 'package:com_russia_game_flutter_ui/feature/launcher/referral_program/presentation/pages/referral_program_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'title': 'Реферальная программа', 'screen': const ReferralProgramScreen()},
      {'title': 'Парковка', 'screen': const ParkingScreen()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Список веток (тасок)')),
      body: Center(
        child: SizedBox(
          width: sdp(context, 2000),
          child: ListView(
            children: items.reversed.map((item) {
              return _buildCard(context, item['title'], item['screen']);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget screen) {
    return Card(
      child: ListTile(
        title: Text(title.toUpperCase()),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
      ),
    );
  }
}
