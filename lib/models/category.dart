class Category {
  final String id;
  final String title;
  final int color;

  const Category({
    required this.id,
    required this.title,
    this.color = 0xffffa500,
  });
}
