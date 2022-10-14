import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          const Divider(thickness: 2),
          const Text(
            'About Us',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text('Alterra Academy Programs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.height /4,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16,left: 16),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/dashboard.png',
                                width: 50,
                              ),
                              const Text(
                                'Immersive Program',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                             const Text(
                                'Program pelatihan coding bootcamp intensif bagi kamu yang pemula, baik dengan latar belakang lT maupun Non-IT, untuk menjadi seorang Software Engineer profesional dalam waktu 9 Minggu.',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),Card(
                elevation: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16,left: 16),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/dashboard.png',
                                width: 50,
                              ),
                              const Text(
                                'Immersive Program',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                             const Text(
                                'Program pelatihan coding bootcamp intensif bagi kamu yang pemula, baik dengan latar belakang lT maupun Non-IT, untuk menjadi seorang Software Engineer profesional dalam waktu 9 Minggu.',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
