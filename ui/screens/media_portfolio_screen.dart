import 'package:firebase_projects/Media%20Portfolio%20Explorer/provider/media_provider.dart';
import 'package:firebase_projects/Media%20Portfolio%20Explorer/ui/screens/media_home_screen.dart';
import 'package:firebase_projects/Media%20Portfolio%20Explorer/widgets/filter_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaPortfolioScreen extends StatelessWidget {
  const MediaPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0992C2),
        title: Text(
          "My Personal Projects",
          style: TextStyle(
            fontSize: 22,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,

        bottom: PreferredSize(
          preferredSize: const .fromHeight(80),
          child: Padding(
            padding: const .all(16),
            child: Consumer<MediaProvider>(
              builder: (context, provider, child) {
                return TextField(
                  onChanged: provider.search,
                  decoration: InputDecoration(
                    hintText: "Search Media.........",
                    hintStyle: TextStyle(fontSize: 15),
                    prefixIcon: Icon(Icons.search, color: Colors.blue),
                    suffixIcon: provider.searchQuery.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              provider.search("query");
                              FocusScope.of(context).unfocus();
                            },
                            icon: Icon(Icons.clear, color: Colors.blue),
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: .circular(50),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(50),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: .circular(50),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    fillColor: Colors.grey[50],
                    filled: true,
                    contentPadding: const .symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          const FilterChips(),
          const Expanded(child: MediaGrid()),
        ],
      ),
    );
  }
}
