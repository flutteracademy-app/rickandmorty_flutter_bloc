class CharacterException implements Exception {
  String message;
  CharacterException([this.message = 'Something went wrong']) {
    message = 'Character Exception: $message';
  }

  @override
  String toString() {
    return message;
  }
}
