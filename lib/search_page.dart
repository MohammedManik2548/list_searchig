import 'package:flutter/material.dart';

import 'movie_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
   var main_movie_list = <MovieModel>[
    MovieModel(
      'The Shawshank Redemption',
      1994,
      'https://images.unsplash.com/photo-1675353095458-2d570fead8a0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fG1vdmllJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
      9.3,
    ),
    MovieModel(
      'The Dark knight',
      1994,
      'https://plus.unsplash.com/premium_photo-1683697495454-cd2a48b5a2ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      9.3,
    ),
    MovieModel(
      'Santana',
      1994,
      'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fG1vdmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
      9.3,
    ),
    MovieModel(
      'Spider Man',
      1994,
      'https://images.unsplash.com/photo-1616530940355-351fabd9524b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG1vdmllfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
      9.3,
    ),
    MovieModel(
      'Arabik',
      1994,
      'https://plus.unsplash.com/premium_photo-1683740129052-be35f1d6ce3e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bW92aWV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
      9.3,
    ),
  ];
  var display_list = <MovieModel>[];
  @override
  void initState() {
    display_list = main_movie_list;
    super.initState();
  }

  void updateList(String value) {
    setState(() {
      display_list = main_movie_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xff1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Search for a movie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (v) {
                updateList(v);
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search,color: Colors.white,),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: display_list.isEmpty
                  ? const Center(
                    child:  Text(
                        'No Result',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          title: Text(
                            display_list[index].movie_title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "${display_list[index].moie_release_year!}",
                            style: const TextStyle(
                              color: Colors.white60,
                            ),
                          ),
                          trailing: Text(
                            '${display_list[index].ratting!}',
                            style: const TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(display_list[index].movie_poster_url!),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
