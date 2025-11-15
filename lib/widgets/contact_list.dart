import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  final List<Contact> contacts = const [
    Contact('Ahmad Rizki', '08123456789', Status.online),
    Contact('Siti Aminah', '08234567890', Status.offline),
    Contact('Budi Santoso', '08345678901', Status.away),
    Contact('Dewi Lestari', '08456789012', Status.online),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) => ContactCard(contact: contacts[index]),
    );
  }
}

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(Icons.person, color: Colors.orange.shade700),
        ),
        title: Text(contact.name),
        subtitle: Text(contact.phoneNumber),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: _getStatusColor(contact.status),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              icon: Icon(Icons.call, color: Colors.orange.shade700),
              onPressed: () => _showCallDialog(context, contact),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(Status status) {
    switch (status) {
      case Status.online: return Colors.green;
      case Status.offline: return Colors.grey;
      case Status.away: return Colors.orange;
    }
  }

  void _showCallDialog(BuildContext context, Contact contact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Memanggil Kontak'),
        content: Text('Memanggil ${contact.name} - ${contact.phoneNumber}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Memanggil ${contact.name}...')),
              );
            },
            child: const Text('Panggil'),
          ),
        ],
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  final Status status;

  const Contact(this.name, this.phoneNumber, this.status);
}

enum Status { online, offline, away }