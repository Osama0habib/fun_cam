class AppConstant {
  static const String assetEffectsPath = 'assets/effects';
  static const String appName = "Fun Cam";
  static const String assetFiltersPath = 'assets/filters';
  static const String assetMasksPath = 'assets/masks';
  static  String assetImagesPath(String image) => 'assets/images/$image';
  static String getFileName(String path) => path.split("/").last.split(".").first.replaceAll("_", " ");
  static String getImageName(String path) => "${path.split("/").last.split(".").first}.png";

}