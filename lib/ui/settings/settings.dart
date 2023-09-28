import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isEnabled = false;

  void toggleSwitch() {
    setState(() {
      isEnabled = !isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        leading: IconButton(icon: const Icon(Icons.arrow_back),
        onPressed: () => (Navigator.of(context).pop()),
      ),
      ),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Section "Partager"
            _buildSectionHeader('Partager'),
            _buildListItem('Invite un ami', Icons.share),
            _buildListItem('Code promo', Icons.star),

            // Section "Support technique"
            _buildSectionHeader('Support technique'),
            _buildListItem('Appeler le support client', Icons.phone),
            _buildListItem('Trouver un agent', Icons.people),

            // Section "Réinitialiser le mot de passe"
            _buildSectionHeader('Réinitialiser le mot de passe'),
            _buildListItem('Réinitialiser le mot de passe', Icons.lock),

            // Section "Dark Mode"
            _buildSectionHeader('Dark Mode'),
            _buildDarkModeSwitch(),

            // Section "Se déconnecter"
            _buildSectionHeader('Se déconnecter'),
            _buildListItem('Se déconnecter', Icons.logout),

            // Section "Version"
            _buildVersionInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListItem(String text, IconData icon) {
    return InkWell(
      onTap: () {
        // Actions à effectuer lorsque l'élément est cliqué
      },
      child: Row(
        children: [
          Icon(icon, size: 25, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildDarkModeSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Dark Mode',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: isEnabled,
          onChanged: (value) {
            toggleSwitch();
          },
          activeColor: Colors.amber,
          activeTrackColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildVersionInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud, size: 25),
            Icon(Icons.note, size: 25),
          ],
        ),
        Text(
          'Version 1.0.0',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.spellcheck, size: 25),
            Text(
              'Conditions d\'utilisation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.policy, size: 25),
            Text(
              'Avis de confidentialité',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
