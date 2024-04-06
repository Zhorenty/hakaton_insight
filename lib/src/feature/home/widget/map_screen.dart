import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizzle_starter/src/feature/home/widget/clusterized_icon_painter.dart';
import 'package:sizzle_starter/src/feature/home/widget/map_point.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;
  var _mapZoom = 0.0;

  CameraPosition? _userLocation;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            YandexMap(
              onMapCreated: (controller) async {
                _mapController = controller;
                await _initLocationLayer();
              },
              onCameraPositionChanged: (cameraPosition, _, __) {
                setState(() {
                  _mapZoom = cameraPosition.zoom;
                });
              },
              mapObjects: [
                _getClusterizedCollection(
                  placemarks: _getPlacemarkObjects(context),
                ),
              ],
              onUserLocationAdded: (view) async {
                // получаем местоположение пользователя
                _userLocation = await _mapController.getUserCameraPosition();
                // если местоположение найдено, центрируем карту относительно этой точки
                if (_userLocation != null) {
                  await _mapController.moveCamera(
                    CameraUpdate.newCameraPosition(
                      _userLocation!.copyWith(zoom: 10),
                    ),
                    animation: const MapAnimation(
                      type: MapAnimationType.linear,
                      duration: 0.3,
                    ),
                  );
                }
                // меняем внешний вид маркера - делаем его непрозрачным
                return view.copyWith(
                  pin: view.pin.copyWith(
                    opacity: 1,
                  ),
                );
              },
            ),
            Positioned(
              right: 10,
              bottom: 50,
              child: Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () => _changeZoom(delta: 1),
                    child: Icon(Icons.add),
                  ),
                  SizedBox(height: 20),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () => _changeZoom(delta: -1),
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  void _changeZoom({required double delta}) async {
    final newZoom = _mapZoom + delta;
    await _mapController.moveCamera(
      CameraUpdate.zoomTo(newZoom),
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 1.0),
    );
  }

  /// Метод для получения коллекции кластеризованных маркеров
  ClusterizedPlacemarkCollection _getClusterizedCollection({
    required List<PlacemarkMapObject> placemarks,
  }) =>
      ClusterizedPlacemarkCollection(
          mapId: const MapObjectId('clusterized-1'),
          placemarks: placemarks,
          radius: 50,
          minZoom: 15,
          onClusterAdded: (self, cluster) async => cluster.copyWith(
                appearance: cluster.appearance.copyWith(
                  opacity: 1.0,
                  icon: PlacemarkIcon.single(
                    PlacemarkIconStyle(
                      image: BitmapDescriptor.fromBytes(
                        await ClusterIconPainter(cluster.size)
                            .getClusterIconBytes(),
                      ),
                    ),
                  ),
                ),
              ),
          onClusterTap: (self, cluster) async {
            await _mapController.moveCamera(
              animation: const MapAnimation(
                type: MapAnimationType.linear,
                duration: 0.3,
              ),
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: cluster.placemarks.first.point,
                  zoom: _mapZoom + 1,
                ),
              ),
            );
          });

  /// Метод, который включает слой местоположения пользователя на карте
  /// Выполняется проверка на доступ к местоположению, в случае отсутствия
  /// разрешения - выводит сообщение
  Future<void> _initLocationLayer() async {
    final locationPermissionIsGranted =
        await Permission.location.request().isGranted;

    if (locationPermissionIsGranted) {
      await _mapController.toggleUserLayer(visible: true);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Нет доступа к местоположению пользователя'),
          ),
        );
      });
    }
  }
}

/// Метод для генерации точек на карте
List<MapPoint> _getMapPoints() => const [
      MapPoint(name: 'Москва', latitude: 55.755864, longitude: 37.617698),
      MapPoint(name: 'Лондон', latitude: 51.507351, longitude: -0.127696),
      MapPoint(name: 'Рим', latitude: 41.887064, longitude: 12.504809),
      MapPoint(name: 'Париж', latitude: 48.856663, longitude: 2.351556),
      MapPoint(name: 'Стокгольм', latitude: 59.347360, longitude: 18.341573),
    ];

/// Метод для генерации объектов маркеров для отображения на карте
List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) =>
    _getMapPoints()
        .map(
          (point) => PlacemarkMapObject(
            mapId: MapObjectId('MapObject $point'),
            point: Point(latitude: point.latitude, longitude: point.longitude),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/icons/map_point.png',
                ),
                scale: 2,
              ),
            ),
            onTap: (_, __) => showModalBottomSheet(
              context: context,
              builder: (context) => _ModalBodyView(
                point: point,
              ),
            ),
          ),
        )
        .toList();

/// Содержимое модального окна с информацией о точке на карте
class _ModalBodyView extends StatelessWidget {
  const _ModalBodyView({required this.point});

  final MapPoint point;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(point.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text(
              '${point.latitude}, ${point.longitude}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
}
