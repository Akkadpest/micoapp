import 'dart:async';
import 'package:flutter/material.dart';

import 'warranty_page.dart';
import 'account_page.dart';
import 'virtual_inspection_page.dart';
import 'pest_control_detail_page.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    final pages = const [
      HomeTab(),
      WarrantyPage(),
      PlaceholderTab(title: "Messages"),
      AccountPage(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(child: pages[currentTab]),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (currentTab == 0) const TabbyBar(),
            BottomNavigationBar(
              currentIndex: currentTab,
              onTap: (i) => setState(() => currentTab = i),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFF6FAE57),
              unselectedItemColor: Colors.black54,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.verified_outlined), label: "Warranty"),
                BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Messages"),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: "Account"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= TABBY BAR ================= */

class TabbyBar extends StatelessWidget {
  const TabbyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 0.6),
      ),
      child: Row(
        children: const [
          Text(
            "tabby",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 13,
              color: Color(0xFF00B67A),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "available on select services",
              style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          Icon(Icons.info_outline, size: 18, color: Colors.black54),
        ],
      ),
    );
  }
}

/* ================= HOME TAB ================= */

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  void _openPest(BuildContext context, PestKey key) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PestControlDetailPage.fromKey(key)),
    );
  }

  void _openOneTime(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PestControlDetailPage(
          pestName: "ONE TIME GENERAL PEST CONTROL",
          bannerImage: "assets/images/promo.png",
          pestIcon: "",
          aptStartingFrom: 99,
          villaStartingFrom: 149,
          apartmentPackages: [
            PackageItem("Studio", 99, "assets/images/apt_thumb.png"),
            PackageItem("1 Bedroom Apartment", 129, "assets/images/apt_thumb.png"),
            PackageItem("2 Bedroom Apartment", 159, "assets/images/apt_thumb.png"),
            PackageItem("3 Bedroom Apartment", 199, "assets/images/apt_thumb.png"),
          ],
          villaPackages: [
            PackageItem("Villa 2 Bedroom", 249, "assets/images/villa_thumb.png"),
            PackageItem("Villa 3 Bedroom", 299, "assets/images/villa_thumb.png"),
            PackageItem("Villa 4 Bedroom", 349, "assets/images/villa_thumb.png"),
            PackageItem("Villa 5 Bedroom", 399, "assets/images/villa_thumb.png"),
          ],
          isOneTime: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final services = const [
      _HomeService("Ant\ncontrol", "assets/icons/ant.png", _ServiceType.pest, PestKey.ants),
      _HomeService("Bed Bugs\nControl", "assets/icons/bedbugs.png", _ServiceType.pest, PestKey.bedbugs),
      _HomeService("Wasp\ncontrol", "assets/icons/wasp.png", _ServiceType.pest, PestKey.wasp),
      _HomeService("Mosquitos\ncontrol", "assets/icons/mosquito.png", _ServiceType.pest, PestKey.mosquito),
      _HomeService("Cockroaches\ncontrol", "assets/icons/cockroach.png", _ServiceType.pest, PestKey.cockroach),
      _HomeService("Rodent\ncontrol", "assets/icons/rodent.png", _ServiceType.pest, PestKey.rodent),
      _HomeService("One Time\nGeneral Pest\nControl", "", _ServiceType.general, PestKey.none),
      _HomeService("Virtual\nInspection", "", _ServiceType.virtual, PestKey.none),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const CircleAvatar(radius: 18, backgroundColor: Colors.white, child: Icon(Icons.person_outline)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Hi 👋", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 16, color: Colors.black54),
                        SizedBox(width: 4),
                        Text("Add Location", style: TextStyle(color: Colors.black54, fontSize: 12.5)),
                        Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
            ],
          ),

          const SizedBox(height: 12),

          // Search
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.black45),
                SizedBox(width: 10),
                Expanded(child: Text("Search by Service or Category", style: TextStyle(color: Colors.black45))),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Grid spacing like your screenshot
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.82,
            ),
            itemBuilder: (context, i) {
              final item = services[i];
              return _ServiceTile(
                title: item.title,
                icon: item.icon,
                type: item.type,
                onTap: () {
                  if (item.type == _ServiceType.pest) {
                    _openPest(context, item.key);
                  } else if (item.type == _ServiceType.general) {
                    _openOneTime(context);
                  } else if (item.type == _ServiceType.virtual) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const VirtualInspectionPage()));
                  }
                },
              );
            },
          ),

          const SizedBox(height: 14),
          const PromoSlider(),
        ],
      ),
    );
  }
}

enum _ServiceType { pest, general, virtual }

class _HomeService {
  final String title;
  final String icon;
  final _ServiceType type;
  final PestKey key;
  const _HomeService(this.title, this.icon, this.type, this.key);
}

class _ServiceTile extends StatelessWidget {
  final String title;
  final String icon;
  final _ServiceType type;
  final VoidCallback onTap;

  const _ServiceTile({
    required this.title,
    required this.icon,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF6FAE57);

    Widget fallback(IconData ic) => Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: const Color(0xFFEAF5E4), borderRadius: BorderRadius.circular(14)),
          child: Icon(ic, size: 22, color: green),
        );

    final isGeneral = type == _ServiceType.general;
    final isVirtual = type == _ServiceType.virtual;

    Widget iconWidget;
    if (isVirtual) {
      iconWidget = fallback(Icons.video_call);
    } else if (isGeneral) {
      iconWidget = fallback(Icons.pest_control);
    } else {
      iconWidget = SizedBox(
        width: 44,
        height: 44,
        child: Image.asset(
          icon,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => fallback(Icons.miscellaneous_services),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10, height: 1.05, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= PROMO SLIDER ================= */

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final PageController _controller = PageController();
  Timer? _timer;
  int _index = 0;

  final List<String> images = const [
    "assets/images/promo1.png",
    "assets/images/promo2.png",
    "assets/images/promo3.png",
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_controller.hasClients) return;
      _index = (_index + 1) % images.length;
      _controller.animateToPage(_index, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) => Image.asset(images[i], fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _index == i ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _index == i ? const Color(0xFF6FAE57) : Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PlaceholderTab extends StatelessWidget {
  final String title;
  const PlaceholderTab({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)));
  }
}
