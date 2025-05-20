import 'package:flutter/material.dart';
import '../widgets/vehicle_slider.dart';
import '../widgets/vehicle_form.dart';

class VehiclePreviewPage extends StatelessWidget {
  const VehiclePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VehicleSlider(),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const SizedBox(height: 10),
                  const Text("JeGO SWFT", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF233B43))),
                  const SizedBox(height: 2),
                  const Text("₦8,000/hr", style: TextStyle(fontSize:16,color:Color(0xFF05909C))),
                  const SizedBox(height: 2),
                  const Text("3 hours minimum rental duration", style: TextStyle(fontSize: 10,color: Color(0xFFA9A9A9)),),
                const SizedBox(height: 10),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/image/avatar.png'),
                        radius: 30,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Kelio Merchant Service", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black)),
                          Text("11 Jibola Street, Oshodi • (8km away)", style: TextStyle(color: Color(0xFF635F5F), fontSize: 12,)),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    "Cruise with zero emissions! This rental is an electric vehicle (EV), offering a smooth, quiet ride and a chance to minimize your environmental impact. Find charging stations easily with our in-car navigation system and enjoy the savings on gas. Ask us about nearby charging options!",
                    style: TextStyle(fontSize: 14,color: Color(0xFF1E1F1F)),
                  ),

                  const SizedBox(height: 60),
                  const VehicleForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
