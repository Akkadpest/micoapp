import 'package:flutter/material.dart';

class OneTimeGeneralPestPage extends StatelessWidget {
  const OneTimeGeneralPestPage({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF6FAE57);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "One Time Service",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner (simple - no warranty)s
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/mosquito_banner.png", // change if you want another image
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(height: 170, color: green),
                    ),
                    Positioned.fill(child: Container(color: Colors.black.withOpacity(0.20))),
                    const Positioned(
                      left: 16,
                      top: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GENERAL PEST CONTROL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "One-time treatment\nNo warranty included",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Cards
              _OneTimeCard(
                title: "Apartment",
                subtitle: "General Pest - Apartment",
                startingFrom: 99,
                thumb: "assets/images/apt_thumb.png",
                buttonText: "Select",
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Apartment selected (one-time)")),
                  );
                },
              ),

              const SizedBox(height: 12),

              _OneTimeCard(
                title: "Villa",
                subtitle: "General Pest - Villa",
                startingFrom: 199,
                thumb: "assets/images/villa_thumb.png",
                buttonText: "Select",
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Villa selected (one-time)")),
                  );
                },
              ),

              const SizedBox(height: 16),

              const Center(
                child: Text(
                  "No warranty for one-time service",
                  style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OneTimeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int startingFrom;
  final String thumb;
  final String buttonText;
  final VoidCallback onTap;

  const _OneTimeCard({
    required this.title,
    required this.subtitle,
    required this.startingFrom,
    required this.thumb,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF6FAE57);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 14, offset: const Offset(0, 8)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 70,
              height: 70,
              color: const Color(0xFFF1F3F4),
              child: Image.asset(
                thumb,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.image_outlined, color: Colors.black38),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black54)),
              const SizedBox(height: 10),
              Text("Starting from AED $startingFrom", style: const TextStyle(fontWeight: FontWeight.w900)),
            ]),
          ),
          OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              foregroundColor: green,
              side: const BorderSide(color: green),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
}
