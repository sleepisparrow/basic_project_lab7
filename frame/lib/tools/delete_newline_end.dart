String removeTrailingNewline(String input) {
  int lastIndex = input.length - 1;
  while (lastIndex >= 0 && input[lastIndex] == '\n') {
    lastIndex--;
  }
  return input.substring(0, lastIndex + 1);
}
