import 'dart:io';

void main() {
  int n = 10; // Default value

  try {
    stdout.write("How many digits of Pi would you like to see? (default: 10) ");
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      int? parsedN = int.tryParse(input);
      if (parsedN != null && parsedN >= 0) {
        n = parsedN;
      }
    }
  } on StdinException {
    // Ignore exception and use default value
  }

  if (n == 0) {
    print("You asked for 0 digits.");
    return;
  }

  // Spigot algorithm for Pi using BigInt
  final digits = <int>[];
  int len = (10 * (n + 1) / 3).floor();
  List<BigInt> a = List.filled(len, BigInt.from(2));

  for (int i = 0; i < n + 1; i++) {
    BigInt carry = BigInt.zero;
    for (int j = len - 1; j >= 0; j--) {
      BigInt currentVal = a[j] * BigInt.from(10) + carry;
      if (j == 0) {
        carry = currentVal;
      } else {
        a[j] = currentVal % (BigInt.from(2 * j + 1));
        carry = (currentVal ~/ (BigInt.from(2 * j + 1))) * BigInt.from(j);
      }
    }

    BigInt lastDigit = carry ~/ BigInt.from(10);
    a[0] = carry % BigInt.from(10);

    if (i > 0) { // Discard the first digit
      digits.add(lastDigit.toInt());
    }
  }

  // Handle carry-overs
  for (int i = digits.length - 1; i > 0; i--) {
    if (digits[i] >= 10) {
      digits[i - 1] += digits[i] ~/ 10;
      digits[i] %= 10;
    }
  }

  final buffer = StringBuffer("3.");
  for (var digit in digits) {
    buffer.write(digit);
  }
  print(buffer.toString().substring(0, n + 2));
}