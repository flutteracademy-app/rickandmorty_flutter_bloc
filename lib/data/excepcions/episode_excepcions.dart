class EpisodeException implements Exception {
  String message;
  EpisodeException([this.message = 'Something went wrong']) {
    message = 'Episode Exception: $message';
  }

  @override
  String toString() {
    return message;
  }
}
