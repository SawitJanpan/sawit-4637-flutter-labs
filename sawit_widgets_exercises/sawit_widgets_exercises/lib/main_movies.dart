import 'package:flutter/material.dart';

import '../models/movie_model.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light, // Light theme
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark, // Dark theme
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MovieListExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MovieListExample extends StatelessWidget {
  const MovieListExample({super.key});
  
    
  // Handle when a Movie is tapped
  void _handleMovieTap(BuildContext context, Movie movie) {
    String message;

    // Determine the message based on the movie rating
    if (movie.rating > 8.0) {
      message = "This is a highly rated movie!";
    } else if (movie.rating >= 6.0) {
      message = "This is a good movie";
    } else {
      message = "This movie might need improvement";
    }

    // Show a message using ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Create our list of faculties
    
    final List<Movie> movies =[
      Movie(
        title: "The Shawshank Redemption",
        year: 1994,
        genre: "Drama",
        director: "Frank Darabont",
        rating: 9.3,
      ),
      Movie(
        title: "Inception",
        year: 2010,
        genre: "Sci-Fi",
        director: "Christopher Nolan",
        rating: 7.8,
      ),
      Movie(
        title: "Disaster Movie",
        year: 2008,
        genre: "Comedy",
        director: "Jason Friedberg",
        rating: 1.9,
      ),
    ];



    return Scaffold(
      appBar: AppBar(title: const Text('Movie List')),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: movies.map((movie) {
          return ListTile(
            leading: Icon(
              Icons.movie,
              color: Theme.of(context).colorScheme.primary,
            ), // Systematic!),
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              '${movie.year} • ${movie.genre}\n Director: ${movie.director}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // Ensures the row takes up only as much space as needed
              children: [
                Icon(
                  Icons.star,
                  color: movie.rating >= 7.0
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4), // Adds spacing between the icon and the text
                Text(
                  movie.rating.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            onTap: () => _handleMovieTap(context, movie),
          );
        }).toList(),
      ),
    );
  }
}

// ============================================
// AI DOCUMENTATION
// - I use git hub repository https://github.com/krunapon/manee-flutter-codes/tree/main/manee_basic_widgets/lib/models for reference
// - I use slide flutter-widgets-part4 for see example widget to use ThemeData and Condition Using if…else… ,Statements Using Ternary Operator
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-07