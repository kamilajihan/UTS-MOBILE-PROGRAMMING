import 'package:flutter/material.dart';
import 'list_jadwal_page.dart';
import 'login_page.dart'; // Import your login page

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isTugasSelected = false;
  bool _isProjekSelected = false;
  bool _isCatatanSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Dashboard', style: TextStyle(color: Colors.black)),
        automaticallyImplyLeading: false,  // Removes the back button
        actions: [
          // Profile icon with a PopupMenuButton for profile and logout options
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                _showProfile(context);
              } else if (value == 'logout') {
                _logout(context);
              }
            },
            icon: Icon(Icons.account_circle, color: Colors.black),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.black),
                      SizedBox(width: 8),
                      Text('View Profile'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Container(
              color: Colors.yellow,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, Jey!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Semoga harimu menyenangkan!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(
                    label: 'Tugasku',
                    isSelected: _isTugasSelected,
                    onPressed: () {
                      setState(() {
                        _isTugasSelected = !_isTugasSelected;
                        _isProjekSelected = false;
                        _isCatatanSelected = false;
                      });
                    },
                  ),
                  _buildButton(
                    label: 'Projek',
                    isSelected: _isProjekSelected,
                    onPressed: () {
                      setState(() {
                        _isProjekSelected = !_isProjekSelected;
                        _isTugasSelected = false;
                        _isCatatanSelected = false;
                      });
                    },
                  ),
                  _buildButton(
                    label: 'Catatan',
                    isSelected: _isCatatanSelected,
                    onPressed: () {
                      setState(() {
                        _isCatatanSelected = !_isCatatanSelected;
                        _isTugasSelected = false;
                        _isProjekSelected = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Horizontal scroll area for cards
            Container(
              height: 200, // Set height for horizontal scroll
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final cardData = [
                    {
                      "title": "Mobile Programming",
                      "subtitle": "UTS",
                      "date": "17 Oktober 2024",
                      "color": Colors.yellow,
                    },
                    {
                      "title": "Pulau Dewata",
                      "subtitle": "Jalan-jalan",
                      "date": "24 Oktober 2024",
                      "color": Colors.yellow[200],
                    },
                    {
                      "title": "Kerja Kelompok",
                      "subtitle": "Progress",
                      "date": "3 hari yang lalu",
                      "color": Colors.yellow[100],
                    },
                  ];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250, // Set width of the card
                      decoration: BoxDecoration(
                        color: cardData[index]["color"] as Color,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardData[index]["subtitle"] as String,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(cardData[index]["title"] as String),
                            SizedBox(height: 5),
                            Text(cardData[index]["date"] as String),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Vertical scrollable progress section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 300,  // Set height for vertical scroll
              child: ListView(
                children: [
                  _buildProgressCard('UTS Studi Islam', '2 hari yang lalu'),
                  _buildProgressCard('Checkout 11.11', '6 hari yang lalu'),
                  _buildProgressCard('Kerja Kelompok', '1 minggu yang lalu'),
                  _buildProgressCard('Persiapan Ujian', '3 hari yang lalu'),
                  _buildProgressCard('Meeting dengan Klien', '2 hari yang lalu'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Jadwal'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: (index) {
          if (index == 0) {
            // Stay on the DashboardPage (no need to navigate)
            // Add any additional logic if necessary
          } else if (index == 1) {
            // Navigate to List Jadwal Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListJadwalPage()),
            );
          } else if (index == 2) {
            // Show notifications dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Notifikasi'),
                content: Text('Tidak ada notifikasi baru.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Tutup'),
                  ),
                ],
              ),
            );
          } else if (index == 3) {
            // Handle search
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          }
        },
      ),
    );
  }

  // Method to build a progress card
  Widget _buildProgressCard(String title, String subtitle) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.assignment, color: Colors.yellow[700]),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.more_vert, color: Colors.black),
      ),
    );
  }

  // Function to show profile details
  void _showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User Profile'),
          content: Text('Profile details can be shown here.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close profile dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to handle logout and navigate to login page
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Replace with your LoginPage
    );
  }

  // Function to build each button with arrow animation and yellow splash effect
  Widget _buildButton({
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.yellow, // Yellow splash color when clicked
      highlightColor: Colors.yellow.withOpacity(0.3), // Highlight color when pressed
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.transparent, // Yellow if selected
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey[800], // Black if selected
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            AnimatedCrossFade(
              firstChild: SizedBox.shrink(),
              secondChild: Icon(Icons.arrow_drop_down, color: Colors.black),
              crossFadeState: isSelected
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Masukkan tugas atau catatan untuk mencari.'),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Hasil pencarian akan muncul di sini.'),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
}
