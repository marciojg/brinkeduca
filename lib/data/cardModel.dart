class CardModel {
  String _imageAssetPath;
  bool _isSelected;

  CardModel(this._imageAssetPath, [this._isSelected = false]);

  String get getImageAssetPath {
    return _imageAssetPath;
  }

  void setIsSelected(bool selected) {
    _isSelected = selected;
  }

  bool get getIsSelected {
    return _isSelected;
  }
}