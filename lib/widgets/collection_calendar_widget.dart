import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


import '../utils/util.dart';

class CollectionCalendar extends StatefulWidget {
  @override
  _CollectionCalendarState createState() => _CollectionCalendarState();
}

class _CollectionCalendarState extends State<CollectionCalendar> {
  late final ValueNotifier<List<String>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<String> _getEventsForDay(DateTime day) {
    // Remplacez cet exemple par votre logique pour charger les événements du jour
    // Retournez une liste d'événements (chaque événement est une chaîne ici)
    return _getEvents().where((event) => isSameDay(day, event)).map((e) => _formatEventTime(e)).toList();
  }

  List<String> _getEventsForRange(DateTime start, DateTime end) {
    // Remplacez cet exemple par votre logique pour charger les événements dans la plage spécifiée
    return _getEvents().where((event) => !event.isBefore(start) && !event.isAfter(end)).map((e) => _formatEventTime(e)).toList();
  }

  List<DateTime> _getEvents() {
    // Liste des dates de collecte prévues
    return [
      DateTime(2023, 12, 21, 10, 0),
      DateTime(2023, 12, 24, 12, 0),
      DateTime(2023, 12, 29, 15, 0),
    ];
  }

  String _formatEventTime(DateTime eventTime) {
    // Formattez l'heure de l'événement comme une chaîne
    return DateFormat('HH:mm').format(eventTime);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (_selectedDay != selectedDay) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important de nettoyer ces valeurs
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` ou `end` pourrait être nul
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendrier de Collecte'),
      ),
      body: Column(
        children: [
          TableCalendar<String>(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => _selectedDay != null && isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Utilisez `CalendarStyle` pour personnaliser l'interface utilisateur
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
