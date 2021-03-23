class CardModel {
  String imageAssetPath;
  bool isSelected;

  CardModel(this.imageAssetPath, { this.isSelected = false });

  void setImageAssetPath(String imagePath) {
    imageAssetPath = imagePath;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  void setIsSelected(bool selected) {
    isSelected = selected;
  }

  bool getIsSelected() {
    return isSelected;
  }
}