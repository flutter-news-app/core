import 'package:core/core.dart';

/// A list of predefined comments for fixture data.
///
/// This function can be configured to generate comments in either English or
/// Arabic. It creates 10 comments for each of the first 10 users, with each
/// comment targeting a unique headline.
List<Comment> getHeadlineCommentsFixturesData({
  String languageCode = 'en',
  DateTime? now,
}) {
  final comments = <Comment>[];
  final users = usersFixturesData.take(10).toList();

  // Ensure only approved languages are used, default to 'en'.
  final resolvedLanguageCode = ['en', 'ar'].contains(languageCode)
      ? languageCode
      : 'en';
  final language = SupportedLanguage.values.byName(resolvedLanguageCode);

  final commentContentsByLang = <String, List<String>>{
    'en': [
      'This is a really insightful article. It completely changed my perspective.',
      "I'm not sure I agree with the author's conclusion, but it's a well-argued piece.",
      'Finally, someone is talking about this! More people need to read this.',
      'A bit simplistic, but a good introduction to the topic for beginners.',
      'The data presented here is fascinating. I wonder what the long-term implications are.',
      'This is exactly what I was looking for. Thank you for sharing!',
      'I have a few questions about the methodology used in this study.',
      'This made me laugh out loud. Great writing!',
      "A powerful and moving story. It's important to hear these voices.",
      'I think there are some key facts missing from this analysis.',
    ],
    'ar': [
      'هذا مقال ثاقب حقًا. لقد غير وجهة نظري تمامًا.',
      'لست متأكدًا من أنني أتفق مع استنتاج المؤلف، لكنها قطعة جيدة الحجة.',
      'أخيرًا، هناك من يتحدث عن هذا! المزيد من الناس بحاجة إلى قراءة هذا.',
      'مبسط بعض الشيء، لكنه مقدمة جيدة للمبتدئين.',
      'البيانات المقدمة هنا رائعة. أتساءل ما هي الآثار طويلة المدى.',
      'هذا هو بالضبط ما كنت أبحث عنه. شكرًا لك على المشاركة!',
      'لدي بعض الأسئلة حول المنهجية المستخدمة في هذه الدراسة.',
      'هذا جعلني أضحك بصوت عال. كتابة رائعة!',
      'قصة قوية ومؤثرة. من المهم سماع هذه الأصوات.',
      'أعتقد أن هناك بعض الحقائق الأساسية المفقودة من هذا التحليل.',
    ],
    'es': [
      'Este es un artículo realmente perspicaz. Cambió completamente mi perspectiva.',
      'No estoy seguro de estar de acuerdo con la conclusión del autor, pero es una pieza bien argumentada.',
      '¡Por fin alguien habla de esto! Más gente necesita leer esto.',
      'Un poco simplista, pero una buena introducción al tema para principiantes.',
      'Los datos presentados aquí son fascinantes. Me pregunto cuáles son las implicaciones a largo plazo.',
      'Esto es exactamente lo que estaba buscando. ¡Gracias por compartir!',
      'Tengo algunas preguntas sobre la metodología utilizada en este estudio.',
      'Esto me hizo reír a carcajadas. ¡Gran escritura!',
      'Una historia poderosa y conmovedora. Es importante escuchar estas voces.',
      'Creo que faltan algunos hechos clave en este análisis.',
    ],
    'fr': [
      "C'est un article vraiment perspicace. Cela a complètement changé ma perspective.",
      "Je ne suis pas sûr d'être d'accord avec la conclusion de l'auteur, mais c'est un article bien argumenté.",
      "Enfin, quelqu'un en parle ! Plus de gens doivent lire ceci.",
      'Un peu simpliste, mais une bonne introduction au sujet pour les débutants.',
      'Les données présentées ici sont fascinantes. Je me demande quelles sont les implications à long terme.',
      "C'est exactement ce que je cherchais. Merci du partage !",
      "J'ai quelques questions sur la méthodologie utilisée dans cette étude.",
      "Cela m'a fait rire aux éclats. Superbe écriture !",
      "Une histoire puissante et émouvante. Il est important d'entendre ces voix.",
      "Je pense qu'il manque des faits clés dans cette analyse.",
    ],
    'pt': [
      'Este é um artigo realmente perspicaz. Mudou completamente minha perspectiva.',
      'Não tenho certeza se concordo com a conclusão do autor, mas é uma peça bem argumentada.',
      'Finalmente, alguém está falando sobre isso! Mais pessoas precisam ler isso.',
      'Um pouco simplista, mas uma boa introdução ao tópico para iniciantes.',
      'Os dados apresentados aqui são fascinantes. Eu me pergunto quais são as implicações a longo prazo.',
      'Isso é exatamente o que eu estava procurando. Obrigado por compartilhar!',
      'Tenho algumas perguntas sobre a metodologia usada neste estudo.',
      'Isso me fez rir alto. Ótima escrita!',
      'Uma história poderosa e comovente. É importante ouvir essas vozes.',
      'Acho que faltam alguns fatos importantes nesta análise.',
    ],
    'de': [
      'Das ist ein wirklich aufschlussreicher Artikel. Er hat meine Perspektive völlig verändert.',
      'Ich bin mir nicht sicher, ob ich der Schlussfolgerung des Autors zustimme, aber es ist ein gut argumentierter Beitrag.',
      'Endlich spricht jemand darüber! Mehr Leute müssen das lesen.',
      'Ein bisschen vereinfacht, aber eine gute Einführung in das Thema für Anfänger.',
      'Die hier präsentierten Daten sind faszinierend. Ich frage mich, was die langfristigen Auswirkungen sind.',
      'Das ist genau das, wonach ich gesucht habe. Danke fürs Teilen!',
      'Ich habe ein paar Fragen zur Methodik, die in dieser Studie verwendet wurde.',
      'Das hat mich laut zum Lachen gebracht. Toller Schreibstil!',
      'Eine kraftvolle und bewegende Geschichte. Es ist wichtig, diese Stimmen zu hören.',
      'Ich denke, in dieser Analyse fehlen einige wichtige Fakten.',
    ],
    'it': [
      'Questo è un articolo davvero perspicace. Ha cambiato completamente la mia prospettiva.',
      "Non sono sicuro di essere d'accordo con la conclusione dell'autore, ma è un pezzo ben argomentato.",
      'Finalmente qualcuno ne parla! Più persone devono leggere questo.',
      "Un po' semplicistico, ma una buona introduzione all'argomento per i principianti.",
      'I dati presentati qui sono affascinanti. Mi chiedo quali siano le implicazioni a lungo termine.',
      'Questo è esattamente quello che stavo cercando. Grazie per la condivisione!',
      'Ho alcune domande sulla metodologia utilizzata in questo studio.',
      'Mi ha fatto ridere ad alta voce. Ottima scrittura!',
      'Una storia potente e commovente. È importante ascoltare queste voci.',
      'Penso che manchino alcuni fatti chiave in questa analisi.',
    ],
    'zh': [
      '这是一篇非常有见地的文章。它完全改变了我的看法。',
      '我不确定我是否同意作者的结论，但这确实是一篇论证充分的文章。',
      '终于有人谈论这个了！更多的人需要阅读这篇文章。',
      '有点简单，但对于初学者来说是一个很好的入门介绍。',
      '这里呈现的数据令人着迷。我想知道长期的影响是什么。',
      '这正是我一直在寻找的。谢谢分享！',
      '我对这项研究中使用的方法有一些疑问。',
      '这让我大笑起来。写得太好了！',
      '一个强大而感人的故事。听到这些声音很重要。',
      '我认为这篇分析中缺少一些关键事实。',
    ],
    'hi': [
      'यह वास्तव में एक بصیرتपूर्ण लेख है। इसने मेरे दृष्टिकोण को पूरी तरह से बदल दिया।',
      'मुझे यकीन नहीं है कि मैं लेखक के निष्कर्ष से सहमत हूं, लेकिन यह एक अच्छी तरह से तर्क दिया गया टुकड़ा है।',
      'आखिरकार, कोई इस बारे में बात कर रहा है! और लोगों को इसे पढ़ने की जरूरत है।',
      'थोड़ा सरल, लेकिन शुरुआती लोगों के लिए विषय का एक अच्छा परिचय।',
      'यहाँ प्रस्तुत डेटा आकर्षक है। मुझे आश्चर्य है कि दीर्घकालिक प्रभाव क्या हैं।',
      'यह वही है जिसकी मुझे तलाश थी। साझा करने के लिए धन्यवाद!',
      'इस अध्ययन में उपयोग की गई कार्यप्रणाली के बारे में मेरे कुछ प्रश्न हैं।',
      'इसने मुझे जोर से हंसाया। बहुत बढ़िया लेखन!',
      'एक शक्तिशाली और मार्मिक कहानी। इन आवाजों को सुनना महत्वपूर्ण है।',
      'मुझे लगता है कि इस विश्लेषण से कुछ प्रमुख तथ्य गायब हैं।',
    ],
    'ja': [
      'これは本当に洞察に満ちた記事です。私の視点を完全に変えました。',
      '著者の結論に同意できるかわかりませんが、よく論じられた作品です。',
      'ついに誰かがこれについて話しています！もっと多くの人がこれを読む必要があります。',
      '少し単純化されていますが、初心者にとっては良いトピックの紹介です。',
      'ここで提示されたデータは魅力的です。長期的な影響がどうなるか気になります。',
      'これはまさに私が探していたものです。共有してくれてありがとう！',
      'この研究で使用された方法論についていくつか質問があります。',
      'これは私を大声で笑わせました。素晴らしい文章です！',
      '力強く感動的な物語。これらの声を聞くことは重要です。',
      'この分析にはいくつかの重要な事実が欠けていると思います。',
    ],
  };

  final commentContents = commentContentsByLang[resolvedLanguageCode]!;

  for (var i = 0; i < users.length; i++) {
    for (var j = 0; j < 10; j++) {
      final commentIndex = i * 10 + j;

      // Vary the status for realism. Default to resolved.
      var status = ModerationStatus.resolved;
      if (commentIndex % 15 == 0) {
        status = ModerationStatus.pendingReview;
      }

      comments.add(
        Comment(
          language: language,
          content: commentContents[j],
          status: status,
        ),
      );
    }
  }

  return comments;
}
