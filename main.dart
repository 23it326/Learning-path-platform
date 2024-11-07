import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 8, 165, 196),
              const Color.fromARGB(161, 7, 171, 166)
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Student Guideline App',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 22, 94, 170),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DepartmentSelectionScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 122, 219, 251),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DepartmentSelectionScreen extends StatelessWidget {
  final List<String> departments = [
    'Information Technology',
    'Computer Science Engineering',
    'AI and Data Science',
    'AI and Machine Learning',
    'Mechanical Engineering',
    'Electrical Engineering',
    'Communication Engineering',
    'BioTechnology',
    'Chemical Engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Department'),
        backgroundColor: const Color.fromARGB(255, 14, 194, 194),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(207, 29, 255, 229),
              const Color.fromARGB(255, 56, 244, 193)
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: departments.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DomainSelectionScreen(department: departments[index]),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 194, 240, 88),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  departments[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DomainSelectionScreen extends StatelessWidget {
  final String department;

  DomainSelectionScreen({required this.department});

  final Map<String, List<String>> departmentDomains = {
    'Information Technology': [
      'Programming Skills',
      'Database Management',
      'Networking',
      'Software Engineering',
      'Cloud Computing',
      'Data Science',
    ],
    'Computer Science Engineering': [
      'Programming Skills',
      'Artificial Intelligence',
      'Web Development',
      'Cybersecurity',
      'Machine Learning',
      'Cloud Computing',
    ],
    'AI and Data Science': [
      'Programming Skills',
      'Database Management',
      'Networking',
      'Software Engineering',
      'Cloud Computing',
      'Data Science',
    ],
    'AI and Machine Learning': [
      'Programming Skills',
      'Database Management',
      'Networking',
      'Software Engineering',
      'Cloud Computing',
      'Data Science',
    ],
    'Mechanical Engineering': [
      'Programming Skills',
      'Thermodynamics',
      'Robotics',
      'Fluid Mechanics',
      'Automotive Engineering',
      'Aerospace Materials',
    ],
    'Electrical Engineering': [
      'Programming Skills',
      'Circuit Analysis',
      'Digital Systems',
      'Electromagnetics',
      'Power Systems',
      'Control Systems',
    ],
    'Communication Engineering': [
      'Programming Skills',
      'Signal Processing',
      'Wireless Communication',
      'Networking',
      'Control Systems',
      'Digital Systems',
    ],
    'BioTechnology': [
      'Programming Skills',
      'Biomaterials',
      'Medical Imaging',
      'Biomechanics',
      'Tissue Engineering',
      'Bioinformatics',
    ],
    'Chemical Engineering': [
      'Programming Skills',
      'Process Design',
      'Thermodynamics',
      'Reaction Engineering',
      'Separation Processes',
      'Chemical Reaction Engineering',
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<String> domains = departmentDomains[department] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Domains in $department'),
        backgroundColor: const Color.fromARGB(255, 22, 70, 104),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, const Color.fromARGB(255, 36, 49, 226)],
          ),
        ),
        child: ListView.builder(
          itemCount: domains.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DomainDetailScreen(
                          domain: domains[index],
                          description: getDomainDescription(domains[index])),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 93, 201, 234),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  domains[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String getDomainDescription(String domain) {
    switch (domain) {
      case 'Programming Skills':
        return 'use Skillrack and Leetcode platforms to improve your skills.';
      case 'Database Management':
        return 'Focuses on the design, implementation, and management of databases.';
      case 'Networking':
        return 'Covers the principles of network architecture, protocols, and security.';
      case 'Software Engineering':
        return 'Involves the application of engineering principles to software development.';
      case 'Cloud Computing':
        return 'Examines cloud technologies and service models for computing resources.';
      case 'Data Science':
        return 'Combines statistical analysis, machine learning, and data visualization.';
      case 'Artificial Intelligence':
        return 'Studies the development of intelligent agents and machine learning.';
      case 'Web Development':
        return 'Involves the creation and maintenance of websites and web applications.';
      case 'Cybersecurity':
        return 'Focuses on protecting systems and networks from cyber threats.';
      case 'Machine Learning':
        return 'Involves algorithms that allow computers to learn from data.';
      case 'Thermodynamics':
        return 'Studies the principles of heat transfer and energy conversion.';
      case 'Robotics':
        return 'Focuses on the design and operation of robots and automated systems.';
      case 'Fluid Mechanics':
        return 'Examines the behavior of fluids at rest and in motion.';
      case 'Automotive Engineering':
        return 'Involves the design and production of vehicles.';
      case 'Circuit Analysis':
        return 'Studies the behavior of electrical circuits.';
      case 'Digital Systems':
        return 'Covers the principles of digital circuit design and applications.';
      case 'Electromagnetics':
        return 'Examines electric and magnetic fields and their applications.';
      case 'Power Systems':
        return 'Focuses on the generation, transmission, and distribution of electrical power.';
      case 'Control Systems':
        return 'Studies systems that manage, command, and regulate behaviors.';
      case 'Signal Processing':
        return 'Involves the analysis and manipulation of signals.';
      case 'Wireless Communication':
        return 'Focuses on communication technologies without physical connections.';
      case 'Biomaterials':
        return 'Studies materials used in medical applications and implants.';
      case 'Medical Imaging':
        return 'Involves techniques for creating images of the body for clinical purposes.';
      case 'Biomechanics':
        return 'Applies principles of mechanics to biological systems.';
      case 'Tissue Engineering':
        return 'Involves the creation of artificial organs and tissues.';
      case 'Bioinformatics':
        return 'Combines biology, computer science, and information technology.';
      case 'Process Design':
        return 'Focuses on the design and optimization of chemical processes.';
      case 'Thermodynamics':
        return 'Studies energy, heat, and work within chemical systems.';
      case 'Reaction Engineering':
        return 'Involves the design and optimization of chemical reactors.';
      case 'Separation Processes':
        return 'Covers techniques to separate components of mixtures.';
      case 'Chemical Reaction Engineering':
        return 'Studies the kinetics and design of chemical reactions.';
      default:
        return 'No description available.';
    }
  }
}

class DomainDetailScreen extends StatelessWidget {
  final String domain;
  final String description;

  DomainDetailScreen({required this.domain, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(domain),
        backgroundColor: const Color.fromARGB(255, 82, 174, 244),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orangeAccent, Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              domain,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
