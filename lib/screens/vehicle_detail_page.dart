import 'package:flutter/material.dart';
import 'package:jego_test/widgets/feature_icon.dart';
import '../models/vehicle.dart';

class VehicleDetailPage extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailPage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.asset(
                  vehicle.imageUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          vehicle.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        vehicle.price,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF05A099),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          vehicle.address,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF635F5F),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    vehicle.description ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4B4B4B),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text("Vehicle Features", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        FeatureIcon(
                          iconPath: 'assets/icons/usb1.png',
                          label: '12V USB Port',
                        ),
                    
                        FeatureIcon(
                          iconPath: 'assets/icons/car.png',
                          label: 'Bluetooth',
                        ),
                        FeatureIcon(
                          iconPath: 'assets/icons/ac.png',
                          label: 'Fast Charge',
                        ),
                        FeatureIcon(
                          iconPath: 'assets/icons/car.png',
                          label: 'Fast Charge',
                        ),
                        FeatureIcon(
                          iconPath: 'assets/icons/usb5.png',
                          label: 'Fast Charge',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
