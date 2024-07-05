import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/bookingscreen.dart';
import 'package:flutter_application_test/src/technicianmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late GoogleMapController mapController;
  // final LatLng _center = const LatLng(45.521563, -122.677433);
  LatLng? _currentLocation;
  final TextEditingController _searchController = TextEditingController();
  Technicianmodel technicianmodel1 =
      Technicianmodel("assets/images/tech_1.png", "A. Sen", 26, 850.0, 5);
  Technicianmodel technicianmodel2 =
      Technicianmodel("assets/images/tech_2.png", "A. Ganguly", 25, 850.0, 5);
  Technicianmodel technicianmodel3 =
      Technicianmodel("assets/images/tech_3.png", "S. Singh", 26, 850.0, 5);
  Technicianmodel technicianmodel4 =
      Technicianmodel("assets/images/tech_4.png", "R. Sharma", 27, 850.0, 4);
  List<Technicianmodel> technicianList = [];
  List<Technicianmodel> technicianListReplica = [];
  @override
  void initState() {
    super.initState();

    // Add TechnicianModel instances to the list in initState() or other methods
    technicianList.add(technicianmodel1);
    technicianList.add(technicianmodel2);
    technicianList.add(technicianmodel3);
    technicianList.add(technicianmodel4);

    technicianListReplica.addAll(technicianList);
  }

  //static const LatLng _center = LatLng(45.521563, -122.677433);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getCurrentLocation();
  }

  void filterList(var value) {
    for (Technicianmodel technicianmodel in technicianList) {
      if (technicianmodel.name == value) {
        _buildList(technicianmodel, technicianList);
      } else {
        _buildList(null, technicianList);
      }
    }
  }

  void _buildList(
      Technicianmodel? technicianmodel, List<Technicianmodel> techList) {
    setState(() {
      if (technicianmodel != null) {
        technicianList.removeRange(0, technicianList.length - 1);
        technicianList.add(technicianmodel);
      } else {
        technicianList.removeRange(0, technicianList.length - 1);
        technicianList.addAll(technicianListReplica);
      }
    });
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    setState(() {
      _currentLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
    });

    mapController.animateCamera(
      CameraUpdate.newLatLng(_currentLocation!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: Column(
        children: [
          // Expanded(
          //   flex: 2,
          //   child: GoogleMap(
          //     onMapCreated: _onMapCreated,
          //     initialCameraPosition: CameraPosition(
          //       target: _center,
          //       zoom: 11.0,
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/map_dummy.png'), // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search therapists',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {
                      // You can add the logic to filter the list based on the search query here
                      filterList(value);
                    },
                  ),
                ),
                Expanded(
                  // flex: 3,
                  child: ListView.builder(
                    itemCount: technicianList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage(technicianList[index].imageUrl),
                          ),
                          title: Text(technicianList[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${technicianList[index].age} years old'),
                              Row(
                                children: [
                                  const Icon(Icons.access_time, size: 16),
                                  Text(
                                      ' Rs. ${technicianList[index].hourlyCharge.toStringAsFixed(2)}/Hr.'),
                                ],
                              ),
                              Row(
                                children: List.generate(
                                  technicianList[index].rating,
                                  (index) => const Icon(Icons.star,
                                      size: 16, color: Colors.amber),
                                ),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Implement your booking logic here
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BookingScreen()),
                              );
                            },
                            child: const Text('Book Now'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
