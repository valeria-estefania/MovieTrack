import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ─────────────────────────────────────────────────────────────────────────────
// PUNTO DE ENTRADA DE LA APP
// ─────────────────────────────────────────────────────────────────────────────
void main() {
  runApp(const MovieTrackApp());
}

// ─────────────────────────────────────────────────────────────────────────────
// WIDGET RAÍZ
// ─────────────────────────────────────────────────────────────────────────────
class MovieTrackApp extends StatelessWidget {
  const MovieTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieTrack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PALETA DE COLORES
// ─────────────────────────────────────────────────────────────────────────────
class AppColors {
  static const coral    = Color(0xFFFD5D5E);
  static const indigo   = Color(0xFF6667AB);
  static const plum     = Color(0xFF7B337E);
  static const darkPlum = Color(0xFF420D4B);
  static const midnight = Color(0xFF210635);
}

// ─────────────────────────────────────────────────────────────────────────────
// MODELO DE DATOS: MoviePoster
// ─────────────────────────────────────────────────────────────────────────────
class MoviePoster {
  final String   title;
  final String   genre;
  final Color    accent;
  final IconData icon;
  final String   imageUrl;

  const MoviePoster({
    required this.title,
    required this.genre,
    required this.accent,
    required this.icon,
    required this.imageUrl,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// LISTA DE PELÍCULAS
// URLs corregidas para Mad Max y Tenet
// ─────────────────────────────────────────────────────────────────────────────
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
  MoviePoster(
    title: 'John Wick', genre: 'Acción', accent: AppColors.coral,
    icon: Icons.local_fire_department,
    imageUrl: 'https://image.tmdb.org/t/p/w500/fZPSd91yGE9fCcCe6OoQr6E3Bev.jpg',
  ),
  MoviePoster(
    title: 'Avatar', genre: 'Fantasía', accent: AppColors.plum,
    icon: Icons.forest_outlined,
    imageUrl: 'https://image.tmdb.org/t/p/w500/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg',
  ),
  MoviePoster(
    title: 'The Matrix', genre: 'Sci-Fi', accent: AppColors.indigo,
    icon: Icons.grid_3x3,
    imageUrl: 'https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
  ),
  MoviePoster(
    title: 'Mad Max', genre: 'Acción', accent: AppColors.coral,
    icon: Icons.speed_outlined,
    imageUrl: 'https://image.tmdb.org/t/p/w500/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg', // URL corregida
  ),
  MoviePoster(
    title: 'Tenet', genre: 'Thriller', accent: AppColors.darkPlum,
    icon: Icons.loop,
    imageUrl: 'https://media.themoviedb.org/t/p/w600_and_h900_face/jFAi1Uv3JjNPEgjKuneG5mBlAvA.jpg', // URL corregida
  ),
  MoviePoster(
    title: '1917', genre: 'Guerra', accent: AppColors.plum,
    icon: Icons.terrain_outlined,
    imageUrl: 'https://image.tmdb.org/t/p/w500/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
  ),
  MoviePoster(
    title: 'Parasite', genre: 'Drama', accent: AppColors.indigo,
    icon: Icons.stairs_outlined,
    imageUrl: 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// PANTALLA PRINCIPAL
// ─────────────────────────────────────────────────────────────────────────────
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late AnimationController _fadeController;
  late AnimationController _scrollController;
  late Animation<double>   _fadeAnimation;
  late Animation<Offset>   _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation  = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
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

                // ── Cartelera ──────────────────────────────────────────
                // ClipRect impide que el contenido desbordado sea visible
                // y elimina la franja amarilla de advertencia de Flutter.
                ClipRect(
                  child: _buildBillboard(screenWidth),
                ),

                const Spacer(flex: 2),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      // TODO: Navegar a la pantalla de crear cuenta
                      _PrimaryButton(
                        label: 'Crear cuenta',
                        icon: Icons.person_add_alt_1_rounded,
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),
                      // TODO: Navegar a la pantalla de iniciar sesión
                      _SecondaryButton(
                        label: 'Iniciar sesión',
                        onTap: () {},
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

  // ─────────────────────────────────────────────────────────────────────────
  // LOGO
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.coral, AppColors.plum],
            ),
            boxShadow: [
              BoxShadow(color: AppColors.coral.withOpacity(0.5), blurRadius: 24, spreadRadius: 2),
            ],
          ),
          child: const Icon(Icons.movie_filter_rounded, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 20),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(text: 'Movie', style: TextStyle(color: Colors.white,    fontSize: 42, fontWeight: FontWeight.w900, letterSpacing: -1)),
              TextSpan(text: 'Track', style: TextStyle(color: AppColors.coral, fontSize: 42, fontWeight: FontWeight.w900, letterSpacing: -1)),
            ],
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // TAGLINE
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildTagline() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'Tu historial cinematográfico,\nsiempre contigo.',
        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15, height: 1.5),
        textAlign: TextAlign.center,
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // CARTELERA ANIMADA
  //
  // Para eliminar la franja amarilla usamos OverflowBox, que le dice a Flutter
  // "este widget puede ser más ancho que su padre, no lo marques como error".
  // Luego ClipRect (en el padre) se encarga de recortar lo que se salga,
  // así los posters desaparecen limpiamente en los bordes de la pantalla.
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildBillboard(double screenWidth) {
    const double posterWidth  = 110.0;
    const double posterHeight = 155.0;
    const double gap          = 12.0;
    const double itemWidth    = posterWidth + gap;
    final double singleListWidth = movies.length * itemWidth;

    // El ancho real del Row es el doble de la lista (A + B)
    final double totalRowWidth = singleListWidth * 2;

    return SizedBox(
      height: posterHeight,
      width: screenWidth,
      child: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, _) {
          final double offset = (_scrollController.value * singleListWidth) % singleListWidth;

          // OverflowBox permite que el Row interno sea más ancho que la pantalla
          // sin que Flutter muestre la advertencia de desbordamiento (franja amarilla).
          return OverflowBox(
            alignment: Alignment.centerLeft,
            minWidth: 0,
            maxWidth: totalRowWidth,
            child: Transform.translate(
              offset: Offset(-offset, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Lista A (original)
                  ...movies.map((m) => _PosterCard(
                    movie: m,
                    width: posterWidth,
                    height: posterHeight,
                    gap: gap,
                  )),
                  // Lista B (duplicado para el loop invisible)
                  ...movies.map((m) => _PosterCard(
                    movie: m,
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

// ─────────────────────────────────────────────────────────────────────────────
// WIDGET: PosterCard con imagen desde URL
//
// CachedNetworkImage maneja tres estados:
//   - Cargando   → ícono + spinner
//   - Error      → ícono + nombre de la película
//   - Cargado    → imagen real del poster
// ─────────────────────────────────────────────────────────────────────────────
class _PosterCard extends StatelessWidget {
  final MoviePoster movie;
  final double width;
  final double height;
  final double gap;

  const _PosterCard({required this.movie, required this.width, required this.height, required this.gap});

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
        boxShadow: [BoxShadow(color: movie.accent.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: movie.imageUrl,
          fit: BoxFit.cover,

          // Mientras carga: ícono + spinner
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [movie.accent.withOpacity(0.9), AppColors.midnight],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(movie.icon, color: Colors.white54, size: 28),
                const SizedBox(height: 12),
                SizedBox(
                  width: 20, height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: movie.accent),
                ),
              ],
            ),
          ),

          // Si falla la carga: ícono + título + género
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [movie.accent.withOpacity(0.9), AppColors.midnight],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(movie.icon, color: Colors.white70, size: 32),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    movie.title,
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(movie.genre, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// WIDGET: PrimaryButton — Botón principal con gradiente (Crear cuenta)
// ─────────────────────────────────────────────────────────────────────────────
class _PrimaryButton extends StatelessWidget {
  final String   label;
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryButton({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.coral, AppColors.plum],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: AppColors.coral.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 8))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// WIDGET: SecondaryButton — Botón con borde (Iniciar sesión)
// ─────────────────────────────────────────────────────────────────────────────
class _SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SecondaryButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.indigo.withOpacity(0.7), width: 1.5),
          color: AppColors.indigo.withOpacity(0.12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.login_rounded, color: AppColors.indigo, size: 20),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: AppColors.indigo, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
          ],
        ),
      ),
    );
  }
}