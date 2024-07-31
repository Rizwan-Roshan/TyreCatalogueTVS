import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Define a ScrollController to control scrolling
  final ScrollController _scrollController = ScrollController();

  // Map input strings to image indices
  final Map<String, int> stringToImageIndex = {
    'roadhound': 2,
    'protorq extreme': 3,
    'protorq sport xr': 4,
    'protorq sport hr': 5,
    'protorq sport bf': 6,
    'protorq sport sr': 7,
    // Add more mappings as needed for other strings
  };

  // List of all available options
  final List<String> allOptions = [
    'roadhound',
    'protorq extreme',
    'protorq sport xr',
    'protorq sport hr',
    'protorq sport bf',
    'protorq sport sr',
    // Add more options as needed
  ];

  // Filtered options based on user input
  List<String> filteredOptions(String input) {
    input = input.toLowerCase();
    return allOptions.where((option) => option.toLowerCase().contains(input)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 84, 166, 0.9),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  'Tyre Catalogue',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Implement your search functionality here
                },
              ),
              Expanded(
                flex: 1,
                child: _buildSearchField(),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
            side: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            controller: _scrollController, // Assign the ScrollController
            child: Column(
              children: [
                SizedBox(height: 30),
                buildImageContainer('assets/images/Mainpg.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/Secondpg.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/roadhound.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/protorqex.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/protorqsportxr.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/protorqsporthr.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/protorqsportbf.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/protorqsportsr.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/storiestrack.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/storiesroad.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/notes.png'),
                SizedBox(height: 20),
                buildImageContainer('assets/images/final.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to build image containers
  Widget buildImageContainer(String imagePath) {
    return Container(
      child: Image.asset(imagePath),
    );
  }

  // Method to build search field with dropdown options
  Widget _buildSearchField() {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return filteredOptions(textEditingValue.text);
      },
      onSelected: (String selection) {
        scrollToImage(selection.toLowerCase());
      },
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search...',
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          ),
          onChanged: (value) {
            // Handle search text changes
          },
        );
      },
    );
  }

  // Method to scroll to image based on input string
  void scrollToImage(String input) {
    // Check if the input string has a corresponding image index
    if (stringToImageIndex.containsKey(input)) {
      // Calculate the position to scroll to
      int imageIndex = stringToImageIndex[input]!;
      double scrollTo = imageIndex * 220.0; // Adjust the scroll distance as needed

      // Scroll to the calculated position with animation
      _scrollController.animateTo(
        scrollTo,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}