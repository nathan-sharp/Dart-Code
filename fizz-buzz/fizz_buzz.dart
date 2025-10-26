// The main function, where the program execution starts.
void main() {
  // Loop through numbers from 1 to 100.
  for (int i = 1; i <= 100; i++) {
    // Check if the number is divisible by both 3 and 5.
    if (i % 3 == 0 && i % 5 == 0) {
      // If so, print "FizzBuzz".
      print("FizzBuzz");
    } 
    // Otherwise, check if the number is divisible by 3.
    else if (i % 3 == 0) {
      // If so, print "Fizz".
      print("Fizz");
    } 
    // Otherwise, check if the number is divisible by 5.
    else if (i % 5 == 0) {
      // If so, print "Buzz".
      print("Buzz");
    } 
    // If the number is not divisible by 3 or 5.
    else {
      // Print the number itself.
      print(i);
    }
  }
}