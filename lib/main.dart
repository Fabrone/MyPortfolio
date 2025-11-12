import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fabron Lubanga - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        fontFamily: 'Inter',
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A),
              Color(0xFF581C87),
              Color(0xFF0F172A),
            ],
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _buildAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildHeroSection(),
                  _buildExperienceSection(),
                  _buildProjectsSection(),
                  _buildSkillsSection(),
                  _buildAchievementsSection(),
                  _buildContactSection(),
                  _buildFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: const Color(0xFF0F172A).withAlpha(242), // 95% opacity = 242/255
      elevation: 0,
      title: Text(
        'FL',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..shader = const LinearGradient(
              colors: [Color(0xFFC084FC), Color(0xFFF472B6)],
            ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => _scrollToSection(_aboutKey),
          child: const Text('About', style: TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: () => _scrollToSection(_experienceKey),
          child: const Text('Experience', style: TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: () => _scrollToSection(_projectsKey),
          child: const Text('Projects', style: TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: () => _scrollToSection(_skillsKey),
          child: const Text('Skills', style: TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: () => _scrollToSection(_contactKey),
          child: const Text('Contact', style: TextStyle(color: Colors.white70)),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Container(
      key: _aboutKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.purple.withAlpha(51), // 20% opacity = 51/255
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.purple.withAlpha(77)), // 30% opacity = 77/255
                ),
                child: const Text(
                  'Available for Opportunities',
                  style: TextStyle(
                    color: Color(0xFFC084FC),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Fabron Lubanga',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFC084FC), Color(0xFFF472B6)],
                ).createShader(bounds),
                child: const Text(
                  'Mobile App Developer',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Creative Software Engineer with 2+ years of experience building cross-platform mobile applications. Specialized in Flutter, AI integration, and creating impactful solutions that solve real-world problems.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _launchUrl('mailto:lubangafabron@gmail.com'),
                    icon: const Icon(Icons.mail),
                    label: const Text('Get In Touch'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _launchUrl('https://github.com/Fabroneab2835247'),
                    icon: const Icon(Icons.code),
                    label: const Text('GitHub'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white54),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 24,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: const [
                  _InfoChip(icon: Icons.phone, text: '+254 798 075 587'),
                  _InfoChip(icon: Icons.location_on, text: 'Nairobi, Kenya'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceSection() {
    return Container(
      key: _experienceKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFF0F172A).withAlpha(128), // 50% opacity = 128/255
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.work, color: Color(0xFFC084FC), size: 32),
                  SizedBox(width: 12),
                  Text(
                    'Professional Experience',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              _ExperienceCard(
                role: 'Mobile App Developer',
                company: 'JV Alma C.I.S',
                period: 'Feb 2025 - Sep 2025',
                achievements: const [
                  'Developed and deployed cross-platform applications for Android, web, and Windows',
                  'Designed and integrated custom AI models to enhance app interactivity and user experience',
                  'Built 4+ production applications: CoffeeCore, NyumbaSmart, AlmaWorks, KilimoMkononi',
                ],
              ),
              const SizedBox(height: 24),
              _ExperienceCard(
                role: 'ICT Intern',
                company: 'KALRO HQ',
                period: 'Aug 2024 - Jan 2025',
                achievements: const [
                  'Created user-friendly mobile application interfaces using Android Studio and Flutter',
                  'Participated in code reviews and provided constructive feedback',
                  'Contributed to improving app functionality and user experience',
                ],
              ),
              const SizedBox(height: 24),
              _ExperienceCard(
                role: 'Student Attaché',
                company: 'Dedan Kimathi University of Technology',
                period: 'Feb 2022 - Jul 2023',
                achievements: const [
                  'Developed Android apps using Java with focus on clean architecture',
                  'Collaborated in agile environment to meet project deadlines',
                  'Implemented usability best practices',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      key: _projectsKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.code, color: Color(0xFFC084FC), size: 32),
                  SizedBox(width: 12),
                  Text(
                    'Featured Projects',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 1.2,
                children: const [
                  _ProjectCard(
                    name: 'CoffeeCore',
                    tech: 'Flutter, Dart, AI/ML',
                    description: 'Specialized coffee farming app with AI-powered disease detection, cultivation guidance, and market search.',
                    isLive: true,
                    highlights: ['AI Disease Detection', 'Market Integration', 'Cultivation Guides'],
                  ),
                  _ProjectCard(
                    name: 'KilimoMkononi',
                    tech: 'Flutter, Dart, AI/ML',
                    description: 'Revolutionary agricultural monitoring platform enabling farmers to track crops and manage pests/diseases.',
                    isLive: true,
                    highlights: ['Crop Monitoring', 'Pest Management', 'Market Access'],
                  ),
                  _ProjectCard(
                    name: 'NyumbaSmart',
                    tech: 'Flutter, Dart, Firebase',
                    description: 'Comprehensive CMMS application with role-based access control and automated maintenance alerts.',
                    isLive: true,
                    highlights: ['CMMS System', 'Role-Based Access', 'Automated Alerts'],
                  ),
                  _ProjectCard(
                    name: 'AlmaWorks',
                    tech: 'Flutter, Dart, RESTful APIs',
                    description: 'Site management system facilitating communication between clients, contractors, and technicians.',
                    isLive: false,
                    highlights: ['Multi-Role Collaboration', 'Activity Tracking', 'Cross-Platform'],
                  ),
                  _ProjectCard(
                    name: 'AgriMarket',
                    tech: 'Flutter, Java',
                    description: 'Commercial platform for direct agricultural product sales with focus on performance optimization.',
                    isLive: false,
                    highlights: ['E-commerce', 'Direct Sales', 'Performance Optimized'],
                  ),
                  _ProjectCard(
                    name: 'AutoMate',
                    tech: 'Java, TensorFlow, AI/ML',
                    description: 'Android application using machine learning models for vehicle price prediction.',
                    isLive: false,
                    highlights: ['ML Price Prediction', 'Native Android', 'TensorFlow Integration'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      key: _skillsKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFF0F172A).withAlpha(128), // 50% opacity
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.phonelink, color: Color(0xFFC084FC), size: 32),
                  SizedBox(width: 12),
                  Text(
                    'Technical Skills',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 1.5,
                children: const [
                  _SkillCard(
                    category: 'Mobile Development',
                    skills: ['Flutter', 'Dart', 'Java', 'Kotlin', 'Android Studio'],
                  ),
                  _SkillCard(
                    category: 'AI/ML Integration',
                    skills: ['TensorFlow', 'CNNs', 'Linear Regression', 'Custom Model Design'],
                  ),
                  _SkillCard(
                    category: 'Backend & APIs',
                    skills: ['Firebase', 'RESTful APIs', 'Third-party SDKs'],
                  ),
                  _SkillCard(
                    category: 'Development Practices',
                    skills: ['Agile Methodologies', 'Unit Testing', 'UI Testing', 'Performance Tuning'],
                  ),
                  _SkillCard(
                    category: 'Design',
                    skills: ['UI/UX Design', 'Mobile Prototyping', 'User-Centered Design'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.emoji_events, color: Color(0xFFC084FC), size: 32),
                  SizedBox(width: 12),
                  Text(
                    'Achievements & Recognition',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.withValues(alpha: 0.1),
                            Colors.pink.withValues(alpha: 0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.purple.withValues(alpha: 0.3)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CoffeeCore Recognition',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Application incorporated by KALRO Coffee Research Institute in Ruiru for agricultural research and farmer support.',
                            style: TextStyle(color: Colors.white70, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.withValues(alpha: 0.1),
                            Colors.pink.withValues(alpha: 0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.purple.withValues(alpha: 0.3)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Certified Developer',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Flutter Development • Java Android • Meta Front-End Development • Responsive Web Design certifications.',
                            style: TextStyle(color: Colors.white70, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      key: _contactKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFF0F172A).withValues(alpha: 0.5),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              const Text(
                "Let's Build Something Amazing",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                "I'm currently available for mobile development opportunities. Let's discuss how I can contribute to your team.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _launchUrl('mailto:lubangafabron@gmail.com'),
                    icon: const Icon(Icons.mail, size: 24),
                    label: const Text('lubangafabron@gmail.com'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _launchUrl('https://www.linkedin.com/in/fabron-lubanga-ab2835247/'),
                    icon: const Icon(Icons.link, size: 24),
                    label: const Text('LinkedIn Profile'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white54),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.purple.withValues(alpha: 0.2)),
        ),
      ),
      child: const Center(
        child: Text(
          '© 2025 Fabron Lubanga. Built with Flutter.',
          style: TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.white54),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white54)),
      ],
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final List<String> achievements;

  const _ExperienceCard({
    required this.role,
    required this.company,
    required this.period,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC084FC),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                period,
                style: const TextStyle(color: Colors.white54),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...achievements.map((achievement) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '▹ ',
                      style: TextStyle(color: Color(0xFFC084FC), fontSize: 18),
                    ),
                    Expanded(
                      child: Text(
                        achievement,
                        style: const TextStyle(color: Colors.white70, height: 1.5),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String name;
  final String tech;
  final String description;
  final bool isLive;
  final List<String> highlights;

  const _ProjectCard({
    required this.name,
    required this.tech,
    required this.description,
    required this.isLive,
    required this.highlights,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (isLive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.phone_android, size: 14, color: Colors.greenAccent),
                      SizedBox(width: 4),
                      Text(
                        'Live',
                        style: TextStyle(color: Colors.greenAccent, fontSize: 12),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            tech,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFC084FC),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(color: Colors.white70, height: 1.5),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: highlights
                .map((highlight) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.purple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.purple.withValues(alpha: 0.2)),
                      ),
                      child: Text(
                        highlight,
                        style: const TextStyle(
                          color: Color(0xFFC084FC),
                          fontSize: 12,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final String category;
  final List<String> skills;

  const _SkillCard({
    required this.category,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC084FC),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF334155),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        skill,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}