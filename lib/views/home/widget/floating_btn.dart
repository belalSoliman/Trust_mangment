import 'package:flutter/material.dart';

class FloatingBtn extends StatefulWidget {
  const FloatingBtn({super.key});

  @override
  State<FloatingBtn> createState() => _FloatingBtnState();
}

class _FloatingBtnState extends State<FloatingBtn>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;
  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Add Customer', 'icon': Icons.person_add, 'color': Colors.blue},
    {'title': 'Add Payment', 'icon': Icons.payment, 'color': Colors.green},
    {'title': 'Add Invoice', 'icon': Icons.receipt, 'color': Colors.purple},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _translateAnimation = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
      _isOpen ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16),
      child: SizedBox(
        width: 200,
        height: _isOpen ? 240 : 56,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            // Menu Items
            ..._menuItems.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> item = entry.value;
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                right: _isOpen ? 0 : -100,
                bottom: _isOpen ? (index + 2.5) * 65 : 0,
                child: AnimatedOpacity(
                  opacity: _isOpen ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Transform.translate(
                    offset: Offset(0, _translateAnimation.value),
                    child: InkWell(
                      onTap: () {
                        _toggleMenu();
                        switch (item['title']) {
                          case 'Add Customer':
                            // Handle navigation
                            break;
                          case 'Add Payment':
                            // Handle navigation
                            break;
                          case 'Add Invoice':
                            // Handle navigation
                            break;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: item['color'],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(item['icon'], color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              item['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),

            // Main Button
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: _isOpen ? 8 : 4,
                    offset: Offset(0, _isOpen ? 4 : 2),
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: _toggleMenu,
                backgroundColor: Colors.blueAccent,
                elevation: 0,
                child: AnimatedRotation(
                  turns: _isOpen ? 0.125 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    _isOpen ? Icons.close : Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
