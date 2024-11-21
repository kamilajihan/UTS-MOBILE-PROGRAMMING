import 'package:flutter/material.dart';
import 'create_task_page.dart';
import 'dashboard_page.dart'; // Import DashboardPage
import 'login_page.dart';

class ListJadwalPage extends StatefulWidget {
  @override
  _ListJadwalPageState createState() => _ListJadwalPageState();
}

class _ListJadwalPageState extends State<ListJadwalPage> {
  int _selectedIndex = 1; // Indeks awal di navbar (List Jadwal Page)
  String? selectedDate; // Track selected date

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Ubah indeks yang dipilih
    });

    // Navigasi berdasarkan indeks
    if (index == 0) {
      // Navigasi ke DashboardPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else if (index == 2) {
      // Tampilkan notifikasi
      _showNotificationDialog(context);
    } else if (index == 3) {
      // Buka pencarian
      showSearch(
        context: context,
        delegate: CustomSearchDelegate(),
      );
    }
  }

  void _onDateSelected(String date) {
    setState(() {
      selectedDate = date; // Update the selected date
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Jadwal', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
        elevation: 0,
        actions: [
          // Profile Icon with PopupMenuButton for profile options
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Header
          Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nov, 2024',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                // Baris tanggal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateItem('17', 'Min'),
                    _buildDateItem('18', 'Sen'),
                    _buildDateItem('19', 'Sel'),
                    _buildDateItem('20', 'Rab'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Daftar Tugas
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Tugas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    // Tambahkan scroll vertikal
                    Expanded(
                      child: ListView(
                        children: [
                          _buildTaskCard(
                              'UTS Mobile Programming', '10:00 - 14:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Ngerjakan Tugas', '18:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Rapat Kelompok', '16:00 - 17:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Studi Islam', '19:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Persiapan Presentasi', '14:00 - 15:30'),
                          SizedBox(height: 8),
                          _buildTaskCard('Kerjakan Soal Latihan', '21:00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow[700],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTaskPage()),
          );
        },
        icon: Icon(Icons.add, color: Colors.black),
        label: Text(
          'Create New Task',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex, // Indeks aktif
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Jadwal'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: _onItemTapped, // Fungsi navigasi
      ),
    );
  }

  Widget _buildDateItem(String day, String weekday) {
    bool isSelected = selectedDate == day; // Check if the date is selected
    return GestureDetector(
      onTap: () => _onDateSelected(day), // Update selected date on tap
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.0),
            child: Text(
              day,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.yellow : Colors.black,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            weekday,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String time) {
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
        subtitle: Text(time),
        trailing: Icon(Icons.more_vert, color: Colors.black),
      ),
    );
  }

  // Function to show the profile dialog
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
                Navigator.pop(context); // Close the profile dialog
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
      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to the login page
    );
  }

  void _showNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notifikasi'),
          content: Text('Tidak ada notifikasi baru.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // List of sample tasks for search suggestions and results
  final List<String> taskList = [
    'UTS Mobile Programming',
    'Ngerjakan Tugas',
    'Rapat Kelompok',
    'Studi Islam',
    'Persiapan Presentasi',
    'Kerjakan Soal Latihan',
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    // If the query is empty, show a hint
    if (query.isEmpty) {
      return Center(
        child: Text('Masukkan tugas atau catatan untuk mencari.'),
      );
    } else {
      // Show search suggestions based on the query
      final suggestionList = taskList.where((task) {
        return task.toLowerCase().contains(query.toLowerCase());
      }).toList();

      if (suggestionList.isEmpty) {
        // If no suggestions found, show a "no results" message
        return Center(
          child: Text('Tidak ada hasil yang ditemukan.'),
        );
      } else {
        // Show suggestions matching the query
        return ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestionList[index]),
              onTap: () {
                query = suggestionList[index]; // Set the selected suggestion as the query
                showResults(context); // Trigger the results view
              },
            );
          },
        );
      }
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    // If the query is empty, show a message
    if (query.isEmpty) {
      return Center(
        child: Text('Masukkan tugas atau catatan untuk mencari.'),
      );
    } else {
      // Show results based on the query
      final resultList = taskList.where((task) {
        return task.toLowerCase().contains(query.toLowerCase());
      }).toList();

      if (resultList.isEmpty) {
        // If no results found, show a "no results" message
        return Center(
          child: Text('Tidak ada hasil yang ditemukan.'),
        );
      } else {
        // Show the results matching the query
        return ListView.builder(
          itemCount: resultList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(resultList[index]),
            );
          },
        );
      }
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // Add a clear button to reset the search query
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
    // Add a back button to close the search bar
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search delegate
      },
    );
  }
}
