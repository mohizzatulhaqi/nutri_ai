// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get nutriAI => 'NutriAI';

  @override
  String get analysisPageTitle => 'Penganalisis Makanan NutriAI';

  @override
  String get analysisPageDescription =>
      'Ambil foto atau unggah gambar makanan Anda untuk mendapatkan analisis nutrisi terperinci';

  @override
  String get analysisPageTakePhoto => 'Ambil Foto';

  @override
  String get analysisPageChooseFromGallery => 'Pilih dari Galeri';

  @override
  String get analysisPageAnalyzing => 'Menganalisis makanan Anda...';

  @override
  String get analysisPageAnalyzingDescription =>
      'AI kami sedang mengidentifikasi bahan dan menghitung fakta nutrisi';

  @override
  String get analysisPageRecommendation => 'Rekomendasi';

  @override
  String get analysisPageReason => 'Alasan';

  @override
  String get analysisPageMacronutrients => 'Makronutrien';

  @override
  String get analysisPageCalories => 'Kalori';

  @override
  String get analysisPageProtein => 'Protein';

  @override
  String get analysisPageCarbohydrates => 'Karbohidrat';

  @override
  String get analysisPageFat => 'Lemak';

  @override
  String get analysisPageVitamins => 'Mikronutrien';

  @override
  String get analysisPageIngredients => 'Bahan-bahan';

  @override
  String get errorDialogTitle => 'Terjadi Kesalahan';

  @override
  String get errorDialogTryAgain => 'Coba Lagi';

  @override
  String get historyPageTitle => 'Riwayat';

  @override
  String get historyPageNoHistory => 'Belum ada riwayat.';

  @override
  String get wikifoodPageTitle => 'Wikifood';

  @override
  String get wikifoodPageSearchHint =>
      'Masukkan preferensi makanan Anda (misalnya, ramah diabetes)';

  @override
  String get wikifoodPageSearch => 'Cari';

  @override
  String get wikifoodPageInitial => 'Masukkan preferensi dan cari rekomendasi.';

  @override
  String get wikifoodPageDescription =>
      'Temukan rekomendasi makanan yang dipersonalisasi berdasarkan preferensi dan kebutuhan kesehatan Anda.';

  @override
  String get wikifoodPageSearchPlaceholder =>
      'Cari makanan dan dapatkan rekomendasi yang dipersonalisasi';

  @override
  String get wikifoodPageSearching => 'Mencari rekomendasi...';

  @override
  String get wikifoodPageCaloriesUnit => 'kkal';

  @override
  String get wikifoodPageProteinUnit => 'g protein';

  @override
  String get wikifoodPageErrorMessage => 'Ups! Terjadi kesalahan';

  @override
  String get homePageAnalyzer => 'Penganalisis';

  @override
  String get homePageWikifood => 'Wikifood';

  @override
  String get homePageHistory => 'Riwayat';
}
