enum KaraokeModel { ks1, ks, home, p, bravo, hermosa, reyna }

class KaraokeModelInfo {
  final int id;
  final String name;
  final String description;
  final KaraokeModel value;
  final String path;

  KaraokeModelInfo({
    this.id,
    this.name,
    this.description,
    this.value,
    this.path,
  });
}

final List<KaraokeModelInfo> modelInfo = [
  KaraokeModelInfo(
    id: 1,
    name: 'KS-1',
    value: KaraokeModel.ks1,
    path: 'songlist_ks1',
  ),
  KaraokeModelInfo(
    id: 2,
    name: 'KS',
    description: 'KS-5/Junior Lite | KS-10/Junior 2 | KS-40/KBOX-2',
    value: KaraokeModel.ks,
    path: 'songlist_ks',
  ),
  KaraokeModelInfo(
    id: 3,
    name: 'Hermosa',
    description: 'Hermosa | N20 Nano Plus',
    value: KaraokeModel.hermosa,
    path: 'songlist_hermosa',
  ),
  KaraokeModelInfo(
    id: 4,
    name: 'Home',
    description: 'Home 40 | Nano',
    value: KaraokeModel.home,
    path: 'songlist_home40',
  ),
  KaraokeModelInfo(
    id: 5,
    name: 'P-Series',
    value: KaraokeModel.p,
    path: 'songlist_p',
  ),
  KaraokeModelInfo(
    id: 6,
    name: 'Bravo',
    description: 'Bravo | A 10',
    value: KaraokeModel.bravo,
    path: 'songlist_bravo',
  ),
  KaraokeModelInfo(
    id: 7,
    name: 'Reyna',
    description: 'Reyna 1|2|3|3c',
    value: KaraokeModel.reyna,
    path: 'songlist_reyna',
  ),
];
