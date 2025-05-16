import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class LearnPythonPage extends StatelessWidget {
  const LearnPythonPage({super.key});

  Future<void> _openTelegram() async {
    final Uri url = Uri.parse('https://t.me/yourtelegramchannel');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _openAffiliate() async {
    final Uri url = Uri.parse('https://youraffiliatelink.com');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.redAccent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.redAccent, Colors.black],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInDown(
                        duration: const Duration(milliseconds: 800),
                        child: const FaIcon(
                          FontAwesomeIcons.python,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeIn(
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          'Domina Python',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FadeIn(
                        delay: const Duration(milliseconds: 300),
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          'De Cero a Experto',
                          style: TextStyle(color: Colors.white70, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade900, Colors.black],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '¡Únete a +1000 estudiantes!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _openTelegram,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0088cc),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                              ),
                              icon: const FaIcon(FontAwesomeIcons.telegram),
                              label: const Text('Canal Privado'),
                            ),
                            ElevatedButton.icon(
                              onPressed: _openAffiliate,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[700],
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                              ),
                              icon: const Icon(Icons.shopping_cart),
                              label: const Text('Comprar \$100'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    children: const [
                      _FeatureCard(
                        icon: FontAwesomeIcons.rocket,
                        title: '19 Módulos',
                        subtitle: 'Contenido completo',
                      ),
                      _FeatureCard(
                        icon: FontAwesomeIcons.laptop,
                        title: 'Proyectos Reales',
                        subtitle: 'Aprende haciendo',
                      ),
                      _FeatureCard(
                        icon: FontAwesomeIcons.users,
                        title: 'Comunidad',
                        subtitle: 'Soporte 24/7',
                      ),
                      _FeatureCard(
                        icon: FontAwesomeIcons.certificate,
                        title: 'Certificado',
                        subtitle: 'Al completar',
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withAlpha(25),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.redAccent),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '¿Listo para comenzar?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Bounce(
                          infinite: true,
                          duration: const Duration(milliseconds: 2000),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 20,
                              ),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: _openAffiliate,
                            child: const Text('¡Comienza Ahora!'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: Colors.redAccent, size: 30),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
