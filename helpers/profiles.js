//TODO: make a profiles_events mapper
module.exports = function (req) {
  return [
    {
      name: "Beckaly Franks",
      id: "beckaly_franks",
      description: req.t("beckaly_franks_desc")
    },
    {
      name: "Dustin Wessa",
      id: "dustin_wessa",
      description: req.t('dustin_wessa_desc'),
      type: 'chef'
    },
    {
      name: "Tristan Stephenson",
      id: "tristan_stephenson",
      description: req.t('tristan_stephenson_desc')
    },
    {
      name: "Nagatomo Shuichi",
      id: "nagatomo_shuichi",
      description: req.t('nagatomo_shuichi_desc')
    },
    {
      name: "Ryu Fuji",
      id: "ryu_fuji",
      description: req.t('ryu_fuji_desc')
    },
    {
      name: "Alli Nguyen",
      id: "alli_nguyen",
      description: req.t('alli_nguyen_desc')
    },
    {
      name: "Jacopo Rosito",
      id: "jacopo_rosito",
      description: req.t('jacopo_rosito_desc')
    },
    {
      name: "Seongha Lee",
      id: "seongha_lee",
      description: req.t('seongha_lee_desc')
    },
    {
      name: "Masahiko Endo",
      id: "masahiko_endo",
      description: req.t('masahiko_endo_desc')
    },
    {
      name: "Richard Fawcett",
      id: "richard_fawcett",
      description: req.t('richard_fawcett_desc')
    },
    {
      name: "John Ng",
      id: "john_ng",
      description: req.t('john_ng_desc')
    },
    {
      name: "Matt Solario",
      id: "matt_solario",
      description: req.t('matt_solario_desc')
    },
    {
      name: "Koji Esashi",
      id: "koji_esashi",
      description: req.t('koji_esashi_desc')
    },
    {
      name: "Toshihiro Fukami",
      id: "toshihiro_fukami",
      description: req.t('toshihiro_fukami_desc')
    },
    {
      name: "Kunihiko Nobuhara",
      id: "kunihiko_nobuhara",
      description: req.t('kunihiko_nobuhara_desc')
    },
    {
      name: "Kiki Moka",
      id: "kiki_moka",
      description: req.t('kiki_moka_desc')
    },
    {
      name: "Greg Boehm",
      id: "greg_boehm",
      description: req.t('greg_boehm_desc'),
      type: 'speaker'
    },
    {
      name: "Jisung Chun",
      id: "jisung_chun",
      description: req.t('jisung_chun_desc'),
      type: 'speaker'
    },
    {
      name: "Yumi Takekoshi",
      id: "yumi_takekoshi",
      description: req.t('yumi_takekoshi_desc'),
      type: 'speaker'
    },
    {
      name: "Nicolas Julhes",
      id: "nicolas_julhes",
      description: req.t('nicolas_julhes_desc'),
      type: 'speaker'
    },
    {
      name: "Guilhem Grosperrin",
      id: "guilhem_grosperrin",
      description: req.t('guilhem_grosperrin_desc'),
      type: 'speaker'
    },
    {
      name: "Minzi Kim Wind",
      id: "minzi_kim_wind",
      description: req.t('minzi_kim_wind_desc'),
      type: 'chef'
    },
    {
      name: "Kevin Attal",
      id: "kevin_attal",
      description: req.t('kevin_attal_desc'),
      type: 'chef'
    },
    {
      name: "Ioana Munteanu",
      id: "ioana_munteanu",
      description: req.t('ioana_munteanu'),
    }
  ]
};