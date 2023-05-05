import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: const UserList(),
      appBar: AppBar(
        title: const Text("Butterflies species"),
        centerTitle: true,
      ),
    ),
  ));
}

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  int _SelectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHorizontalList(),
        _buildSpacer(20),
        _buildText(),
        _buildSpacer(10),
        _buildImage(),
      ],
    );
  }

  Widget _buildHorizontalList (){
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(20),
        itemCount: butterflies.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
          width: 160,
          child: ListTile(
            onTap: () {
              setState(() {
                _SelectedIndex = index;
              });
            },
            title: Text(
              butterflies.elementAt(index).name,
              style: const TextStyle(fontSize: 24, color: Colors.blue),
            ),
            selected: index == _SelectedIndex,
            selectedTileColor: Colors.black12,
          ),
          );
        }),
    );
  }

  Widget _buildText() {
    return Text(
      _SelectedIndex == -1 ? ('') : butterflies.elementAt(_SelectedIndex).desc,
      style: const TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 3, 78, 140),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildImage() {
    return _SelectedIndex == -1
        ? const Text(
      'Choose a butterfly',
      style: TextStyle(fontSize: 24, color: Colors.blue),
    )
        : Image.asset(
      butterflies.elementAt(_SelectedIndex).image,
      width: 200,
    );
  }
}

Widget _buildSpacer(double space) {
  return SizedBox(
    height: space,
  );
}

class Species {
  String name;
  String desc;
  String image;

  Species({
    required this.name,
    required this.desc,
    required this.image,
  });
}

List <Species> butterflies = [
  Species(
    name: 'Monarch',
    desc: "The monarch butterfly or simply monarch (Danaus plexippus) is a milkweed butterfly (subfamily Danainae) in the family Nymphalidae.",
    image: 'assets/images/monarch.jpg',
  ),
  Species(name: 'Red Admiral',
      desc: "Vanessa atalanta, the red admiral or, previously, the red admirable, is a well-characterized, medium-sized butterfly with black wings, red bands, and white spots. It has a wingspan of about 2 inches (5 cm)",
      image: 'assets/images/red.jpg'),
  Species(
      name: 'Tiger swallowtail',
      desc: "Papilio glaucus, the eastern tiger swallowtail, is a species of swallowtail butterfly native to eastern North America. It is one of the most familiar butterflies in the eastern United States, where it is common in many different habitats.",
      image: 'assets/images/tiger.jpg'),
];

