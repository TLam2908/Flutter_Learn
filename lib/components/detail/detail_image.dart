import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class DetailImage extends StatefulWidget {
  const DetailImage({super.key, required this.images});

  final List<String> images;

  @override
  State<DetailImage> createState() => _DetailImageState();
}

class _DetailImageState extends State<DetailImage> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.infinity,
          child: Swiper(
            itemCount: widget.images.length,
            scrollDirection: Axis.horizontal,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor: Colors.grey,
              ),
            ),
            control: SwiperControl(color: Colors.white),
            itemBuilder: (BuildContext context, int imageIndex) {
              return Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(widget.images[imageIndex]),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.share, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border, color: _isFavorited ? Colors.red : Colors.black),
                      onPressed: () {
                        final tapBar = SnackBar(
                          content: Text(
                            _isFavorited
                                ? "Removed from favorites"
                                : "Added to favorites",
                          ),
                          action: SnackBarAction(
                            label: "Undo",
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(tapBar);
                        _toggleFavorite();
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
