import 'package:flutter/material.dart';

void main() {
  runApp(const NixApp());
}

class NixApp extends StatelessWidget {
  const NixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIX App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F081C), // Màu nền Dark Mode NIX
        primaryColor: const Color(0xFF8B5CF6), // Màu tím chủ đạo
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1A102D),
          selectedItemColor: Color(0xFF3B82F6), // Màu xanh khi chọn tab
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// ==========================================
// 1. MÀN HÌNH LOGIN
// ==========================================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100, height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Reduce distraction',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Eliminate interruptions and stay\ncentered on your goals',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 48),
              
              // Nút Đăng nhập - Click để vào App
              InkWell(
                onTap: () {
                  // Logic cơ bản: Chuyển sang màn hình chính
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainNavigator()),
                  );
                },
                child: Container(
                  width: double.infinity, height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Center(
                    child: Text('Sign in with Google', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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

// ==========================================
// THIẾT LẬP THANH ĐIỀU HƯỚNG BÊN DƯỚI (BOTTOM NAV)
// ==========================================
class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;

  // Danh sách 4 màn hình chính
  final List<Widget> _screens = [
    const HomeScreen(),
    const FocusScreen(),
    const StatsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // Logic cơ bản: Đổi tab màn hình
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Record'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

// ==========================================
// 2. MÀN HÌNH HOME (Giao diện vòng tròn)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello,\nThảo', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 40),
            Container(
              width: 200, height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF8B5CF6), width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text('ACTIVATE SHIELD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. MÀN HÌNH FOCUS (Đếm ngược)
// ==========================================
class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  bool isFocusing = false; // Biến trạng thái để đổi chữ nút bấm

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('FOCUS MODE', style: TextStyle(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 20),
            const Text(
              '45:00',
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Color(0xFF3B82F6)),
            ),
            const SizedBox(height: 40),
            // Logic đổi nút bấm khi Click
            InkWell(
              onTap: () {
                setState(() {
                  isFocusing = !isFocusing;
                });
              },
              child: Container(
                width: 250, height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFF3B82F6)]),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    isFocusing ? 'PAUSE FOCUS' : 'START FOCUS', 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. MÀN HÌNH STATS (Thống kê)
// ==========================================
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('YOUR HEALTH & STATS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              width: double.infinity, height: 80,
              decoration: BoxDecoration(color: const Color(0xFF1A102D), borderRadius: BorderRadius.circular(15)),
              child: const Center(child: Text('Tổng thời gian tập trung: 12h30m', style: TextStyle(color: Colors.white70))),
            ),
            const SizedBox(height: 20),
            // Khung biểu đồ Gradient
            Container(
              width: double.infinity, height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFF3B82F6)]),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity, padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: const Color(0xFF1A102D), borderRadius: BorderRadius.circular(15)),
              child: const Text('AI Nhận xét: Tuần này bạn đã bảo vệ tai rất tốt!', style: TextStyle(color: Colors.greenAccent)),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. MÀN HÌNH SETTINGS (Cài đặt)
// ==========================================
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('SETTINGS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildSettingItem('AI Sensitivity'),
            _buildSettingItem('Notifications'),
            _buildSettingItem('Sound Library'),
            _buildSettingItem('Privacy Policy'),
            _buildSettingItem('About NIX'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A102D),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.white70)),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
        ],
      ),
    );
  }
}