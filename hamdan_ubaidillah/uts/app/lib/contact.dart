import 'package:flutter/material.dart';

final List<Map<String, String>> contactList = [
  {"name": "ujang", "phone": "123"},
  {"name": "tatang", "phone": "0123"},
  {"name": "tatang", "phone": "123"},
];

class AddContactState extends StatefulWidget {
  const AddContactState({super.key});

  @override
  State<AddContactState> createState() {
    return AddContact();
  }
}

class AddContact extends State<AddContactState> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Contact")),
      body: Container(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
              controller: name,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Telepon",
                border: OutlineInputBorder(),
              ),
              controller: phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                contactList.add({"name": name.text, "phone": phone.text});
                Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (context) => ContactState()),
                );
              },
              child: Text("Tambah"),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactState extends StatefulWidget {
  const ContactState({super.key});

  @override
  State<ContactState> createState() {
    return Contact();
  }
}

class Contact extends State<ContactState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Telepon", style: TextStyle(color: Colors.white)),
            Spacer(),
            TextButton.icon(
              label: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => AddContactState(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ContactListState(),
    );
  }
}

class ContactListState extends StatefulWidget {
  const ContactListState({super.key});

  @override
  State<ContactListState> createState() {
    return ContactList();
  }
}

class ContactList extends State<ContactListState> {
  int? exandedIdx;

  Widget contactCard(int index) {
    bool isExanded = exandedIdx == index;

    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          visualDensity: VisualDensity.comfortable,
          onTap: () {
            setState(() {
              exandedIdx = isExanded ? null : index;
            });
          },
          title: Text(contactList[index]["name"] ?? ""),
        ),

        if (isExanded)
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Ponsel ${contactList[index]["phone"]}"),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: contactCard(index),
            ),
          ],
        );
      },
    );
  }
}
