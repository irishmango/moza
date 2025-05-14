import 'package:flutter/material.dart';
import 'package:moza/shared/open_card_button.dart';

class LearnPathCard extends StatelessWidget {
  const LearnPathCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      // Container Style 
      width: double.infinity,
      height: 194,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
            boxShadow: [BoxShadow(
              color: Colors.black.withAlpha(50),
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
            )
            ],
        gradient: const LinearGradient(
          colors: [Color(0xFF58B270), Color.fromARGB(255, 126, 213, 149)],
        ),
      ),

      // Main padding in the card
      child: Padding(
        padding: const EdgeInsets.all(16.0), 
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              children: [
                const Text(
                  "My Learn Path",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                // Button
                OpenCardButton(color: Color(0xFF317C43), onPressed: () {},)
              ],
            ),

              
            const Spacer(), 

            // Inner Info Row
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF44AE61),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Text Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Continue with...",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                    
                        Text(
                          "Harmony & Chord Theory",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Placeholder icon(ask a Tut for help with progress icon?)
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Colors.orangeAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

