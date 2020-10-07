class PlaceAutocomplete {
  final String placeId;
  final String description;

  PlaceAutocomplete(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}
