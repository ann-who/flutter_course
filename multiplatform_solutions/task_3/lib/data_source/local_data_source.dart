class LocalDataSource {
  var path = 'assets/avatars/';

  Map<String, String> getContacts() {
    Map<String, String> contactsList = {
      'Arlene McCoy': '${path}7.jpg',
      'Bessie Cooper': '${path}4.jpg',
      'Cameron Williamson': '${path}2.jpg',
      'Cody Fisher': '${path}15.jpg',
      'Courtney Henry': '${path}10.jpg',
      'Darrell Steward': '${path}20.jpg',
      'Dianne Russell': '${path}5.jpg',
      'Eleanor Pena': '${path}8.jpg',
      'Floyd Miles': '${path}19.jpg',
      'Guy Hawkins': '${path}13.jpg',
      'Jacob Jones': '${path}12.jpg',
      'Jane Cooper': '${path}1.jpg',
      'Jenny Wilson': '${path}3.jpg',
      'Kathryn Murphy': '${path}9.jpg',
      'Ralph Edwards': '${path}17.jpg',
      'Robert Fox': '${path}14.jpg',
      'Ronald Richards': '${path}18.jpg',
      'Savannah Nguyen': '${path}16.jpg',
      'Theresa Webb': '${path}6.jpg',
      'Wade Warren': '${path}11.jpg',
    };

    return contactsList;
  }
}
