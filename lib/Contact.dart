class Contact {
  final String name;
  final String nickname;
  final String position;
  final String img;

  const Contact(
      {required this.name,
      required this.nickname,
      required this.position,
      required this.img});
}

const allContacts = [
  Contact(
      name: 'Adam Live',
      nickname: 'Adam',
      position: 'UX/UI Designer',
      img: 'assets/images/img1.png'),
  Contact(
      name: 'BA Gala',
      nickname: 'Gaga',
      position: 'UX/UI Designer',
      img: 'assets/images/img1.png'),
  Contact(
      name: 'Adam Rally',
      nickname: 'Rallyr',
      position: 'UX/UI Designer',
      img: 'assets/images/img4.png'),
  Contact(
      name: 'Cally Lim',
      nickname: 'Call',
      position: 'UX/UI Designer',
      img: 'assets/images/img3.png'),
  Contact(
      name: 'BB Jally',
      nickname: 'Jall',
      position: 'UX/UI Designer',
      img: 'assets/images/img4.png'),
  Contact(
      name: 'Cany Kit',
      nickname: 'Candy',
      position: 'UX/UI Designer',
      img: 'assets/images/img2.png')
];
