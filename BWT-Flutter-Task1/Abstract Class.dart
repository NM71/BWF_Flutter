abstract class Vehicle {
  // Abstract method
  void start();

  // Concrete method
  void stop() {
    print('Vehicle stopped');
  }
}

class Car extends Vehicle {
  @override
  void start() {
    print('Car started');
  }
}

void main() {
  // Cannot instantiate an abstract class
  // Vehicle vehicle = Vehicle(); // Error

  Car car = Car();
  car.start(); // Output: Car started
  car.stop(); // Output: Vehicle stopped
}