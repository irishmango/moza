import 'package:flutter/material.dart';
import 'package:moza/src/shared/open_card_button.dart';
import 'package:moza/theme.dart';

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

                 
                  Container(
                    width: 50,  
                    height: 50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 50, 
                          height: 50,
                          child: CircularProgressIndicator(
                            strokeCap: StrokeCap.round,
                            value: 0.6,
                            strokeWidth: 5, 
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.appOrange),
                          ),
                        ),
                        Center(
                          child: Text(
                            "60%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
