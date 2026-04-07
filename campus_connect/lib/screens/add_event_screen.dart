import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../viewmodels/event_viewmodel.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'dart:io';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  File? _image;
  Position? _currentLocation;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventVm = Provider.of<EventViewModel>(context, listen: false);
    final userId =
        Provider.of<AuthViewModel>(context, listen: false).getCurrentUserId() ??
        '';

    return Scaffold(
      appBar: AppBar(title: Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Date: ${_formatDate(_selectedDate)}'),
              trailing: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) setState(() => _selectedDate = picked);
                },
              ),
              tileColor: Colors.grey[100],
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                _image == null ? 'No image selected' : 'Image selected',
              ),
              trailing: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () async {
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile != null) {
                    setState(() => _image = File(pickedFile.path));
                  }
                },
              ),
              tileColor: Colors.grey[100],
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                _currentLocation == null
                    ? 'No location'
                    : 'Location: ${_currentLocation!.latitude.toStringAsFixed(4)}, ${_currentLocation!.longitude.toStringAsFixed(4)}',
              ),
              trailing: IconButton(
                icon: Icon(Icons.my_location),
                onPressed: () async {
                  LocationPermission permission =
                      await Geolocator.checkPermission();
                  if (permission == LocationPermission.denied) {
                    permission = await Geolocator.requestPermission();
                  }
                  if (permission == LocationPermission.always ||
                      permission == LocationPermission.whileInUse) {
                    final position = await Geolocator.getCurrentPosition();
                    setState(() => _currentLocation = position);
                  }
                },
              ),
              tileColor: Colors.grey[100],
            ),
            SizedBox(height: 20),
            if (_isSubmitting)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () async {
                  if (_titleController.text.isEmpty ||
                      _descriptionController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields')),
                    );
                    return;
                  }
                  setState(() => _isSubmitting = true);
                  final newEvent = Event(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                    date: _selectedDate,
                    imageUrl: _image?.path ?? '',
                    latitude: _currentLocation?.latitude,
                    longitude: _currentLocation?.longitude,
                    createdBy: userId,
                  );
                  await eventVm.addEvent(newEvent);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Event'),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';
}
