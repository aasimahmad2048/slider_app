class bird {
  bird(String s) {
    print("bird class  consuctor $s");
  }

  void fly() {
    print("bird can fly");
  }
}

class parrot extends bird {
  @override
  void fly() {
    print("parrot can fly");
  }

  void speak() {
    print("parrot can speak");
    super.fly(); 
  }

  parrot() : super("we are calling parrent class constrctor esplicitl") {
    print(" this is sub class const");
  }

  // parrot() {
  //   print("parrot class  consuctor");
  // }
}

void main() {
  parrot p = parrot();
  p.fly();
  p.speak();
}
