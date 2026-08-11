class VideoData {
  // Lien de test HLS (.m3u8) pour vérifier si le lecteur fonctionne
  static const String defaultVideoUrl =
      'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8';

  // Dictionnaire des vidéos associées aux films
  static const Map<String, String> movieVideos = {
    "Moana":
        "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8",
    "Avatar":
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "Kung Fu Panda":
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  };
}
