// notification_page.dart
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NotificationCard(
              title: 'Accident on Main Street',
              description:
                  'There has been an accident on Main Street. Please avoid the area.',
            ),
            SizedBox(height: 16.0),
            NotificationCard(
              title: 'Community Meeting Tomorrow',
              description:
                  'Reminder: Community meeting is scheduled for tomorrow at 7 PM in the community hall.',
            ),
            SizedBox(height: 16.0),
            NotificationCard(
              title: 'Road Closure Notice',
              description:
                  'A portion of the road will be closed for maintenance on Monday. Plan your route accordingly.',
            ),
            NotificationCard(
              title: 'Upcoming Event: Fun Fair',
              description:
                  'Get ready for a fun-filled day! The community Fun Fair is scheduled for this weekend. Don\'t miss out!',
            ),
            SizedBox(height: 16.0),
            NotificationCard(
              title: 'Construction Noise Alert',
              description:
                  'Residents are advised that construction work will be carried out in the neighborhood this week. Expect noise during daytime hours.',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;

  const NotificationCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
