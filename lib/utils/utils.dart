class Utils {
  static String getYear(){
    return DateTime.now().year.toString();
  }

  static String reverseString(String initial) {
    return initial.split('').reversed.join();
  }
}