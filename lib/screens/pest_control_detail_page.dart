import 'package:flutter/material.dart';

enum PestKey { none, ants, bedbugs, wasp, mosquito, cockroach, rodent }

class PestControlDetailPage extends StatefulWidget {
  final String pestName;
  final String bannerImage;
  final String pestIcon;
  final int aptStartingFrom;
  final int villaStartingFrom;
  final List<PackageItem> apartmentPackages;
  final List<PackageItem> villaPackages;

  final bool isOneTime;

  const PestControlDetailPage({
    super.key,
    required this.pestName,
    required this.bannerImage,
    required this.pestIcon,
    required this.aptStartingFrom,
    required this.villaStartingFrom,
    required this.apartmentPackages,
    required this.villaPackages,
    this.isOneTime = false,
  });

  factory PestControlDetailPage.fromKey(PestKey key) {
    switch (key) {
      case PestKey.ants:
        return const PestControlDetailPage(
          pestName: "ANTS",
          bannerImage: "assets/images/ants_banner.png",
          pestIcon: "assets/icons/ant.png",
          aptStartingFrom: 199,
          villaStartingFrom: 299,
          apartmentPackages: [
            PackageItem("Studio", 189, "assets/images/apt_thumb.png"),
            PackageItem("1 Bedroom Apartment", 210, "assets/images/apt_thumb.png"),
            PackageItem("2 Bedroom Apartment", 262, "assets/images/apt_thumb.png"),
            PackageItem("3 Bedroom Apartment", 367, "assets/images/apt_thumb.png"),
          ],
          villaPackages: [
            PackageItem("Villa 2 Bedroom", 499, "assets/images/villa_thumb.png"),
            PackageItem("Villa 3 Bedroom", 599, "assets/images/villa_thumb.png"),
            PackageItem("Villa 4 Bedroom", 699, "assets/images/villa_thumb.png"),
            PackageItem("Villa 5 Bedroom", 799, "assets/images/villa_thumb.png"),
          ],
        );

      case PestKey.bedbugs:
        return const PestControlDetailPage(
          pestName: "BED BUGS",
          bannerImage: "assets/images/bedbugs_banner.png",
          pestIcon: "assets/icons/bedbugs.png",
          aptStartingFrom: 249,
          villaStartingFrom: 399,
          apartmentPackages: [
            PackageItem("Studio", 249, "assets/images/apt_thumb.png"),
            PackageItem("1 Bedroom Apartment", 299, "assets/images/apt_thumb.png"),
            PackageItem("2 Bedroom Apartment", 349, "assets/images/apt_thumb.png"),
            PackageItem("3 Bedroom Apartment", 399, "assets/images/apt_thumb.png"),
          ],
          villaPackages: [
            PackageItem("Villa 2 Bedroom", 699, "assets/images/villa_thumb.png"),
            PackageItem("Villa 3 Bedroom", 799, "assets/images/villa_thumb.png"),
            PackageItem("Villa 4 Bedroom", 899, "assets/images/villa_thumb.png"),
            PackageItem("Villa 5 Bedroom", 999, "assets/images/villa_thumb.png"),
          ],
        );

      case PestKey.wasp:
        return const PestControlDetailPage(
          pestName: "WASP",
          bannerImage: "assets/images/wasp_banner.png",
          pestIcon: "assets/icons/wasp.png",
          aptStartingFrom: 0,
          villaStartingFrom: 262,
          apartmentPackages: [],
          villaPackages: [
            PackageItem("Villa Service", 262, "assets/images/villa_thumb.png"),
          ],
        );

      case PestKey.mosquito:
        return const PestControlDetailPage(
          pestName: "MOSQUITOES",
          bannerImage: "assets/images/mosquito_banner.png",
          pestIcon: "assets/icons/mosquito.png",
          aptStartingFrom: 263,
          villaStartingFrom: 263,
          apartmentPackages: [
            PackageItem("Apartment - Misting", 263, "assets/images/apt_thumb.png"),
          ],
          villaPackages: [
            PackageItem("Villa - Fogging", 263, "assets/images/villa_thumb.png"),
            PackageItem("Villa - Misting", 263, "assets/images/villa_thumb.png"),
          ],
        );

      case PestKey.cockroach:
        return const PestControlDetailPage(
          pestName: "COCKROACHES",
          bannerImage: "assets/images/cockroach_banner.png",
          pestIcon: "assets/icons/cockroach.png",
          aptStartingFrom: 199,
          villaStartingFrom: 299,
          apartmentPackages: [
            PackageItem("Studio", 199, "assets/images/apt_thumb.png"),
            PackageItem("1 Bedroom Apartment", 249, "assets/images/apt_thumb.png"),
            PackageItem("2 Bedroom Apartment", 299, "assets/images/apt_thumb.png"),
            PackageItem("3 Bedroom Apartment", 349, "assets/images/apt_thumb.png"),
          ],
          villaPackages: [
            PackageItem("Villa 2 Bedroom", 549, "assets/images/villa_thumb.png"),
            PackageItem("Villa 3 Bedroom", 649, "assets/images/villa_thumb.png"),
            PackageItem("Villa 4 Bedroom", 749, "assets/images/villa_thumb.png"),
            PackageItem("Villa 5 Bedroom", 849, "assets/images/villa_thumb.png"),
          ],
        );

      case PestKey.rodent:
        return const PestControlDetailPage(
          pestName: "RODENT",
          bannerImage: "assets/images/rodent_banner.png",
          pestIcon: "assets/icons/rodent.png",
          aptStartingFrom: 263,
          villaStartingFrom: 263,
          apartmentPackages: [
            PackageItem("Rat Traps", 263, "assets/images/apt_thumb.png"),
          ],
          villaPackages: [
            PackageItem("Villa - Rat Traps", 263, "assets/images/villa_thumb.png"),
            PackageItem("Villa - RBS", 263, "assets/images/villa_thumb.png"),
          ],
        );

      default:
        return PestControlDetailPage.fromKey(PestKey.ants);
    }
  }

  @override
  State<PestControlDetailPage> createState() => _PestControlDetailPageState();
}

class _PestControlDetailPageState extends State<PestControlDetailPage> {
  void _openPackagesSheet(String title, IconData headerIcon, List<PackageItem> items) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _PackagesSheet(
        title: title,
        headerIcon: headerIcon,
        items: items,
        pestName: widget.pestName,
      ),
    );
  }

  void _switchTo(PestKey key) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => PestControlDetailPage.fromKey(key)),
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
              Row(
                children: [
                  const Expanded(
                    child: Text("Pest Control", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 6)),
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

              if (!widget.isOneTime) ...[
                SizedBox(
                  height: 44,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _Chip(label: "Ants", icon: "assets/icons/ant.png", active: widget.pestName == "ANTS", onTap: () => _switchTo(PestKey.ants)),
                      const SizedBox(width: 10),
                      _Chip(label: "Mosquitoes", icon: "assets/icons/mosquito.png", active: widget.pestName == "MOSQUITOES", onTap: () => _switchTo(PestKey.mosquito)),
                      const SizedBox(width: 10),
                      _Chip(label: "Bed Bugs", icon: "assets/icons/bedbugs.png", active: widget.pestName == "BED BUGS", onTap: () => _switchTo(PestKey.bedbugs)),
                      const SizedBox(width: 10),
                      _Chip(label: "Cockroaches", icon: "assets/icons/cockroach.png", active: widget.pestName == "COCKROACHES", onTap: () => _switchTo(PestKey.cockroach)),
                      const SizedBox(width: 10),
                      _Chip(label: "Wasp", icon: "assets/icons/wasp.png", active: widget.pestName == "WASP", onTap: () => _switchTo(PestKey.wasp)),
                      const SizedBox(width: 10),
                      _Chip(label: "Rodent", icon: "assets/icons/rodent.png", active: widget.pestName == "RODENT", onTap: () => _switchTo(PestKey.rodent)),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
              ] else ...[
                const SizedBox(height: 10),
              ],

              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    Image.asset(
                      widget.bannerImage,
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(height: 170, color: green),
                    ),
                    Positioned.fill(child: Container(color: Colors.black.withOpacity(0.15))),
                    Positioned(
                      left: 16,
                      top: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.pestName, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900)),
                          const SizedBox(height: 6),
                          Text(
                            widget.isOneTime ? "One-Time Treatment • Safe\n• 0 Warranty" : "Targeted Treatment • Safe\n• Warranty Included",
                            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w700, height: 1.2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              _MainCard(
                title: "Apartment",
                subtitle: "${widget.pestName} - Apartment",
                startingFrom: widget.aptStartingFrom,
                thumb: "assets/images/apt_thumb.png",
                onView: () => _openPackagesSheet("Apartment", Icons.apartment, widget.apartmentPackages),
              ),

              const SizedBox(height: 12),

              _MainCard(
                title: "Villa",
                subtitle: "${widget.pestName} - Villa",
                startingFrom: widget.villaStartingFrom,
                thumb: "assets/images/villa_thumb.png",
                onView: () => _openPackagesSheet("Villa", Icons.home_outlined, widget.villaPackages),
              ),

              const SizedBox(height: 16),

              const Center(
                child: Text(
                  "Select a service to continue",
                  style: TextStyle(color: Color(0xFF7FA16D), fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final String icon;
  final bool active;
  final VoidCallback onTap;

  const _Chip({required this.label, required this.icon, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF6FAE57);

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFEAF5E4) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: active ? green : Colors.black12),
        ),
        child: Row(
          children: [
            SizedBox(width: 18, height: 18, child: Image.asset(icon, fit: BoxFit.contain)),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w800, color: active ? const Color(0xFF2E5C22) : Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int startingFrom;
  final String thumb;
  final VoidCallback onView;

  const _MainCard({required this.title, required this.subtitle, required this.startingFrom, required this.thumb, required this.onView});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF6FAE57);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 14, offset: const Offset(0, 8))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 70,
              height: 70,
              color: const Color(0xFFF1F3F4),
              child: Image.asset(thumb, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.image_outlined, color: Colors.black38)),
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
            onPressed: onView,
            style: OutlinedButton.styleFrom(
              foregroundColor: green,
              side: const BorderSide(color: green),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("View Packages →", style: TextStyle(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
}

class _PackagesSheet extends StatefulWidget {
  final String title;
  final IconData headerIcon;
  final List<PackageItem> items;
  final String pestName;

  const _PackagesSheet({required this.title, required this.headerIcon, required this.items, required this.pestName});

  @override
  State<_PackagesSheet> createState() => _PackagesSheetState();
}

class _PackagesSheetState extends State<_PackagesSheet> {
  final Set<int> selected = {};

  void _showServiceDetailsDialog() {
    showDialog(
  context: context,
  barrierDismissible: true,
  barrierColor: Colors.white, // ✅ THIS CHANGES BACKGROUND
  builder: (_) => ServiceDetailsDialog(pestName: widget.pestName),
);
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF6FAE57);

    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Icon(widget.headerIcon, color: green),
                    const SizedBox(width: 8),
                    Expanded(child: Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900))),
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                  itemCount: widget.items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, i) {
                    final it = widget.items[i];
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
                              child: Image.asset(it.thumb, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.image_outlined, color: Colors.black38)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(it.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                              const SizedBox(height: 6),
                              const Text(
                                "Effective pest eradication using Municipality approved chemicals and treatments.",
                                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 12.5, height: 1.25),
                              ),
                              const SizedBox(height: 8),
                              Text("Starting from AED ${it.price}", style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w700)),
                            ]),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              SizedBox(
                                height: 34,
                                child: OutlinedButton(
                                  onPressed: _showServiceDetailsDialog,
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black87,
                                    side: BorderSide(color: Colors.black.withOpacity(0.18)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  child: const Text("Details", style: TextStyle(fontWeight: FontWeight.w900)),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 36,
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isSelected) {
                                        selected.remove(i);
                                      } else {
                                        selected.add(i);
                                      }
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: green,
                                    side: BorderSide(color: green.withOpacity(0.8)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  child: Text(isSelected ? "ADDED" : "ADD +", style: const TextStyle(fontWeight: FontWeight.w900)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: selected.isEmpty ? null : () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      disabledBackgroundColor: green.withOpacity(0.35),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text("Continue", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
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

class PackageItem {
  final String title;
  final int price;
  final String thumb;
  const PackageItem(this.title, this.price, this.thumb);
}

/// =======================
/// Service Details Dialog
/// =======================

class ServiceDetailsDialog extends StatelessWidget {
  final String pestName;
  const ServiceDetailsDialog({super.key, required this.pestName});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final dialogWidth = w >= 900 ? 820.0 : (w >= 520 ? 520.0 : w * 0.95);

    final data = _ServiceDetailsData.forPest(pestName);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: SizedBox(
        width: dialogWidth,
        height: MediaQuery.sizeOf(context).height * 0.9,
        child: Column(
          children: [
            const _DialogHeader(title: "Service Details"),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _IntroRichText(
                      boldServiceName: data.boldServiceName,
                      introAfterBold: data.introAfterBold,
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(title: "Treatment Method Includes", bullets: data.treatmentMethod),
                    const SizedBox(height: 14),
                    _SectionCard(title: "Areas Covered", bullets: data.areasCovered),
                    const SizedBox(height: 14),
                    _SectionCard(title: "What to Expect", bullets: data.whatToExpect),
                    const SizedBox(height: 14),
                    _SectionCard(title: "Safety Information", bullets: data.safetyInfo),
                    const SizedBox(height: 14),
                    _HighlightCard(title: "Important Notes", bullets: data.importantNotes),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceDetailsData {
  final String boldServiceName;
  final String introAfterBold;

  final List<_Bullet> treatmentMethod;
  final List<_Bullet> areasCovered;
  final List<_Bullet> whatToExpect;
  final List<_Bullet> safetyInfo;
  final List<String> importantNotes;

  _ServiceDetailsData({
    required this.boldServiceName,
    required this.introAfterBold,
    required this.treatmentMethod,
    required this.areasCovered,
    required this.whatToExpect,
    required this.safetyInfo,
    required this.importantNotes,
  });

  static _ServiceDetailsData forPest(String pestName) {
    final p = pestName.trim().toUpperCase();

    if (p == "BED BUGS") return bedBugs();
    if (p == "WASP") return wasp();
    if (p == "MOSQUITOES") return mosquitoes();
    if (p == "RODENT") return rodent();

    return general();
  }

  // ✅ General Pest Control (Ants/Cockroach default)
  static _ServiceDetailsData general() {
    return _ServiceDetailsData(
      boldServiceName: "Professional General Pest Control",
      introAfterBold:
          ", designed to reduce pest activity, eliminate visible pests, and help control future infestations when proper aftercare instructions are followed. Treatments are carried out by trained technicians using approved methods suitable for residential properties.",
      treatmentMethod: const [
        _Bullet(
          bold: "Spray Treatment",
          text:
              "applied to pest-affected areas, corners, cracks, wall edges, and entry points to eliminate visible adult pests and reduce movement.",
        ),
        _Bullet(
          bold: "Gel Treatment",
          text:
              "applied in targeted locations such as kitchen cabinets, under sinks, appliances, and hidden pest harborages for extended control.",
        ),
        _Bullet(
          text: "Treatment approach is adjusted based on infestation level, pest activity, and layout of the property.",
        ),
      ],
      areasCovered: const [
        _Bullet(text: "Kitchens, cabinets, sinks, and surrounding pest-prone zones"),
        _Bullet(text: "Living areas and other accessible infestation points"),
        _Bullet(text: "High-risk areas where pest activity is commonly observed"),
        _Bullet(text: "Application using chemicals approved and compliant with local safety regulations"),
      ],
      whatToExpect: const [
        _Bullet(bold: "During Service:", text: "Technician will inspect affected areas, identify pest activity, and apply treatment accordingly."),
        _Bullet(bold: "After Service:", text: "Temporary increase in pest visibility may occur as pests are flushed out before reduction."),
        _Bullet(bold: "Follow-Up:", text: "Additional treatment or visits may be recommended depending on infestation severity."),
      ],
      safetyInfo: const [
        _Bullet(text: "Technicians use approved chemicals following safety guidelines"),
        _Bullet(text: "Children and pets should avoid treated areas for the advised period"),
        _Bullet(text: "Ventilation may be recommended after treatment"),
        _Bullet(text: "Do not clean treated areas immediately unless advised"),
      ],
      importantNotes: const [
        "Service duration varies based on property size and infestation level",
        "This service focuses on control and reduction, not instant eradication",
        "Results may vary depending on hygiene, pest source, and surrounding environment",
        "Preparation and aftercare instructions will be shared by the technician",
      ],
    );
  }

  // ✅ Bed Bugs (your exact content)
  static _ServiceDetailsData bedBugs() {
    return _ServiceDetailsData(
      boldServiceName: "Professional Bed Bug Control Treatment",
      introAfterBold:
          ", designed to reduce bed bug activity, eliminate visible bed bugs, and help control re-infestation when proper preparation and aftercare instructions are followed. Bed bug treatment requires precision, follow-up, and customer cooperation for effective results.",
      treatmentMethod: const [
        _Bullet(
          bold: "Residual Spray Treatment",
          text:
              "applied to bed frames, mattresses (seams and edges), headboards, cracks, wall joints, and surrounding areas to target active bed bugs.",
        ),
        _Bullet(
          bold: "Targeted Treatment of Hiding Spots",
          text:
              "applied to furniture joints, skirting, behind beds, sofas, wardrobes, and other bed bug harborages.",
        ),
        _Bullet(text: "Treatment approach is customized based on infestation severity and affected areas."),
      ],
      areasCovered: const [
        _Bullet(text: "Bedrooms, beds, mattresses, headboards, and bed frames"),
        _Bullet(text: "Sofas, furniture, wardrobes, and nearby storage areas"),
        _Bullet(text: "Cracks, crevices, wall joints, and pest-affected zones"),
        _Bullet(text: "Application using approved chemicals in accordance with safety standards"),
      ],
      whatToExpect: const [
        _Bullet(
          bold: "Before Service:",
          text: "Preparation is required, including washing bedding, clearing affected areas, and following provided instructions.",
        ),
        _Bullet(
          bold: "During Service:",
          text: "Technician will inspect infested areas and apply treatment to affected and surrounding zones.",
        ),
        _Bullet(
          bold: "After Service:",
          text: "Bed bug activity may continue temporarily as remaining bugs come into contact with treated surfaces.",
        ),
        _Bullet(
          bold: "Follow-Up:",
          text: "Additional visits are often recommended for effective control due to bed bug life cycles.",
        ),
      ],
      safetyInfo: const [
        _Bullet(text: "Only approved chemicals are used by trained professionals"),
        _Bullet(text: "Rooms must remain vacant for the advised period after treatment"),
        _Bullet(text: "Children, pets, and pregnant individuals should avoid treated areas as instructed"),
        _Bullet(text: "Do not clean treated surfaces until advised by the technician"),
      ],
      importantNotes: const [
        "Bed bug treatment is not an instant solution and may require multiple visits",
        "Results depend heavily on preparation, follow-up, and surrounding environment",
        "Re-infestation can occur if sources are not eliminated",
        "Service duration and treatment plan depend on infestation severity",
      ],
    );
  }

  // ✅ WASP
  static _ServiceDetailsData wasp() {
    return _ServiceDetailsData(
      boldServiceName: "Professional Wasp Control Treatment",
      introAfterBold:
          ", esigned to safely reduce wasp activity, remove visible wasps and nests, and help prevent re-occurrence when recommended safety and aftercare instructions are followed. Treatment is carried out by trained technicians using controlled and approved methods.",
      treatmentMethod: const [
        _Bullet(
          bold: "Targeted Spray Treatment ",
          text: "applied directly to wasp activity zones and nesting areas to control active wasps.",
        ),
        _Bullet(
          bold: "Nest Treatment or Removal",
          text: "depending on accessibility and safety conditions, visible nests are treated or safely removed.",
        ),
        _Bullet(
          bold: "Preventive Spot Treatment",
          text: "Treatment approach is adjusted based on nest location, height, and infestation severity.",
        ),
      ],
      areasCovered: const [
        _Bullet(text: "Balconies, terraces, roofs, and external walls"),
        _Bullet(text: "Window ledges, air-conditioning units, and shaded outdoor areas"),
        _Bullet(text: "Accessible wasp nests and activity zones"),
        _Bullet(text: "Use of approved chemicals in accordance with safety regulations"),
      ],
      whatToExpect: const [
        _Bullet(bold: "During Service:", text: "Technician will assess nest location, activity level, and apply treatment"),
        _Bullet(bold: "After Service:", text: "Temporary wasp movement may be observed before activity reduces significantly."),
        _Bullet(bold: "Follow-Up:", text: "Additional treatment may be recommended if wasp activity continues or new nests appear."),
      ],
      safetyInfo: const [
        _Bullet(text: "Customers should stay indoors during treatment"),
        _Bullet(text: "Children, pets, and bystanders must keep distance from treated areas"),
        _Bullet(text: "Do not attempt to disturb nests before or after treatment"),
        _Bullet(text: "Protective equipment is used by technicians during service"),
      ],
      importantNotes: const [
        "Service duration depends on nest location and accessibility",
        "High or hard-to-reach nests may require special equipment",
        "Re-infestation can occur if new nests form nearby",
        "Results may vary depending on environmental conditions",
      ],
    );
  }

  // ✅ MOSQUITOES
  static _ServiceDetailsData mosquitoes() {
    return _ServiceDetailsData(
      boldServiceName: "Professional Mosquito Control Treatment,",
      introAfterBold:
          ", designed to reduce mosquito activity, minimize breeding, and improve comfort in treated areas. The treatment focuses on controlling adult mosquitoes and helping prevent re-occurrence when proper environmental and aftercare measures are followed.",
      treatmentMethod: const [
        _Bullet(
          bold: "Misting or Fogging Treatment",
          text: "applied to outdoor and semi-outdoor areas to reduce adult mosquito population and activity.",
          
        ),
        _Bullet(
          bold: "Targeted Spray Application ",
          text: "applied to walls, plants, shaded areas, and mosquito resting zones.",
        ),
        _Bullet(
          text: "Treatment approach is adjusted based on area size, mosquito density, and environmental conditions.",
        ),
      ],
      areasCovered: const [
        _Bullet(text: "Gardens, balconies, terraces, and outdoor seating areas"),
        _Bullet(text: "Building surroundings, walls, and shaded mosquito resting areas"),
        _Bullet(text: "Drainage zones, plant areas, and potential breeding sites (where accessible)"),
        _Bullet(text: "Use of approved chemicals compliant with safety regulations"),
      ],
      whatToExpect: const [
        _Bullet(bold: "During Service:", text: "Technician will inspect the area, identify mosquito activity and breeding points, and apply treatment accordingly."),
        _Bullet(bold: "After Service:", text: "Reduced mosquito activity may be noticed within a short period, depending on environmental factors."),
        _Bullet(bold: "Follow-Up:", text: "Regular treatments may be recommended for sustained mosquito control."),
      ],
      safetyInfo: const [
        _Bullet(text: "People and pets should stay away from treated areas during application"),
        _Bullet(text: "Re-entry time will be advised by the technician after treatment"),
        _Bullet(text: "Avoid washing or watering treated areas immediately after service"),
        _Bullet(text: "Treatments are applied following recommended safety guidelines"),
      ],
      importantNotes: const [
        "Mosquito control is most effective with regular treatments",
        "Standing water and nearby breeding sources affect results",
        "Weather conditions may affect treatment effectiveness",
        "Service duration varies based on area size and infestation level",
      ],
    );
  }

  // ✅ RODENT
  static _ServiceDetailsData rodent() {
    return _ServiceDetailsData(
      boldServiceName: "Professional Rodent Control Treatment,",
      introAfterBold:
          ", designed to reduce rodent activity, control existing rodents, and help prevent re-entry through proper treatment and preventive measures. Rodent control focuses on inspection, control methods, and exclusion recommendations for effective results.",
      treatmentMethod: const [
        _Bullet(
          bold: "Inspection and Assessment",
          text: "to identify rodent activity, entry points, nesting areas, and movement paths.",
        ),
        _Bullet(
          bold: "Baiting and Trapping",
          text: "using approved rodent control methods placed in secure and strategic locations.",
        ),
        _Bullet(
          bold: "Bait Stations (if applicable)",
          text: "safe placement in controlled locations, especially for outdoor/perimeter use.",
        ),
        _Bullet(text: "Treatment approach is customized based on activity level and site layout."),
      ],
      areasCovered: const [
        _Bullet(text: "Kitchens, storage rooms, utility areas, and basements"),
        _Bullet(text: "Building perimeters, entry points, and service areas"),
        _Bullet(text: "External surroundings where rodent activity is observed"),
        _Bullet(text: "Use of approved materials compliant with safety regulations"),
      ],
      whatToExpect: const [
        _Bullet(bold: "During Service:", text: "Technician will inspect affected areas and install traps or bait stations as required."),
        _Bullet(bold: "After Service:", text: "Rodent activity may continue temporarily before reduction is noticed."),
        _Bullet(bold: "Follow-Up:", text: "Additional visits may be recommended depending on infestation level and rodent activity."),
      ],
      safetyInfo: const [
        _Bullet(text: "Bait stations are placed in secure, tamper-resistant locations"),
        _Bullet(text: "Customers should not disturb traps or bait stations"),
        _Bullet(text: "Children and pets must avoid treated areas"),
        _Bullet(text: "OTechnicians follow approved safety protocols during service"),
      ],
      importantNotes: const [
        "Rodent control may require multiple visits for effective management",
        "Sealing of entry points may be recommended but is not always included",
        "Results depend on sanitation, surrounding environment, and structure condition",
        "Service duration varies based on infestation severity and site size",
      ],
    );
  }
}

/// =======================
/// UI Widgets (Dialog)
/// =======================

class _DialogHeader extends StatelessWidget {
  final String title;
  const _DialogHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 10, 10),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close), splashRadius: 20),
        ],
      ),
    );
  }
}

class _IntroRichText extends StatelessWidget {
  final String boldServiceName;
  final String introAfterBold;

  const _IntroRichText({required this.boldServiceName, required this.introAfterBold});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87, height: 1.45, fontSize: 14),
        children: [
          const TextSpan(text: "This service includes "),
          TextSpan(text: boldServiceName, style: const TextStyle(fontWeight: FontWeight.w800)),
          TextSpan(text: introAfterBold),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<_Bullet> bullets;

  const _SectionCard({required this.title, required this.bullets});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          ...bullets.map((b) => _BulletRow(bullet: b)),
        ],
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final String title;
  final List<String> bullets;

  const _HighlightCard({required this.title, required this.bullets});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9C9A4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          ...bullets.map((t) => _PlainBulletRow(text: t)),
        ],
      ),
    );
  }
}

class _Bullet {
  final String? bold;
  final String text;
  const _Bullet({this.bold, required this.text});
}

class _BulletRow extends StatelessWidget {
  final _Bullet bullet;
  const _BulletRow({required this.bullet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ", style: TextStyle(height: 1.35)),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, height: 1.35, fontSize: 13.5),
                children: [
                  if ((bullet.bold ?? "").trim().isNotEmpty) ...[
                    TextSpan(text: bullet.bold!.trim(), style: const TextStyle(fontWeight: FontWeight.w900)),
                    const TextSpan(text: " "),
                  ],
                  TextSpan(text: bullet.text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlainBulletRow extends StatelessWidget {
  final String text;
  const _PlainBulletRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ", style: TextStyle(height: 1.35)),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.black87, height: 1.35, fontSize: 13.5))),
        ],
      ),
    );
  }
}