import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Event {
  final String name;
  final String date;
  final String location;
  final String image; // URL or path to the image

  Event({
    required this.name,
    required this.date,
    required this.location,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define tus propios eventos aquí
    List<Event> events = [
      Event(
        name: 'Partido de Fútbol',
        date: '25 de mayo, 2024',
        location: 'Estadio Monumental ',
        image: 'assets/futbol.png',
      ),
      Event(
        name: 'Torneo de Baloncesto lakers vs kings',
        date: '28 de mayo, 2024',
        location: 'Gimnasio Inglaterra',
        image: 'assets/basketball.png',
      ),
      Event(
        name: 'Carrera de Atletismo Secundaria',
        date: '30 de mayo, 2024',
        location: 'Pista de Atletismo tarma-Peru',
        image: 'assets/atletismo.png',
      ),
      Event(
        name: 'Torneo de Tenis',
        date: '2 de junio, 2024',
        location: 'Club de Tenis London',
        image: 'assets/tennis.png',
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Event Card Example'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: EventCard(event: events[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              event.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${event.date}',
            ),
            Text(
              'Location: ${event.location}',
            ),
            SizedBox(height: 10),
            Image.asset(
              event.image,
              fit: BoxFit.cover,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
