import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class DetailMap extends StatefulWidget {
  const DetailMap({
    super.key,
    required this.address,
    this.height = 350.0,
  });

  final String address;
  final double height;

  @override
  State createState() => _DetailMapState();
}

class _DetailMapState extends State<DetailMap> {
  final MapController _mapController = MapController();

  double _zoom = 10;
  LatLng? _currentLocation;

  void zoomIn () {
    setState(() {
      _zoom = _zoom + 1; // Increase zoom level
    });
  }

  void zoomOut() {
    if (_zoom > 0) { // Prevent zoom from going below 0
      setState(() {
        _zoom = _zoom - 1; // Decrease zoom level
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _placeCurrentLocation();
  }

  Future _placeCurrentLocation() async {
    final LatLng latLng = await _getLaLng(widget.address);
    if (mounted) {
      setState(() {
        _currentLocation = latLng;
        _mapController.move(latLng, 15);
      });
    }
  }

  Future _getLaLng(String address) async {
    try {
      final List locations = await locationFromAddress(address);
      final Location location = locations.first;
      return LatLng(location.latitude, location.longitude);
    } catch (e) {
      print('Error getting location: $e');
      return LatLng(0, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Text(
              'Where You\'ll Be',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),

          // Map Section
          SizedBox(
            height: widget.height,
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _currentLocation ?? LatLng(0, 0),
                    initialZoom: _zoom,
                    minZoom: 0,
                    maxZoom: 20,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                    if (_currentLocation != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _currentLocation!,
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.place,
                              color: Colors.pink,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),

                // Floating Action Button
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    onPressed: _placeCurrentLocation,
                    backgroundColor: Colors.pink,
                    child: const Icon(
                        Icons.my_location,
                        size: 20,
                        color: Colors.white
                    ),
                  ),
                ),

                // Positioned(
                //   top: 16,
                //   right: 16,
                //   child: FloatingActionButton(
                //     onPressed: zoomOut,
                //     backgroundColor: Colors.pink,
                //     child: const Icon(
                //         Icons.zoom_out,
                //         size: 20,
                //         color: Colors.white
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}