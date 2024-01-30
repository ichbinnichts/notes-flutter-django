class Urls {
  String baseUrl = 'http://localhost:8000';

  String getNotesUrl() {
    return '$baseUrl/notes/';
  }

  String createNoteUrl() {
    return '$baseUrl/notes/create';
  }

  String deleteNoteUrl(int id) {
    return '$baseUrl/notes/$id/delete/';
  }

  String updateNoteUrl(int id) {
    return '$baseUrl/notes/$id/update/';
  }
}
