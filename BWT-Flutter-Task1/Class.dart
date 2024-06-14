class Car {
  String make;
  int model;

  Car(this.make, this.model);

  void displayInfo() {
    print("Car Name: $make, Car Model: $model");
  }
}

void main() {
  Car car = Car("Suzuki Mehran", 2017);
  car.displayInfo();

}
