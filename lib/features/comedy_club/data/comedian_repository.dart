import 'package:layout_widgets/features/comedy_club/models/comedian_model.dart';

class ComedianRepository {
  Future<List<Comedian>> fetchComedians() async {
    // Mock API gecikmesi
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      const Comedian(
        name: 'Dave Chappelle',
        specialty: 'Stand-Up',
        image: 'https://randomuser.me/api/portraits/men/1.jpg',
        rating: 4.9,
      ),
      const Comedian(
        name: 'Amy Schumer',
        specialty: 'Observational',
        image: 'https://randomuser.me/api/portraits/women/1.jpg',
        rating: 4.7,
      ),
      const Comedian(
        name: 'Kevin Hart',
        specialty: 'Storytelling',
        image: 'https://randomuser.me/api/portraits/men/2.jpg',
        rating: 4.8,
      ),
      const Comedian(
        name: 'Ali Wong',
        specialty: 'Satire',
        image: 'https://randomuser.me/api/portraits/women/2.jpg',
        rating: 4.6,
      ),
      const Comedian(
        name: 'John Mulaney',
        specialty: 'Stand-Up',
        image: 'https://randomuser.me/api/portraits/men/3.jpg',
        rating: 4.85,
      ),
      const Comedian(
        name: 'Tiffany Haddish',
        specialty: 'Improv',
        image: 'https://randomuser.me/api/portraits/women/3.jpg',
        rating: 4.7,
      ),
      const Comedian(
        name: 'Bill Burr',
        specialty: 'Observational',
        image: 'https://randomuser.me/api/portraits/men/4.jpg',
        rating: 4.9,
      ),
      const Comedian(
        name: 'Hannah Gadsby',
        specialty: 'Stand-Up',
        image: 'https://randomuser.me/api/portraits/women/4.jpg',
        rating: 4.75,
      ),
      const Comedian(
        name: 'Chris Rock',
        specialty: 'Storytelling',
        image: 'https://randomuser.me/api/portraits/men/5.jpg',
        rating: 4.8,
      ),
      const Comedian(
        name: 'Sarah Silverman',
        specialty: 'Satire',
        image: 'https://randomuser.me/api/portraits/women/5.jpg',
        rating: 4.65,
      ),
    ];
  }
}
