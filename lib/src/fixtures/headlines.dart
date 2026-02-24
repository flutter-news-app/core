import 'package:core/src/enums/enums.dart';
import 'package:core/src/fixtures/countries.dart';
import 'package:core/src/fixtures/fixture_ids.dart';
import 'package:core/src/fixtures/sources.dart' as source_fixtures;
import 'package:core/src/fixtures/topics.dart' as topic_fixtures;
import 'package:core/src/models/entities/headline.dart';

/// Generates a list of predefined headlines for fixture data.
///
/// This function can be configured to generate headlines in either English or
/// Arabic.
List<Headline> getHeadlinesFixturesData({
  String languageCode = 'en',
  DateTime? now,
}) {
  // Ensure only approved languages are used, default to 'en'.
  final resolvedLanguageCode = ['en', 'ar'].contains(languageCode)
      ? languageCode
      : 'en';
  final referenceTime = now ?? DateTime.now();

  final sources = source_fixtures.getSourcesFixturesData(
    languageCode: resolvedLanguageCode,
  );
  final topics = topic_fixtures.getTopicsFixturesData(
    languageCode: resolvedLanguageCode,
  );

  final headlines = <Headline>[];
  for (var i = 0; i < _headlineIds.length; i++) {
    final id = _headlineIds[i];
    final titleIndex = i % _titlesByLang['en']!.length;
    final title = {
      for (final lang in _titlesByLang.keys)
        ContentLanguage.values.byName(lang): _titlesByLang[lang]![titleIndex],
    };
    final source = sources[i % sources.length];
    final topic = topics[i % topics.length];
    final country = countriesFixturesData[i % countriesFixturesData.length];

    headlines.add(
      Headline(
        id: id,
        isBreaking: i % 10 == 3, // Make some headlines breaking
        title: title,
        url: 'https://example.com/news/${id.substring(0, 8)}',
        imageUrl: 'https://picsum.photos/seed/$id/800/600',
        source: source,
        eventCountry: country,
        topic: topic,
        createdAt: referenceTime.subtract(Duration(minutes: i * 15)),
        updatedAt: referenceTime.subtract(Duration(minutes: i * 15)),
        status: ContentStatus.active,
      ),
    );
  }
  return headlines;
}

const List<String> _headlineIds = [
  kHeadlineId1, kHeadlineId2, kHeadlineId3, kHeadlineId4, kHeadlineId5,
  kHeadlineId6, kHeadlineId7, kHeadlineId8, kHeadlineId9, kHeadlineId10,
  kHeadlineId11, kHeadlineId12, kHeadlineId13, kHeadlineId14, kHeadlineId15,
  kHeadlineId16, kHeadlineId17, kHeadlineId18, kHeadlineId19, kHeadlineId20,
  kHeadlineId21, kHeadlineId22, kHeadlineId23, kHeadlineId24, kHeadlineId25,
  kHeadlineId26, kHeadlineId27, kHeadlineId28, kHeadlineId29, kHeadlineId30,
  kHeadlineId31, kHeadlineId32, kHeadlineId33, kHeadlineId34, kHeadlineId35,
  kHeadlineId36, kHeadlineId37, kHeadlineId38, kHeadlineId39, kHeadlineId40,
  kHeadlineId41, kHeadlineId42, kHeadlineId43, kHeadlineId44, kHeadlineId45,
  kHeadlineId46, kHeadlineId47, kHeadlineId48, kHeadlineId49, kHeadlineId50,
  kHeadlineId51, kHeadlineId52, kHeadlineId53, kHeadlineId54, kHeadlineId55,
  kHeadlineId56, kHeadlineId57, kHeadlineId58, kHeadlineId59, kHeadlineId60,
  kHeadlineId61, kHeadlineId62, kHeadlineId63, kHeadlineId64, kHeadlineId65,
  kHeadlineId66, kHeadlineId67, kHeadlineId68, kHeadlineId69, kHeadlineId70,
  kHeadlineId71, kHeadlineId72, kHeadlineId73, kHeadlineId74, kHeadlineId75,
  kHeadlineId76, kHeadlineId77, kHeadlineId78, kHeadlineId79, kHeadlineId80,
  kHeadlineId81, kHeadlineId82, kHeadlineId83, kHeadlineId84, kHeadlineId85,
  kHeadlineId86, kHeadlineId87, kHeadlineId88, kHeadlineId89, kHeadlineId90,
  kHeadlineId91, kHeadlineId92, kHeadlineId93, kHeadlineId94, kHeadlineId95,
  kHeadlineId96, kHeadlineId97, kHeadlineId98, kHeadlineId99, kHeadlineId100,
  // Add more IDs if needed, up to kHeadlineId450
];

final Map<String, List<String>> _titlesByLang = {
  'en': [
    'AI Breakthrough: New Model Achieves Human-Level Performance',
    'Local Team Wins Championship in Thrilling Final',
    'Global Leaders Meet to Discuss Climate Change Policies',
    'New Planet Discovered in Distant Galaxy',
    'Breakthrough in Cancer Research Offers New Hope',
    'Blockbuster Movie Breaks Box Office Records',
    'Stock Market Reaches All-Time High Amid Economic Boom',
    'New Travel Restrictions Lifted for Popular Destinations',
    'Michelin Star Chef Opens New Restaurant in City Center',
    'Innovative Teaching Methods Boost Student Engagement',
    'Cybersecurity Firms Warn of New Global Threat',
    'Olympics Committee Announces Host City for 2032 Games',
    'New Bill Aims to Reform Healthcare System',
    'Archaeologists Uncover Ancient City Ruins',
    'Dietary Guidelines Updated for Public Health',
    'Music Festival Announces Star-Studded Lineup',
    'Tech Giant Acquires Startup in Multi-Billion Dollar Deal',
    'Space Tourism Takes Off: First Commercial Flights Announced',
    'Future of Food: Lab-Grown Meat Gains Popularity',
    'Online Learning Platforms See Surge in Enrollment',
    'Quantum Computing Achieves New Milestone',
    'World Cup Qualifiers: Unexpected Upsets Shake Rankings',
    'Election Results: New Government Takes Power',
    'Breakthrough in Fusion Energy Research Announced',
    'Mental Health Awareness Campaign Launched Globally',
    'Gaming Industry Sees Record Growth in Virtual Reality',
    'Global Supply Chain Disruptions Impacting Consumer Goods',
    'Arctic Expedition Discovers New Marine Species',
    'Rise of Plant-Based Cuisine: New Restaurants Open',
    'Education Technology Transforms Classrooms',
    'SpaceX Launches New Satellite Constellation',
    'Football Legend Announces Retirement',
    'G7 Summit Concludes with Joint Statement on Global Economy',
    "Breakthrough in Alzheimer's Research Offers New Treatment Path",
    'Global Vaccination Campaign Reaches Billions',
    'Streaming Wars Intensify with New Platform Launches',
    'Cryptocurrency Market Experiences Major Volatility',
    'Sustainable Tourism Initiatives Gain Momentum',
    'Food Security Summit Addresses Global Hunger',
    'Robotics in Education: New Tools for Learning',
    'AI Ethics Debate Intensifies Among Tech Leaders',
    'Esports Industry Sees Massive Investment Boom',
    'International Sanctions Imposed on Rogue State',
    'New Species of Deep-Sea Creature Discovered',
    'Global Health Crisis: New Pandemic Preparedness Plan',
    'Hollywood Strikes Continue: Impact on Film Production',
    'Emerging Markets Show Strong Economic Resilience',
    'Adventure Tourism Booms in Remote Regions',
    'The Rise of Sustainable Food Packaging',
    'Personalized Learning: Tailoring Education to Individual Needs',
  ],
  'ar': [
    'إنجاز في الذكاء الاصطناعي: نموذج جديد يحقق أداءً على المستوى البشري',
    'الفريق المحلي يفوز بالبطولة في نهائي مثير',
    'قادة العالم يجتمعون لمناقشة سياسات تغير المناخ',
    'اكتشاف كوكب جديد في مجرة بعيدة',
    'تقدم في أبحاث السرطان يقدم أملاً جديدًا',
    'فيلم ضخم يحطم الأرقام القياسية في شباك التذاكر',
    'سوق الأسهم يصل إلى أعلى مستوى له على الإطلاق وسط ازدهار اقتصادي',
    'رفع قيود السفر الجديدة عن وجهات شهيرة',
    'شيف حائز على نجمة ميشلان يفتتح مطعمًا جديدًا في وسط المدينة',
    'طرق التدريس المبتكرة تعزز مشاركة الطلاب',
    'شركات الأمن السيبراني تحذر من تهديد عالمي جديد',
    'اللجنة الأولمبية تعلن عن المدينة المضيفة لألعاب 2032',
    'مشروع قانون جديد يهدف إلى إصلاح نظام الرعاية الصحية',
    'علماء الآثار يكشفون عن أطلال مدينة قديمة',
    'تحديث المبادئ التوجيهية الغذائية للصحة العامة',
    'مهرجان موسيقي يعلن عن قائمة نجوم مرصعة بالنجوم',
    'عملاق التكنولوجيا يستحوذ على شركة ناشئة في صفقة بمليارات الدولارات',
    'السياحة الفضائية تنطلق: الإعلان عن أولى الرحلات التجارية',
    'مستقبل الغذاء: اللحوم المزروعة في المختبر تكتسب شعبية',
    'منصات التعلم عبر الإنترنت تشهد طفرة في التسجيل',
    'الحوسبة الكمومية تحقق إنجازًا جديدًا',
    'تصفيات كأس العالم: مفاجآت غير متوقعة تهز التصنيفات',
    'نتائج الانتخابات: حكومة جديدة تتولى السلطة',
    'الإعلان عن تقدم كبير في أبحاث طاقة الاندماج',
    'إطلاق حملة توعية بالصحة النفسية على مستوى العالم',
    'صناعة الألعاب تشهد نموًا قياسيًا في الواقع الافتراضي',
    'اضطرابات سلسلة التوريد العالمية تؤثر على السلع الاستهلاكية',
    'بعثة استكشافية في القطب الشمالي تكتشف أنواعًا بحرية جديدة',
    'صعود المطبخ النباتي: افتتاح مطاعم جديدة',
    'تكنولوجيا التعليم تغير الفصول الدراسية',
    'سبيس إكس تطلق كوكبة أقمار صناعية جديدة',
    'أسطورة كرة القدم يعلن اعتزاله',
    'قمة مجموعة السبع تختتم ببيان مشترك حول الاقتصاد العالمي',
    'تقدم في أبحاث الزهايمر يقدم مسارًا علاجيًا جديدًا',
    'حملة التطعيم العالمية تصل إلى المليارات',
    'حروب البث تشتد مع إطلاق منصات جديدة',
    'سوق العملات المشفرة يشهد تقلبات كبيرة',
    'مبادرات السياحة المستدامة تكتسب زخمًا',
    'قمة الأمن الغذائي تتناول الجوع العالمي',
    'الروبوتات في التعليم: أدوات جديدة للتعلم',
    'جدل أخلاقيات الذكاء الاصطناعي يشتد بين قادة التكنولوجيا',
    'صناعة الرياضات الإلكترونية تشهد طفرة استثمارية هائلة',
    'فرض عقوبات دولية على دولة مارقة',
    'اكتشاف أنواع جديدة من مخلوقات أعماق البحار',
    'أزمة صحية عالمية: خطة جديدة للتأهب للأوبئة',
    'إضرابات هوليوود مستمرة: التأثير على إنتاج الأفلام',
    'الأسواق الناشئة تظهر مرونة اقتصادية قوية',
    'ازدهار سياحة المغامرات في المناطق النائية',
    'صعود أغلفة المواد الغذائية المستدامة',
    'التعلم المخصص: تكييف التعليم مع الاحتياجات الفردية',
  ],
};
