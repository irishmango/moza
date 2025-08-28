import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class LessonScreen extends StatelessWidget {
	const LessonScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFFF5F5F5),
			appBar: AppBar(
				backgroundColor: AppColors.appOrange,
				elevation: 0,
				iconTheme: const IconThemeData(color: Colors.white),
				title: const Text(
					'Interval Classes',
					style: TextStyle(
						color: Colors.white,
						fontWeight: FontWeight.bold,
						fontSize: 20,
					),
				),
			),
			body: Column(
					children: [						
						Expanded(
							child: SingleChildScrollView(
								padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										// Intro text
										Text(
											"In music, intervals are the basic building blocks that define the distance between two notes. Understanding intervals is essential for reading music, composing, and analyzing melodies.",
											style: TextStyle(fontSize: 15, color: Colors.grey[900]),
										),
										const SizedBox(height: 16),
										// Section header
															Container(
																color: AppColors.appOrange.withAlpha(38),
																padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
																child: Text(
																	'Interval Classes',
																	style: TextStyle(
																		color: AppColors.appOrange,
																		fontWeight: FontWeight.bold,
																		fontSize: 16,
																	),
																),
															),
										const SizedBox(height: 8),
										Text(
											"On a staff, intervals are counted from the lower note up, including both notes. For example, from C to E is a third (C-D-E). Intervals are named by their number (second, third, fourth, etc.) and their quality (major, minor, perfect, etc.).",
											style: TextStyle(fontSize: 15, color: Colors.black),
										),
										const SizedBox(height: 8),
										Text(
											"Perfect intervals include unison, fourth, fifth, and octave. Major and minor intervals include seconds, thirds, sixths, and sevenths. The quality of an interval is determined by the number of half steps between the notes.",
											style: TextStyle(fontSize: 15, color: Colors.black),
										),
										const SizedBox(height: 8),
										Text(
											"Augmented and diminished intervals alter the basic quality by a half step. The same interval can look different depending on the key or accidentals.",
											style: TextStyle(fontSize: 15, color: Colors.black),
										),
										const SizedBox(height: 8),
										Text(
											"\"Simple\" intervals are those within the span of an octave. The number and quality together fully describe the interval.",
											style: TextStyle(fontSize: 15, color: Colors.black),
										),
										const SizedBox(height: 16),
										// Special cases
															Container(
																color: AppColors.appOrange.withOpacity(0.15),
																padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
																child: Text(
																	'Special Cases',
																	style: TextStyle(
																		color: AppColors.appOrange,
																		fontWeight: FontWeight.bold,
																		fontSize: 16,
																	),
																),
															),
										const SizedBox(height: 8),
										Text(
											"Some intervals are enharmonic, meaning they sound the same but are written differently (e.g., C# to E is a major third, but Db to F is also a major third).",
											style: TextStyle(fontSize: 15, color: Colors.black),
										),
										const SizedBox(height: 8),
										// Table image placeholder
										Container(
											margin: const EdgeInsets.symmetric(vertical: 8),
											height: 60,
											width: double.infinity,
											color: Colors.grey[300],
											child: const Center(child: Text('Table: Interval Qualities', style: TextStyle(color: Colors.black54))),
										),
										const SizedBox(height: 16),
										// Recap section
															Container(
																color: AppColors.appOrange.withOpacity(0.15),
																padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
																child: Text(
																	'Recap - Simple Intervals (Basic Forms)',
																	style: TextStyle(
																		color: AppColors.appOrange,
																		fontWeight: FontWeight.bold,
																		fontSize: 16,
																	),
																),
															),
										const SizedBox(height: 8),
										Text(
											"Intervals provide the most basic vocabulary of Western music. Recognizing and understanding them is crucial for musicianship.",
											style: TextStyle(fontSize: 15, color: Colors.black),
										),
										const SizedBox(height: 8),
										Text(
											"The chart below summarizes the names and structures of simple intervals.",
											style: TextStyle(fontSize: 15, color: Colors.black),
										),
										const SizedBox(height: 8),
										// Chart image placeholder
										Container(
											margin: const EdgeInsets.symmetric(vertical: 8),
											height: 120,
											width: double.infinity,
											color: Colors.grey[300],
											child: const Center(child: Text('Chart: Simple Intervals', style: TextStyle(color: Colors.black54))),
										),
									],
								),
							),
						),
					],
				),
		);
	}
}
