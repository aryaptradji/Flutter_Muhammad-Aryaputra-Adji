/*
Program to Check Prime Numbers

This program provides a function to check whether a number is a prime number or not.

*/

import 'dart:math';

bool isPrime(int number) {
  // Check if the number is less than 2
  if (number < 2) {
    return false;
  }

  // Check if the number is divisible by any number from 2 to sqrt(number)
  for (int i = 2; i <= sqrt(number); i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

void main() {
  // Example usage
  int number = 23;
  if (isPrime(number)) {
    print('prime number');
  } else {
    print('not a prime number');
  }
}
