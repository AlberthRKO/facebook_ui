class Storie {
  const Storie({
    required this.previewStory,
    required this.userImage,
    required this.userName,
  });

  final String previewStory;
  final String userImage;
  final String userName;
}

List<Storie> stories = List.of({
  const Storie(
    previewStory: 'assets/common/perfil/profile.jpg',
    userImage: 'none',
    userName: 'Crear historia',
  ),
  const Storie(
    previewStory: 'assets/images/people/mao_lop.png',
    userImage: 'assets/images/people/mao_lop.png',
    userName: 'Mao',
  ),
  const Storie(
    previewStory: 'assets/images/stories/fernanda_preview.png',
    userImage: 'assets/images/people/fernanda.png',
    userName: 'Fernanda',
  ),
  const Storie(
    previewStory: 'assets/images/stories/james_preview.png',
    userImage: 'assets/images/people/james.png',
    userName: 'James',
  ),
  const Storie(
    previewStory: 'assets/images/stories/samanta_preview.png',
    userImage: 'assets/images/people/samanta_smith.jpeg',
    userName: 'Samanta',
  ),
  const Storie(
    previewStory: 'assets/images/stories/marcus_preview.png',
    userImage: 'assets/images/people/marcus_dail.jpeg',
    userName: 'Marcus',
  ),
  const Storie(
    previewStory: 'assets/images/stories/cloe_preview.png',
    userImage: 'assets/images/people/cloe_thompson.jpeg',
    userName: 'Cloe',
  ),
});
