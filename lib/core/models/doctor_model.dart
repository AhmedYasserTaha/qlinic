class DoctorModel {
  final int id;
  final String name;
  final String specialty;
  final double rating;
  final double price;
  final String image;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.price,
    required this.image,
  });

  static final List<DoctorModel> specialeDoctors = [
    DoctorModel(
      id: 1,
      name: "Dr. Strain",
      specialty: "Dental",
      rating: 4.9,
      price: 22.00,
      image: "assets/images/doc2.jpg",
    ),
    DoctorModel(
      id: 2,
      name: "Dr. Strange",
      specialty: "Surgeon",
      rating: 4.8,
      price: 25.00,
      image: "assets/images/doc2.jpg",
    ),
    DoctorModel(
      id: 3,
      name: "Dr. Who",
      specialty: "General",
      rating: 4.7,
      price: 20.00,
      image: "assets/images/doc2.jpg",
    ),
    DoctorModel(
      id: 4,
      name: "Dr. House",
      specialty: "Diagnostic",
      rating: 4.6,
      price: 30.00,
      image: "assets/images/doc2.jpg",
    ),
    DoctorModel(
      id: 5,
      name: "Dr. Grey",
      specialty: "Surgeon",
      rating: 4.5,
      price: 28.00,
      image: "assets/images/doc2.jpg",
    ),
  ];

  static final List<DoctorModel> popularDoctors = [
    DoctorModel(
      id: 6,
      name: "Dr. Shouey",
      specialty: "Dental",
      rating: 4.9,
      price: 22.00,
      image: "assets/images/doc.png",
    ),
    DoctorModel(
      id: 7,
      name: "Dr. Shouey",
      specialty: "Specalist Medicine",
      rating: 4.8,
      price: 25.00,
      image: "assets/images/doc.png",
    ),
    DoctorModel(
      id: 8,
      name: "Dr. Shouey",
      specialty: "Specalist Medicine",
      rating: 4.7,
      price: 20.00,
      image: "assets/images/doc.png",
    ),
    DoctorModel(
      id: 9,
      name: "Dr. House",
      specialty: "Diagnostic",
      rating: 4.6,
      price: 30.00,
      image: "assets/images/doc.png",
    ),
    DoctorModel(
      id: 10,
      name: "Dr. Shouey",
      specialty: "Surgeon",
      rating: 4.5,
      price: 28.00,
      image: "assets/images/doc.png",
    ),
  ];
}
