import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/screens/User_Register.dart';
import 'package:flutter_application_1/screens/user_login.dart';

// ──────────────────────────────────────────────
// PALETA DE COLORES
// ──────────────────────────────────────────────
class AppColors {
  static const coral    = Color(0xFFFD5D5E);
  static const indigo   = Color(0xFF6667AB);
  static const plum     = Color(0xFF7B337E);
  static const darkPlum = Color(0xFF420D4B);
  static const midnight = Color(0xFF210635);
}

// ──────────────────────────────────────────────
// MODELO DE DATOS
// ──────────────────────────────────────────────
class MoviePoster {
  final String title;
  final String genre;
  final Color accent;
  final IconData icon;
  final String imageUrl;

  const MoviePoster({
    required this.title,
    required this.genre,
    required this.accent,
    required this.icon,
    required this.imageUrl,
  });
}

// ──────────────────────────────────────────────
// LISTA DE PELÍCULAS CON URLS
// ──────────────────────────────────────────────
const List<MoviePoster> movies = [
  MoviePoster(
    title: 'Interstellar', genre: 'Sci-Fi', accent: AppColors.indigo,
    icon: Icons.rocket_launch,
    imageUrl: 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
  ),
  MoviePoster(
    title: 'The Batman', genre: 'Acción', accent: AppColors.coral,
    icon: Icons.nightlight_round,
    imageUrl: 'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
  ),
  MoviePoster(
    title: 'Dune', genre: 'Épica', accent: AppColors.plum,
    icon: Icons.wb_sunny_outlined,
    imageUrl: 'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
  ),
  MoviePoster(
    title: 'Oppenheimer', genre: 'Drama', accent: AppColors.darkPlum,
    icon: Icons.science_outlined,
    imageUrl: 'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
  ),
  MoviePoster(
    title: 'Inception', genre: 'Sci-Fi', accent: AppColors.indigo,
    icon: Icons.blur_circular,
    imageUrl: 'https://image.tmdb.org/t/p/w500/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg',
  ),
];

// ──────────────────────────────────────────────
// HOME SCREEN
// ──────────────────────────────────────────────
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scrollController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOutCubic));

    _scrollController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.midnight,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                _buildLogo(),
                const SizedBox(height: 12),
                _buildTagline(),
                const SizedBox(height: 36),
                ClipRect(child: _buildBillboard(screenWidth)),
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      _PrimaryButton(
                        label: 'Crear cuenta',
                        icon: Icons.person_add_alt_1_rounded,
                        onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>UserRegister()));},
                      ),
                      const SizedBox(height: 16),
                      _SecondaryButton(
                        label: 'Iniciar sesión',
                        onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>UserLogin()));},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Text(
      "MOVIE TRACK",
      style: TextStyle(
        color: AppColors.coral,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: "OrlietPro",
      ),
    );
  }

  Widget _buildTagline() {
    return Text(
      "Tu historial cinematográfico,\nsiempre contigo.",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.indigo.withOpacity(0.8),
        fontSize: 16,
        fontFamily: "OrlietPro",
      ),
    );
  }

  Widget _buildBillboard(double screenWidth) {
    const double posterWidth = 110.0;
    const double posterHeight = 155.0;
    const double gap = 12.0;
    const double itemWidth = posterWidth + gap;

    final double singleListWidth = movies.length * itemWidth;
    final double totalRowWidth = singleListWidth * 2; // duplicado para loop

    return SizedBox(
      height: posterHeight,
      width: screenWidth,
      child: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, _) {
          final double offset = (_scrollController.value * singleListWidth) % singleListWidth;

          return OverflowBox(
            minWidth: 0,
            maxWidth: totalRowWidth,
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(-offset, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Lista original
                  ...movies.map((movie) => _PosterCard(
                        movie: movie,
                        width: posterWidth,
                        height: posterHeight,
                        gap: gap,
                      )),
                  // Lista duplicada para loop infinito
                  ...movies.map((movie) => _PosterCard(
                        movie: movie,
                        width: posterWidth,
                        height: posterHeight,
                        gap: gap,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ──────────────────────────────────────────────
// WIDGET: PosterCard
// ──────────────────────────────────────────────
class _PosterCard extends StatelessWidget {
  final MoviePoster movie;
  final double width;
  final double height;
  final double gap;

  const _PosterCard({
    required this.movie,
    required this.width,
    required this.height,
    required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(right: gap),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [movie.accent.withOpacity(0.9), AppColors.midnight],
        ),
        border: Border.all(color: movie.accent.withOpacity(0.35), width: 1),
        boxShadow: [
          BoxShadow(
            color: movie.accent.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: movie.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(color: movie.accent, strokeWidth: 2),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error, color: Colors.red),
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// WIDGETS DE BOTONES PRIVADOS
// ──────────────────────────────────────────────
class _PrimaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryButton({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,fontFamily: "OrlietPro")),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.coral,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SecondaryButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,fontFamily: "OrlietPro")),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.indigo,
        side: const BorderSide(color: AppColors.indigo, width: 1.5),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}