import 'package:flutter/material.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  int selectedTab = 0; // 0 upcoming, 1 delivered, 2 cancelled, 3 unpaid

  @override
  Widget build(BuildContext context) {
    const bg = Colors.white;
    const primary = Color.fromARGB(255, 4, 151, 24); // teal like screenshot

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Bookings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notifications tapped")),
              );
            },
            icon: const Icon(Icons.notifications_none, color: primary),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          children: [
            // Tabs row
            Row(
              children: [
                Expanded(
                  child: _TopTab(
                    label: "Upcoming",
                    icon: Icons.access_time,
                    isActive: selectedTab == 0,
                    activeColor: primary,
                    onTap: () => setState(() => selectedTab = 0),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _TopTab(
                    label: "Delivered",
                    icon: Icons.check_circle_outline,
                    isActive: selectedTab == 1,
                    activeColor: primary,
                    onTap: () => setState(() => selectedTab = 1),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _TopTab(
                    label: "Cancelled",
                    icon: Icons.cancel_outlined,
                    isActive: selectedTab == 2,
                    activeColor: primary,
                    onTap: () => setState(() => selectedTab = 2),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _TopTab(
                    label: "Unpaid",
                    icon: Icons.receipt_long_outlined,
                    isActive: selectedTab == 3,
                    activeColor: const Color.fromARGB(255, 15, 134, 21),
                    onTap: () => setState(() => selectedTab = 3),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            // Empty state card (same idea as screenshot)
            Expanded(
              child: Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.calendar_month_outlined,
                          size: 64, color: Colors.black),
                      const SizedBox(height: 16),
                      Text(
                        _emptyTitle(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Book a service or quote today through the Home tab.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _emptyTitle() {
    switch (selectedTab) {
      case 0:
        return "No upcoming appointment";
      case 1:
        return "No delivered appointment";
      case 2:
        return "No cancelled appointment";
      case 3:
        return "No unpaid appointment";
      default:
        return "No appointment";
    }
  }
}

class _TopTab extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  const _TopTab({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(26),
      onTap: onTap,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: isActive ? activeColor : Colors.black12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive ? Colors.white : Colors.black54,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: isActive ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
