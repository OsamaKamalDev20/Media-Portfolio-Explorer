import 'dart:async';
import '../models/media_item.dart';

class MockApiService {
  // Simulates network delay
  Future<List<MediaItem>> fetchMediaItems({String query = ''}) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Mock data with varied aspect ratios
    final List<MediaItem> allItems = [
      // Original 10 items (keep these)
      MediaItem(
        id: '1',
        title: 'Mountain Landscape',
        url: 'https://picsum.photos/id/1015/800/600',
        type: MediaType.image,
        aspectRatio: 1.5,
      ),
      MediaItem(
        id: '2',
        title: 'Portrait',
        url: 'https://picsum.photos/id/100/600/800',
        type: MediaType.image,
        aspectRatio: 0.75,
      ),
      MediaItem(
        id: '3',
        title: 'Square Art',
        url: 'https://picsum.photos/id/101/800/800',
        type: MediaType.image,
        aspectRatio: 1.0,
      ),
      MediaItem(
        id: '4',
        title: 'Wide Panorama',
        url: 'https://picsum.photos/id/1018/1200/400',
        type: MediaType.image,
        aspectRatio: 3.0,
      ),
      MediaItem(
        id: '5',
        title: 'City View',
        url: 'https://picsum.photos/id/1043/800/600',
        type: MediaType.image,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '6',
        title: 'Ocean Waves',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '7',
        title: 'Time Lapse',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '8',
        title: 'Nature',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.0,
      ),
      MediaItem(
        id: '9',
        title: 'Architecture',
        url: 'https://picsum.photos/id/1044/800/600',
        type: MediaType.image,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '10',
        title: 'Abstract',
        url: 'https://picsum.photos/id/106/800/800',
        type: MediaType.image,
        aspectRatio: 1.0,
      ),

      // 40 NEW IMAGES (IDs 11-50)
      // Nature & Landscapes (11-20)
      MediaItem(
        id: '11',
        title: 'Forest Stream',
        url: 'https://picsum.photos/id/1047/800/600',
        type: MediaType.image,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '12',
        title: 'Sunset Beach',
        url: 'https://picsum.photos/id/1011/800/600',
        type: MediaType.image,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '13',
        title: 'Waterfall',
        url: 'https://picsum.photos/id/1022/600/800',
        type: MediaType.image,
        aspectRatio: 0.75,
      ),
      MediaItem(
        id: '14',
        title: 'Desert Dunes',
        url: 'https://picsum.photos/id/1025/1200/600',
        type: MediaType.image,
        aspectRatio: 2.0,
      ),
      MediaItem(
        id: '15',
        title: 'Snow Peaks',
        url: 'https://picsum.photos/id/1026/800/600',
        type: MediaType.image,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '16',
        title: 'Autumn Leaves',
        url: 'https://picsum.photos/id/1027/600/600',
        type: MediaType.image,
        aspectRatio: 1.0,
      ),
      MediaItem(
        id: '17',
        title: 'Tropical Paradise',
        url: 'https://picsum.photos/id/1028/800/500',
        type: MediaType.image,
        aspectRatio: 1.6,
      ),
      MediaItem(
        id: '18',
        title: 'Northern Lights',
        url: 'https://picsum.photos/id/1029/900/600',
        type: MediaType.image,
        aspectRatio: 1.5,
      ),
      MediaItem(
        id: '19',
        title: 'Canyon View',
        url: 'https://picsum.photos/id/1030/1000/400',
        type: MediaType.image,
        aspectRatio: 2.5,
      ),
      MediaItem(
        id: '20',
        title: 'Misty Mountains',
        url: 'https://picsum.photos/id/1031/800/1000',
        type: MediaType.image,
        aspectRatio: 0.8,
      ),

      // Urban & Architecture (21-30)
      MediaItem(
        id: '21',
        title: 'Skyscraper',
        url: 'https://picsum.photos/id/1032/600/900',
        type: MediaType.image,
        aspectRatio: 0.67,
      ),
      MediaItem(
        id: '22',
        title: 'Street Photography',
        url: 'https://picsum.photos/id/1033/800/600',
        type: MediaType.image,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '23',
        title: 'Bridge at Night',
        url: 'https://picsum.photos/id/1034/1200/600',
        type: MediaType.image,
        aspectRatio: 2.0,
      ),
      MediaItem(
        id: '24',
        title: 'Modern Building',
        url: 'https://picsum.photos/id/1035/600/800',
        type: MediaType.image,
        aspectRatio: 0.75,
      ),
      MediaItem(
        id: '25',
        title: 'City Traffic',
        url: 'https://picsum.photos/id/1036/800/450',
        type: MediaType.image,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '26',
        title: 'Subway Station',
        url: 'https://picsum.photos/id/1037/800/800',
        type: MediaType.image,
        aspectRatio: 1.0,
      ),
      MediaItem(
        id: '27',
        title: 'Historic Building',
        url: 'https://picsum.photos/id/1038/700/900',
        type: MediaType.image,
        aspectRatio: 0.78,
      ),
      MediaItem(
        id: '28',
        title: 'Rooftop View',
        url: 'https://picsum.photos/id/1039/1000/600',
        type: MediaType.image,
        aspectRatio: 1.67,
      ),
      MediaItem(
        id: '29',
        title: 'Alley Way',
        url: 'https://picsum.photos/id/1040/600/900',
        type: MediaType.image,
        aspectRatio: 0.67,
      ),
      MediaItem(
        id: '30',
        title: 'Train Station',
        url: 'https://picsum.photos/id/1041/900/600',
        type: MediaType.image,
        aspectRatio: 1.5,
      ),

      // People & Portraits (31-40)
      MediaItem(
        id: '31',
        title: 'Smiling Face',
        url: 'https://picsum.photos/id/1042/600/800',
        type: MediaType.image,
        aspectRatio: 0.75,
      ),
      MediaItem(
        id: '32',
        title: 'Artist at Work',
        url: 'https://picsum.photos/id/1045/800/600',
        type: MediaType.image,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '33',
        title: 'Street Musician',
        url: 'https://picsum.photos/id/1046/600/900',
        type: MediaType.image,
        aspectRatio: 0.67,
      ),
      MediaItem(
        id: '34',
        title: 'Silhouette',
        url: 'https://picsum.photos/id/1048/800/1000',
        type: MediaType.image,
        aspectRatio: 0.8,
      ),
      MediaItem(
        id: '35',
        title: 'Dancer',
        url: 'https://picsum.photos/id/1049/600/800',
        type: MediaType.image,
        aspectRatio: 0.75,
      ),
      MediaItem(
        id: '36',
        title: 'Chef Cooking',
        url: 'https://picsum.photos/id/1050/800/600',
        type: MediaType.image,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '37',
        title: 'Yoga Session',
        url: 'https://picsum.photos/id/1051/900/600',
        type: MediaType.image,
        aspectRatio: 1.5,
      ),
      MediaItem(
        id: '38',
        title: 'Group Photo',
        url: 'https://picsum.photos/id/1052/1000/600',
        type: MediaType.image,
        aspectRatio: 1.67,
      ),
      MediaItem(
        id: '39',
        title: 'Business Meeting',
        url: 'https://picsum.photos/id/1053/800/500',
        type: MediaType.image,
        aspectRatio: 1.6,
      ),
      MediaItem(
        id: '40',
        title: 'Festival Crowd',
        url: 'https://picsum.photos/id/1054/1200/600',
        type: MediaType.image,
        aspectRatio: 2.0,
      ),

      // 10 NEW VIDEOS (IDs 41-50)
      MediaItem(
        id: '41',
        title: 'Sunset Timelapse',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '42',
        title: 'City Traffic Timelapse',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '43',
        title: 'Vertical Video Story',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 0.56, // 9:16 vertical
      ),
      MediaItem(
        id: '44',
        title: 'Square Instagram Video',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.0,
      ),
      MediaItem(
        id: '45',
        title: 'Cinematic Wide Shot',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 2.35, // Cinematic
      ),
      MediaItem(
        id: '46',
        title: 'Product Showcase',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '47',
        title: 'Tutorial Video',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '48',
        title: 'Drone Footage',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '49',
        title: 'Slow Motion Clip',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '50',
        title: '360 Video Preview',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 2.0,
      ),

      // 10 EXTRA VIDEOS (IDs 51-60) - Going beyond 50 to give you variety
      MediaItem(
        id: '51',
        title: 'Cooking Tutorial',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '52',
        title: 'Workout Session',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 0.75,
      ),
      MediaItem(
        id: '53',
        title: 'Music Video',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '54',
        title: 'Behind the Scenes',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '55',
        title: 'Interview Clip',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '56',
        title: 'Animation Short',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '57',
        title: 'Gameplay Recording',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '58',
        title: 'Travel Vlog',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
      MediaItem(
        id: '59',
        title: 'Unboxing Video',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        type: MediaType.video,
        aspectRatio: 1.33,
      ),
      MediaItem(
        id: '60',
        title: 'Live Performance',
        url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        type: MediaType.video,
        aspectRatio: 1.78,
      ),
    ];
    // Filter by search query
    if (query.isNotEmpty) {
      return allItems
          .where(
            (item) => item.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    return allItems;
  }
}
