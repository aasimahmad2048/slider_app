typedef MultiOperation = Function(int n1, int n2);
sum(int n1, int n2) {
  return (n1 + n2);
}

subtract(int n1, n2) {
  print(n1 - n2);
}

NumericOperation(int n1, int n2, MultiOperation mop) {
  print("Inside operation");
  mop(n1, n2);
}

void main() {
  // MultiOperation m = sum;
  // print(m(10, 29));

  // NumericOperation(50,50,sum);
  print(NumericOperation(50, 50, sum));
}
