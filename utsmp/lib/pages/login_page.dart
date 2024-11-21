import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Pastikan ini adalah path ke DashboardPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100], // Background kuning pucat
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Clover menggunakan ikon bawaan
                Icon(
                  Icons.local_florist, // Ikon yang mirip clover
                  size: 100,
                  color: Colors.yellow[800], // Warna kuning gelap
                ),
                SizedBox(height: 16),

                // Judul
                Text(
                  "Jadwalku",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow[800], // Warna kuning
                  ),
                ),
                SizedBox(height: 8),

                // Subjudul
                Text(
                  "Selamat Datang\nKAMILA JIHAN - 4122036",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellow[700], // Warna kuning
                  ),
                ),
                SizedBox(height: 32),

                // Input Username
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.yellow[800]),
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Input Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.yellow[800]),
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Tombol Login
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke DashboardPage
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[800], // Warna kuning
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Divider "or"
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[400])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[400])),
                  ],
                ),
                SizedBox(height: 16),

                // Tombol Google
                ElevatedButton.icon(
                  onPressed: () {
                    // Tambahkan aksi untuk login dengan Google
                  },
                  icon: Icon(Icons.email, color: Colors.yellow[800]),
                  label: Text("Sign in with Google Account"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.yellow[800],
                    side: BorderSide(color: Colors.yellow[800]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                SizedBox(height: 16),

                // Tombol Phone Number
                ElevatedButton.icon(
                  onPressed: () {
                    // Tambahkan aksi untuk login dengan nomor telepon
                  },
                  icon: Icon(Icons.phone, color: Colors.yellow[800]), // Ikon telepon
                  label: Text("Sign in with Phone Number"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.yellow[800],
                    side: BorderSide(color: Colors.yellow[800]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
