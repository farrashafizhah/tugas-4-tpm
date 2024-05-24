class Sites {
  String id;
  String name;
  String desc;
  String imgUrl;
  String sitesUrl;
  bool isFavorite;

  Sites({
    required this.id,
    required this.name,
    required this.desc,
    required this.imgUrl,
    required this.sitesUrl,
    this.isFavorite = false,
  });
}

var listSites = [
  Sites(
      id: 'sites1',
      name: 'Khan Academy',
      desc:
      'Khan Academy telah lama populer di kalangan siswa yang mencari konten pendidikan gratis dan berkualitas. Dengan kurikulum matematika yang luas, Khan Academy mencakup segala hal mulai dari aritmetika dasar hingga kalkulus tingkat lanjutan. Situs web ini menyediakan pelajaran video, latihan interaktif, dan jalur pembelajaran yang dipersonalisasi sesuai dengan kebutuhan individu siswa.',
      imgUrl: 'assets/sites_rec_img/khan.png',
      sitesUrl: 'https://www.khanacademy.org/math'),
  Sites(
      id: 'sites2',
      name: 'Wiingy',
      desc:
      'Wiingy tanpa ragu merupakan salah satu situs terbaik untuk belajar matematika. Dengan pendekatan personal dan tutor matematika pribadi yang berkualifikasi, Wiingy menawarkan pengalaman belajar yang luar biasa bagi siswa dari segala usia dan tingkat kemampuan. Sesi tutor matematika 1-on-1 dari Wiingy mengakomodasi gaya belajar individu, memastikan siswa mendapatkan perhatian dan bimbingan yang intensif.',
      imgUrl: 'assets/sites_rec_img/wiingy.png',
      sitesUrl: 'https://wiingy.com/tutoring/subject/math-tutors/'),
  Sites(
      id: 'sites3',
      name: 'Brilliant',
      desc:
      'Brilliant fokus pada pengembangan keterampilan pemecahan masalah melalui kurikulum matematika mereka. Situs web ini menawarkan pelajaran interaktif yang mendorong pembelajar untuk berpikir kritis dan menerapkan konsep matematika dalam skenario dunia nyata. Dengan pendekatan yang praktis, Brilliant menyajikan teka-teki, kuis, dan tantangan yang menantang siswa secara aktif.',
      imgUrl: 'assets/sites_rec_img/brilliant.png',
      sitesUrl: 'https://brilliant.org/'),
  Sites(
      id: 'sites4',
      name: 'Mathway',
      desc:
      'Mathway sangat berguna bagi siswa yang membutuhkan bantuan instan dalam menyelesaikan masalah matematika. Situs web ini menawarkan antarmuka yang mudah digunakan di mana siswa dapat memasukkan masalah matematika mereka dan menerima solusi langkah demi langkah. Mulai dari aritmetika dasar hingga kalkulus kompleks, Mathway mencakup berbagai topik matematika.',
      imgUrl: 'assets/sites_rec_img/mathway.png',
      sitesUrl: 'https://www.mathway.com/'),
  Sites(
      id: 'sites5',
      name: 'Wolfram Alpha',
      desc:
      'Wolfram Alpha adalah mesin pengetahuan komputasi yang dapat menjawab pertanyaan matematika yang kompleks. Banyak masalah matematika, seperti persamaan algebra, masalah kalkulus, statistik, dll., memiliki solusi komprehensif yang tersedia secara online. Berkat kemampuan komputasinya yang kuat, Wolfram Alpha merupakan alat yang sangat berharga bagi siswa matematika tingkat lanjut dan para profesional.',
      imgUrl: 'assets/sites_rec_img/wolfram.png',
      sitesUrl: 'https://www.wolframalpha.com/'),
  Sites(
      id: 'sites6',
      name: 'IXL',
      desc:
      'IXL menawarkan latihan matematika komprehensif untuk siswa mulai dari pra-taman hingga sekolah menengah atas. Situs web ini mencakup berbagai topik dan menyediakan latihan interaktif untuk memperkuat pembelajaran. Teknologi pembelajaran adaptif IXL menyesuaikan konten dengan individu siswa, memastikan mereka mendapatkan tantangan dan dukungan yang sesuai.',
      imgUrl: 'assets/sites_rec_img/ixl.png',
      sitesUrl: 'https://in.ixl.com/maths'),
  Sites(
      id: 'sites7',
      name: 'Math Playground',
      desc:
      'Math Playground adalah situs web pendidikan yang menggabungkan latihan matematika dengan permainan dan aktivitas yang menyenangkan. Platform ini menawarkan berbagai permainan matematika interaktif yang melibatkan siswa sambil memperkuat konsep matematika. Permainan ini mencakup berbagai topik, seperti aritmetika, geometri, pecahan, dan masalah kata.',
      imgUrl: 'assets/sites_rec_img/mathpg.png',
      sitesUrl: 'https://www.mathplayground.com/'),
  Sites(
      id: 'sites8',
      name: 'ALEKS',
      desc:
      'ALEKS (Assessment and Learning in Knowledge Spaces) adalah program pembelajaran adaptif yang menawarkan tutor matematika untuk menangani kebutuhan siswa secara individu. Situs web ini dimulai dengan penilaian komprehensif untuk mengidentifikasi kesenjangan pengetahuan dan kemudian memberikan pelajaran yang dipersonalisasi untuk mengatasi area tersebut. ALEKS menawarkan kurikulum matematika yang kuat untuk siswa K-12 dan tingkat perguruan tinggi.',
      imgUrl: 'assets/sites_rec_img/aleks.png',
      sitesUrl: 'https://www.aleks.com/?_s=1236784931681408'),
  Sites(
      id: 'sites9',
      name: 'Math.com',
      desc:
      'Math.com adalah situs web serbaguna yang menawarkan berbagai sumber daya matematika untuk siswa dari segala usia. Ini menyediakan pelajaran matematika interaktif, soal latihan, permainan matematika, dan kamus matematika untuk membantu memahami istilah dan konsep matematika. Math.com mencakup topik dari aritmetika dasar hingga kalkulus lanjutan, menjadikannya cocok untuk pembelajar pada berbagai tingkat kecakapan.',
      imgUrl: 'assets/sites_rec_img/math.png',
      sitesUrl: 'http://www.math.com/'),
  Sites(
      id: 'sites10',
      name: 'MathPlanet',
      desc:
      'MathPlanet menyediakan kursus matematika gratis untuk membantu siswa menguasai konsep matematika. Situs web ini menawarkan video pembelajaran, latihan interaktif, dan tes latihan yang mencakup berbagai topik seperti aljabar, geometri, dan trigonometri. Konten MathPlanet terstruktur, memungkinkan siswa untuk maju melalui berbagai tingkat dan membangun dasar yang kuat dalam matematika.',
      imgUrl: 'assets/sites_rec_img/mathplanet.png',
      sitesUrl: 'https://www.mathplanet.com/')
];
