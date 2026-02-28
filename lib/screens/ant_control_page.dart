import 'package:flutter/material.dart';

class AntControlPage extends StatefulWidget {
  const AntControlPage({super.key});

  @override
  State<AntControlPage> createState() => _AntControlPageState();
}

class _AntControlPageState extends State<AntControlPage> {
  final List<_ChipItem> chips = const [
    _ChipItem("Ants", "assets/icons/ant.png"),
    _ChipItem("Mosquitoes", "assets/icons/mosquito.png"),
    _ChipItem("Bed Bugs", "assets/icons/bedbugs.png"),
    _ChipItem("Cockroaches", "assets/icons/cockroach.png"),
  ];

  int selectedChip = 0;

  void _openApartmentPackagesSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _ApartmentPackagesSheet(),
    );
  }

  void _openVillaPackagesSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _VillaPackagesSheet(), // ✅ now real sheet
    );
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF6FAE57);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top title + info
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Pest Control",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline, color: Colors.black54),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Chips row
              SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: chips.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, i) {
                    final active = i == selectedChip;
                    return InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: () => setState(() => selectedChip = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: active ? const Color(0xFFEAF5E4) : Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: active ? green : Colors.black12,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: Image.asset(chips[i].iconAsset, fit: BoxFit.contain),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              chips[i].label,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: active ? const Color(0xFF2E5C22) : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 14),

              // Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/ants_banner.png",
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(height: 170, color: green),
                    ),
                    Positioned.fill(child: Container(color: Colors.black.withOpacity(0.15))),
                    const Positioned(
                      left: 16,
                      top: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ANTS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Targeted Ant Treatment • Safe\n• Warranty Included",
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

              // Apartment card
              _PackageCard(
                title: "Apartment",
                subtitle: "Ant Control - Apartment",
                startingFrom: 199,
                imagePath: "assets/images/apt_thumb.png",
                onView: _openApartmentPackagesSheet,
              ),

              const SizedBox(height: 12),

              // Villa card
              _PackageCard(
                title: "Villa",
                subtitle: "Ant Control - Villa",
                startingFrom: 299,
                imagePath: "assets/images/villa_thumb.png",
                onView: _openVillaPackagesSheet, // ✅ now same sheet style
              ),

              const SizedBox(height: 16),

              const Center(
                child: Text(
                  "Select a service to continue",
                  style: TextStyle(
                    color: Color(0xFF7FA16D),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ======================= UI Widgets ======================= */

class _ChipItem {
  final String label;
  final String iconAsset;
  const _ChipItem(this.label, this.iconAsset);
}

class _PackageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int startingFrom;
  final String imagePath;
  final VoidCallback onView;

  const _PackageCard({
    required this.title,
    required this.subtitle,
    required this.startingFrom,
    required this.imagePath,
    required this.onView,
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
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
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
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_outlined, color: Colors.black38),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54)),
                const SizedBox(height: 10),
                Text(
                  "Starting from AED $startingFrom",
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: onView,
            style: OutlinedButton.styleFrom(
              foregroundColor: green,
              side: const BorderSide(color: green),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "View Packages →",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

/* ======================= BOTTOM SHEETS ======================= */

class _ApartmentPackagesSheet extends StatefulWidget {
  const _ApartmentPackagesSheet();

  @override
  State<_ApartmentPackagesSheet> createState() => _ApartmentPackagesSheetState();
}

class _ApartmentPackagesSheetState extends State<_ApartmentPackagesSheet> {
  final items = const [
    _SheetItem("Studio", 189, "assets/images/apt_thumb.png"),
    _SheetItem("1 Bedroom Apartment", 210, "assets/images/apt_thumb.png"),
    _SheetItem("2 Bedroom Apartment", 262, "assets/images/apt_thumb.png"),
    _SheetItem("3 Bedroom Apartment", 367, "assets/images/apt_thumb.png"),
  ];

  final Set<int> selected = {};

  @override
  Widget build(BuildContext context) {
    return _PackagesSheet(
      title: "Apartment",
      headerIcon: Icons.apartment,
      items: items,
      selected: selected,
      onToggle: (i) {
        setState(() {
          if (selected.contains(i)) {
            selected.remove(i);
          } else {
            selected.add(i);
          }
        });
      },
    );
  }
}

class _VillaPackagesSheet extends StatefulWidget {
  const _VillaPackagesSheet();

  @override
  State<_VillaPackagesSheet> createState() => _VillaPackagesSheetState();
}

class _VillaPackagesSheetState extends State<_VillaPackagesSheet> {
  // ✅ Different pricing for Villa (edit these values as you like)
  final items = const [
    _SheetItem("Villa 2 Bedroom", 499, "assets/images/villa_thumb.png"),
    _SheetItem("Villa 3 Bedroom", 599, "assets/images/villa_thumb.png"),
    _SheetItem("Villa 4 Bedroom", 699, "assets/images/villa_thumb.png"),
    _SheetItem("Villa 5 Bedroom", 799, "assets/images/villa_thumb.png"),
  ];

  final Set<int> selected = {};

  @override
  Widget build(BuildContext context) {
    return _PackagesSheet(
      title: "Villa",
      headerIcon: Icons.home_outlined,
      items: items,
      selected: selected,
      onToggle: (i) {
        setState(() {
          if (selected.contains(i)) {
            selected.remove(i);
          } else {
            selected.add(i);
          }
        });
      },
    );
  }
}

class _PackagesSheet extends StatelessWidget {
  final String title;
  final IconData headerIcon;
  final List<_SheetItem> items;
  final Set<int> selected;
  final void Function(int index) onToggle;

  const _PackagesSheet({
    required this.title,
    required this.headerIcon,
    required this.items,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF6FAE57);

    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Icon(headerIcon, color: green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // List
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, i) {
                    final it = items[i];
                    final isSelected = selected.contains(i);

                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F7F8),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 56,
                              height: 56,
                              color: Colors.white,
                              child: Image.asset(
                                it.image,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.image_outlined, color: Colors.black38),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  it.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "Effective pest eradication using Municipality approved chemicals and treatments.",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.5,
                                    height: 1.25,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Starting from AED ${it.price}",
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          SizedBox(
                            height: 36,
                            child: OutlinedButton(
                              onPressed: () => onToggle(i),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: green,
                                side: BorderSide(color: green.withOpacity(0.8)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                isSelected ? "ADDED" : "ADD +",
                                style: const TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Continue button
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: selected.isEmpty
                        ? null
                        : () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Selected: ${selected.length} package(s)")),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      disabledBackgroundColor: green.withOpacity(0.35),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SheetItem {
  final String title;
  final int price;
  final String image;
  const _SheetItem(this.title, this.price, this.image);
}
