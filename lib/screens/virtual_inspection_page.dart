import 'package:flutter/material.dart';

class VirtualInspectionPage extends StatefulWidget {
  const VirtualInspectionPage({super.key});

  @override
  State<VirtualInspectionPage> createState() => _VirtualInspectionPageState();
}

class _VirtualInspectionPageState extends State<VirtualInspectionPage> {
  final green = const Color(0xFF6FAE57);

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _orgController = TextEditingController();
  final _notesController = TextEditingController();
  final _sizeController = TextEditingController(text: "120");

  String? propertyType;
  String unit = "Sq m";
  bool fileUploaded = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _orgController.dispose();
    _notesController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  void _submit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Virtual Inspection Requested")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Virtual Inspection Request",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Get expert advice without a site visit",
                style: TextStyle(color: Colors.black54),
              ),

              const SizedBox(height: 24),
              _sectionTitle("Contact Details"),

              _input("Full Name *", _nameController),
              _phoneInput(),

              const SizedBox(height: 24),
              _sectionTitle("Property Details"),

              _dropdown(
                label: "Property Type *",
                value: propertyType,
                items: const ["Apartment", "Villa", "Office", "Warehouse", "Other"],
                onChanged: (v) => setState(() => propertyType = v),
              ),

              _input("Organization / Building Name (optional)", _orgController),

              const SizedBox(height: 12),
              _propertySizeRow(), // ✅ FIXED ROW (NO OVERFLOW)

              const SizedBox(height: 18),
              _uploadBox(),

              const SizedBox(height: 16),
              _input(
                "Anything we should know? (Optional)",
                _notesController,
                maxLines: 4,
              ),

              const SizedBox(height: 18),

              Row(
                children: const [
                  Icon(Icons.lock, color: Colors.black45, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Your data is secure. Inspection handled by certified Akkad engineers.",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Request Virtual Inspection",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* ================== WIDGETS ================== */

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
      ),
    );
  }

  Widget _input(String label, TextEditingController c, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          TextField(
            controller: c,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Phone Number *", style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black26),
                ),
                child: const Row(
                  children: [
                    Text("🇦🇪 +971"),
                    SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: value,
            items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ FIXED: Property Size row cannot overflow
  Widget _propertySizeRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Property Size", style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: TextField(
                  controller: _sizeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // ✅ fixed width so it will NEVER overflow
            SizedBox(
              width: 92,
              height: 52,
              child: DropdownButtonFormField<String>(
                value: unit,
                items: const [
                  DropdownMenuItem(value: "Sq m", child: Text("Sq m")),
                  DropdownMenuItem(value: "Sq ft", child: Text("Sq ft")),
                ],
                onChanged: (v) => setState(() => unit = v!),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  Widget _uploadBox() {
    return InkWell(
      onTap: () => setState(() => fileUploaded = true),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Icon(
              fileUploaded ? Icons.check_circle : Icons.attach_file,
              color: green,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upload Video / Photos",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  SizedBox(height: 4),
                  Text(
                    "Supported: MP4, JPG, PNG (Max 50MB)",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
