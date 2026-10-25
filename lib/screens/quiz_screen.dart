import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/quiz_data.dart';
import '../widgets/custom_button.dart';
import '../widgets/option_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedOptionIndex;
  int _score = 0;

  void _answerQuestion() {
    if (_selectedOptionIndex == null) return;

    if (_selectedOptionIndex == sampleQuestions[_currentQuestionIndex].correctAnswerIndex) {
      _score++;
    }

    if (_currentQuestionIndex < sampleQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = null;
      });
    } else {
      // Navigasi ke Halaman Hasil Kuis[cite: 1]
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            totalQuestions: sampleQuestions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = sampleQuestions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / sampleQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soal ${_currentQuestionIndex + 1}/${sampleQuestions.length}',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Progress Bar Dinamis
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade200,
                color: Colors.indigo,
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 24),

              // Pertanyaan (Responsif dengan SingleChildScrollView)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentQuestion.questionText,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Pilihan Jawaban
                      ...List.generate(
                        currentQuestion.options.length,
                            (index) => OptionCard(
                          optionText: currentQuestion.options[index],
                          isSelected: _selectedOptionIndex == index,
                          onTap: () {
                            setState(() {
                              _selectedOptionIndex = index;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Tombol Lanjut / Selesai
              CustomButton(
                text: _currentQuestionIndex == sampleQuestions.length - 1
                    ? 'Selesai'
                    : 'Selanjutnya',
                icon: Icons.navigate_next_rounded,
                onPressed: _selectedOptionIndex != null ? _answerQuestion : () {},
                color: _selectedOptionIndex != null ? Colors.indigo : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}