class AppUtils{
   static String capitalizeFirstLetter(String word) {
  if (word.isEmpty) return word; // Return the word as is if it's empty
  return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }
}