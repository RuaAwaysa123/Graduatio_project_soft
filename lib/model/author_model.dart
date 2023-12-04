class Author{
  String name;
  String imageUrl;

  Author({
    required this.name,
    required this.imageUrl
  });
}

final Author AYA = Author(
  name: 'Aya ',
  imageUrl: 'assets/images/pexels-brigitte-tohm-239581.jpg'
);

final Author Rua = Author(
  name: 'Rua ',
  imageUrl: 'assets/images/pexels-ylanite-koppens-776656.jpg'
);

final Author Nada = Author(
  name: 'Test 1',
  imageUrl: ''
);

final Author adam = Author(
  name: 'Adam ',
  imageUrl: 'assets/images/pexels-eberhard-grossgasteiger-1699021.jpg'
);
final Author Saly = Author(
  name: 'John john ',
  imageUrl: 'assets/images/pexels-eberhard-grossgasteiger-2088172.jpg'
);
final Author sam = Author(
  name: 'Saly',
  imageUrl: 'assets/images/pexels-eberhard-grossgasteiger-1699021.jpg'
);
final Author Ahmad = Author(
  name: 'Ahmmad',
  imageUrl: 'assets/images/pexels-irina-iriser-785293.jpg'
);

final List<Author> authors = [
  Nada,
  sam,
  Ahmad,
  adam,
  Saly,
  AYA,
  Rua
];
