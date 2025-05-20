import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jego_test/widgets/date_time_picker.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({super.key});

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  String rentalDuration = '1 Day';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      initialDate: selectedDate,
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) setState(() => selectedTime = picked);
  }

  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFB8B8B8), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFB8B8B8), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedTime = selectedTime.format(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Rental Duration",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: rentalDuration,
          decoration: customInputDecoration("Select rental duration"),
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          items: ['1 Day', '2 Days', '3 Days'].map((value) {
            return DropdownMenuItem(value: value, child: Text(value));
          }).toList(),
          onChanged: (newValue) => setState(() => rentalDuration = newValue!),
        ),
        const SizedBox(height: 16),

        const Text(
          "Rental Starts",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        DateTimePickerField(
          dateText: formatDate(selectedDate),
          timeText: formattedTime,
          onDateTap: _selectDate,
          onTimeTap: _selectTime,
        ),
        const SizedBox(height: 16),

        const Text(
          "Destination",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: destinationController,
          maxLines: 1,
          decoration: customInputDecoration(
              "Input a destination you are driving to..."),
        ),
        const SizedBox(height: 16),

        const Text(
          "Comment",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: commentController,
          maxLines: 4,
          decoration:
              customInputDecoration("Drop a comment for the merchant..."),
        ),
        const SizedBox(height: 34),

        Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(
        CupertinoIcons.mail,
        color: Color(0xFF083D56),
      ),
      label: const Text(
        "Chat with Merchant",
        style: TextStyle(
          color: Color(0xFF083D56),
          fontSize: 14,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF083D56)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          
        ),
          padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
    const SizedBox(height: 20),
    ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, '/vehicle-list');
      },
      label: const Text(
        "Continue",
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF083D56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
  ],
),

        SizedBox(height: 70,)
      ],
    );
  }
}
