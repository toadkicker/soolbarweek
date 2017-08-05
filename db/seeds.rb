# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'todd@toadkicker.com',
            password: 'glade123',
            is_admin: true,
            locale: 'en')

def load_translations
  en_seed_file = Rails.root.join('config', 'locales', 'migrated-to-db', 'en.yml')
  en_yml = YAML.load_file(en_seed_file)

  en_yml.fetch('en').each { |k, v| Translation.create(key: k, value: v, locale: 'en') }

  devise_en_seed_file = Rails.root.join('config', 'locales', 'migrated-to-db', 'devise.en.yml')
  devise_yml = YAML.load_file(devise_en_seed_file)

  devise_yml.fetch('en').each { |k, v| Translation.create(key: k, value: v, locale: 'en') }

  kr_seed_file = Rails.root.join('config', 'locales', 'migrated-to-db', 'ko-kr.yml')
  kr_yml = YAML.load_file(kr_seed_file)

  kr_yml.fetch('ko-kr').each { |k, v| Translation.create(key: k, value: v, locale: 'ko-kr') }
end

load_translations

profiles = [
  {
    name: 'Alli Nguyen',
    slug: 'alli-nguyey',
    description: "At just 22 years old, she has garnered an impressive range of experience
    and success in various bartending competitions.  In the last 4 years, she has won
    the “Hendrick’s Cocktail Competition” for Hong Kong in 2014 as well as the title
    of Champion for the “Bols Around the World” Bartending Competition (Asia Pacific)
    in 2015, leading to representing Hong Kong in the Global Finals in Amsterdam.  Other
    notable achievements include the Monin Cup Competition (in 2014 and 2016), where
    she was placed within the Top 3 winners, last year being nominated as a Top 10 Finalist
    in The Bar Awards Hong Kong as “Young Bartender of the Year,” and this year she
    became one of the Top 25 Bartenders of Hong Kong and Macau.Aili left school early
    and began her career at a Delifrance as a shop assistant before being quickly promoted
    to be a Team Leader.  She then joined Fofo by El Willy as a waitress, and that was
    where her interest in cocktails started to grow.  In 2013, she was spotted and hired
    by current boss Antonio Lai (of Quinary fame) to be part of the opening team at
    Ori-gin, one of the first gin-focused bars in Hong Kong.  Since then she has proved
    to be a passionate and dedicated bartender participating in various cocktail competitions
    with notable results and continuously improving her skills through brand and product
    trainings and English language classes.  Her zeal and loyalty led to her selection
    as the opening team for Antonio’s latest and biggest venture till January 2017,
    VEA Restaurant & Lounge.  Working at VEA made her more familiar with food and cocktail
    pairing. After she left VEA, she became a freelance hospitality professional to
    work with different companies/guest cooperation for event and private party and
    to learn more about working outside of the bar.  In June 2017, she started working
    at Employees Only Hong Kong as an apprentice to get back to the basics and learn
    American bar culture and work style, as well as to enhance her work experience and
    ability.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'alli_nguyen.jpg'))
  },
  {
    name: 'Beckaly Franks',
    slug: 'beckaly-franks',
    description: "<p>Beckaly Franks is an award-winning bartender and mixologist
    from Portland, Oregon.  She has spent nearly a decade behind the bar and frequently
    works as an advisor, consulting on cocktail menus around the country.</p><p>Formally
    found behind the bar at celebrated restaurant Clyde Common.  The bar boast s a three-time
    James Beard nominated program, four Tales of the Cocktail World’s Best Hotel bar
    nominations, and numerous accolades from the New York Times, Esquire, Playboy, and
    the Wall Street Journal.</p><p>In 2012, she was the first American female to ever
    win a global cocktail competition, bringing home the trophy from New Zealand at
    the 42 Below World Cup.</p><p>Beckaly relocated to HK in 2015 to open The Pontiac,
    a coyote ugly-esque craft neighborhood dive bar which was the proud recipient of
    Asia’s 50 Best Bars for two years in a row (#19 in 2016 and #16 in 2017).  Inspired
    by the neighborhood watering holes of Portland, Brooklyn and San Francisco, the
    Pontiac wants to establish a relationship with each and every one of their customers
    so they become almost like a second family — albeit a slightly wild and quirky one.
    \ Beckaly Franks was also the first to win the Ada Coleman awards for leading female
    in Hong Kong’s bar industry.</p>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'beckaly_franks.jpg'))
  },
  {
    name: 'Dustin Wessa',
    slug: 'dustin-wessa',
    description: "Dustin Wessa, ‘chef’ owner of Dandy Pink is a slightly odd eccentric
    obsessed first and foremost with the flavors of the forest.  Known for filling baskets
    with wild mushrooms and native herbs and preferring coal and wood as fuel to the
    comforts of a modern kitchen, his style of cookery could be considered archaic.  A
    self defined alcoholist(sic) the bounty of the wild often finds its way into tenacious
    tinctures and bizarre bitters.  He’d rather be scrapin up bits of nature, creepin
    towards Valhalla and collaborating with those that cook better than breathing sanitizer
    in a stainless steel fortress.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'dustin_wessa.jpg'))
  },
  {
    name: 'Tristan Stephenson',
    slug: 'tristan-stephenson',
    description: "Tristan is widely respected as one of the main pioneers of
    molecular mixology and modernist bartending.  Tristan’s journey has taken him to
    180 distilleries, through the history of drinking, distillation, molecular mixology,
    barista skills and flavor science. Tristan has trained bartenders and hospitality
    professionals in over thirty countries; is a regular speaker at Tales of the Cocktail,
    and was awarded CLASS Bartender of the Year in 2011 and came runner-up in the UK
    barista championships in 2009.  His first book, The Curious Bartender, became an
    Evening Standard Bestseller in 2013 and was followed up by two further books covering
    the topics of Whisky and Coffee.  His fourth book, The Curious Bartender’s Gin Palace,
    was released in Spring 2016.  He’s currently working on the fifth…",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'tristan_stephenson.jpg'))
  },
  {
    name: 'Nagatomo Shuichi',
    slug: 'nagatomo-shuichi',
    description: "Shuichi Nagatomo has over 20 years experience as a bartender
    in Fukuoka and Tokyo.  He is recognized as a successor to Mr. Kazuo Uyeda and mentor
    in his own right to generations of Japanese bartenders.  Shuichi owns Bar Seven
    Seas, Bar Palme D’or, and Bar Oscar- a bartender at the latter - and board member
    in numerous Japanese bartending organizations.  His many cocktail competitions victories
    stretch as far back as 1994, and he is delighted to share his passion for his country
    and his craft with us in Seoul.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'nagatomo_shuichi.jpg'))
  },
  {
    name: 'Jacopo Rosita',
    slug: 'jacopo-rosito',
    description: "Jacopo Rosita class 1987 has been trained by AIBES which is the
    most recognized association for bartenders in Italy. After a few years working in
    trendy American Bars in Florence, in 2011 he starts working for one of the most
    prestigious hotels in the world, Four Seasons Hotel in Firenze. There, he had the
    opportunity to work and collaborate with some of the most important bartenders in
    the world and he learned how a meticulous attention to details count in this industry.  The
    Atrium Bar at the Four Seasons Hotel has been recognized several times as one of
    the best of Italy. In 2015 he challenged himself and moved to USA where he currently
    runs 54 Mint, a well known Restaurant and Bar located in San Francisco, as General
    Manager and Head Mixologist. During his career he obtained several important recognitions,
    participating in national and international mixologist competitions, such as Disaronno
    Mixing Start, Bols Around the World, Road to the Hacienda Herradura.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'jacopo_rosito.jpg'))
  },
  {
    name: 'Seongha Lee',
    slug: 'seongha-lee',
    description: "<h3>Bar, K Osaka - Head Bartender, Manager</h3> <p class=\"lead\">Opened
    in 1988, Bar K is one of the most famous Japanese classic cocktails and whisky bars
    in Japan</p> <p>Born in Incheon, Korea and raised in Seoul. Against his family’s
    wishes, Lee poured the same level of intensity he passed the Korean licensing exam,
    further studying for a year in Japan and within six years, he was entering and placing
    in international competitions that allowed him to realize his ambitions. After winning
    for South Korea and placing in the top five of the Boys Around the World contest,
    SeongHa answered an inquiry for a “Japanese style bartender” to open a private bar
    in downtown Las Vegas. Unexpectedly he took to the foreign city, finding in its
    close-knit bar community a second family.</p> <p>Currently leading the bar program
    at the dramatic Japanese restaurant Zuma in the Cosmopolitan of Las Vegas, Lee —
    a highball enthusiast — thinks the total bartender needs to have personality, a
    sense of hospitality, and technique in equal measures. He leads by example, his
    ice carving skills just as surgically exacting as his dry sarcastic wit. Eventually,
    he hopes to open his own watering holes, both in Last Vegas and Seoul, and create
    an exchange program that give opportunity to bartenders like himself.</p> <p class=\"lead\">Competitions</p>
    <dl> <dt>2011-2013</dt> <dd>Diageo World Class Korea - Finalist</dd> <dt>2013</dt>
    <dd>Bols Around the World - South Korea Winner and Global Finalist 2015</dd> <dd>Bols
    Around the World - USA Winner & Global Finalist</dd> <dt>2015</dt> <dd>Bombay Sapphire
    Most Imaginative Bartender Competition - 2nd Place & PEople’s Choice</dd> <dt>2016</dt>
    <dd>Las Vegas’ Best Bartender Competition - Winner</dd> <dt>2016</dt> <dd>Marie
    Brizard Masters - USA Winner and Global Finalist</dd> <dt>2017</dt> <dd>Bombay Sapphire
    Most Imaginative Bartender Competition - First Place, Southwest regionals</dd> </dl>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'seongha_lee.jpg'))
  },
  {
    name: 'Masahiko Endo',
    slug: 'masahiko-endo',
    description: "<p>Born in Kyoto in 1974, then moved to Kobe and Fukuoka.</p><p>Started
    to work as a bartender after graduation of university in 1997.</p><p>Participated
    in several cocktail competitions and got several awards.</p><p>In the end of 2014,
    moved to HK and open Mizunara: The Library.</p><p>And having been doing some cocktail
    and whisky seminars or as a judge for some competitions.</p><h3>Brief Award record:</h3><dl><dt>2004</dt><dd>join
    in JWS in SG</dd><dt>2005</dt><dd>Asia Pacific Cocktail Competition as a Japanese
    representative</dd><dt>2006</dt><dd>Pernod Ricard Dita Cocktail Competition Champion</dd><dt>2006</dt><dd>Taipei
    International Golden Cup Cocktail Competition 2nd Place</dd><dt>2008</dt><dd>Suntory
    Cocktail Award Champion</dd><dt>2009</dt><dd>Professional Bartenders Organization
    National Cocktail Competition Champion</dd><dt>2015</dt><dd>HOFEX Allworld Open
    Cup International Classical Competition</dd><dd>Reginald Champion and International
    Champion</dd></dl>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'masahiko_endo.jpg'))
  },
  {
    name: 'Richard Fawcett',
    slug: 'richard-fawcett',
    description: "Cocktail-artist Richie Fawcett has invented a new dimension
    of drinking artistry which tantalizes the senses in every respect.  As a self-styled
    ‘bartist,’ he has launched his book Cocktail Art of Saigon featuring 41 original
    recipes.  They are accompanied by his own cocktail illustrations, with fine-art
    street scenes of the capital Ho Chi Minh City, Vietnam, and fascinating stories
    of the city’s history.  He is set to open his own bar and art gallery later this
    Spring.  The Studio Saigon will be located in the heart of downtown Old Saigon on
    the first floor of a 1930s residential block.  Entry is through a hidden entrance
    that is used as a motorbike parking hall.  The adventurous initiatives reflect the
    fast emerging bar scene in Vietnam, with many talented bartenders and an increasing
    clientele seeking discerning cocktail experiences with world-class standards.  <a
    href=\"www.richiefawcett.com\" target=\"_blank\"><i class=\"fa fa-globe\"></i>Website</a>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'richard_fawcett.jpg'))
  },
  {
    name: 'John Ng',
    slug: 'john-ng',
    description: "John Ng has been managing different bars for the last 10 years.  Including
    some luxury hotels, small scale cocktail bar and fast movement restaurant bar. He
    received 10 award winning competitions titles within 5 years of intense bartending
    life.  DWA (Drinks World Asia) named John as the top 25 bartenders in Hong Kong
    for 3 years in a row since 2014. In 2016, Michter’s and John came to a joining point,
    appointed him as Asia brand ambassador to bring Michter’s to a brighter future. ",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'john_ng.jpg'))
  },
  {
    name: 'Matt Solario',
    slug: 'matt-solario',
    description: "Matt Solario, better known in his local industry simply as “Solario,”
    has worked at several bars throughout San Francisco over the course of the past
    ten years.  His passion for history translates well into his role as bar manager
    at the 1930s cocktail lounge, Stookey’s Club Moderne, in San Francisco’s ritzy Nob
    Hill neighborhood where he enjoys restoring classic cocktails and preaching the
    gospel of gin.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'matt_solario.jpg'))
  },
  {
    name: 'Koji Esashi',
    slug: 'koji-esashi',
    description: "Started in the restaurant business from 19 years old and become
    a store manager in a tequila bar from 23 years old.  After that “SPIRITS BAR Surface”
    is opened in 2011 using background of an authentic bar, specialized in Rum and Tequila
    spirits. In 2015 he won the famous Dons of Tequila competition global final! His
    bar has the best selection of the Tequila in Japan by more than 430 kinds.  He opened
    a 2nd bar “SPIRITS BAR Surface SHINJUKU” in 2016.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'koji_esashi.jpg'))
  },
  {
    name: 'Toshihiro Fukami',
    slug: 'toshihiro-fukami',
    description: "After joining the bartender division in a restaurant operating
    company, he was involved in product development and various restaurant launches
    as a bar manager. He is now the head bartender.  He also launches new stores and
    develops products. On behalf of the company, he also handles education for young
    people, supervising restaurant menus, providing cocktail recipes, and developing
    products with the spirits brand.  In the last few years he has been actively involved
    in the management of the event, he is also involved as a committee member for various
    events like a Tequila Festa.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'toshihiro_fukami.jpg'))
  },
  {
    name: 'Kunihiko Nobuhara',
    slug: '',
    description: "While a university student, he began working part-time for
    a bar.  Directly after graduating, he decided to become a real bartender ands tarted
    to train hard. When actively participating in cocktail competitions, he won several
    prizes. Now, he has opened his bar “sloppy joe” in Kobe, which is celebrating its
    11th anniversary this year.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'kunihiko_nobuhara.jpg'))
  },
  {
    name: 'Kiki Moka',
    slug: 'kiki-moka',
    description: "<ul><li>Trainer for Jakarta Bartender Club (JBC)</li><li>Head mixologist
    for union group Jakarta</li><li>judges for bartender mixology competition (finlandia
    vodka, balimoon)</li><li>guest bartender for Diego for Formula 1 Singapore</li><li>Guest
    bartender for British Embassy Singapore 2012</li><li>Guest bartender for Chambord
    Vodka launching, Bali 2012</li><li>Brand ambassador for Drambui Indonesia 2013</li><li>Brand
    ambassador for La Maison Absinthe Fontaine 2014</li><li>Private bartender for Louis
    Vuitton Jakarta 2015</li><li>Beverage freelance trainer and consultant for the Unilever
    Indonesia 2015</li><li>Guest bartender for cocktail workshop @ America</li><li>American
    Embassy representative 2016</li><li>Brand Ambassador for Putra Surya Interns Company</li><li>(uber
    bar tools indonesia, nactmann & ridel glassware 2017)</li><li>Cocktail trainer for
    gruppo campari Indonesia 2017 winner & award as a finalist for skyy vodka southeast
    asia bartending competition 2002</li><li>2nd winner bfc award Indonesia bartending
    competition 2003</li><li>3rd winner for bintang beer bartender competition 2003</li><li>1st
    winner of diageo world class national champion competition raising the bar 2011</li><li>Finalist
    of diageo world class competition global final new delhi 2011</li></ul>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'kiki_moka.jpg'))
  },
  {
    name: 'Greg Boehm',
    slug: 'greg-boehm',
    description: "<p>Since founding Cocktail Kingdom, the standard-bearer of bar-industry
    equipment and one of the catalysts of the craft cocktail movement, Greg Boehm has
    guided the progression of modern mixology by attentively sourcing and manufacturing
    “If you’re a chef, you have professional tools that differentiate you from a home
    cook.  Until Cocktail Kingdom, there was no easy way to differentiate a professional
    bartender from someone with a casual interest,” he explains.  “We enabled the cocktail
    renaissance by giving significant cocktail programs the tools to distinguish themselves.”</p><p>Boehm
    is also the owner of the award-winning cocktail bars Mace and Boilermaker, both
    located in New York’s East Village.</p><p>Boehm, who comes from a family of independent
    publishers and bibliophiles, first became interested in the craft cocktail world
    nearly two decades ago when the family business began publishing the books of the
    legendary London bartender Salvatore Calabrese.</p><p>Boehm grew his personal library
    into the largest collection of cocktail books in the world, including more than
    2,800 rare and one-of-a-kind pieces, such as his newly acquired 1948 pre-frost edition
    proof of the “the best book on cocktail theory every written,” *The Fine Art of
    Mixing Drinks*, by David Embury.  He keeps the collection in a working research
    library in New York, which draws bartenders and writers from around the world.</p>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'greg_boehm.jpg'))
  },
  {
    name: 'Jisung Chun',
    slug: 'jisung-chun',
    description: "Jisung Chun is a Korean rice wine sommelier and a storyteller,  Having
    spent equal halves of her life in Korea and New York, she has built a diverse palette
    of culinary cultures, which comes through in her unique foods and drink pairings.  Rather
    than being confined to one cuisine, she find food pairing in flavors of the ingredients
    and texture of the dishes regardless of the style of the food. Jisung’s main goal
    is to enrich people’s lives by sharing her stories, which are inspire by Korean
    traditional culture and fine arts. Wearing her custom, modern hanbok and aging homemade
    soju in bourbon barrels, she presents old world experiences through a modern lens.  These
    experiences also offer a new path to traditional culture that is approachable and
    relatable to today’s society.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'jisung_chun.jpg'))
  },
  {
    name: 'Yumi Takekoshi',
    slug: 'yumi-takekoshi',
    description: "After independence from a PR company, I am producing a lot of
    tequila promotions. Among them, Tequila Festa i s the biggest event in Asia. TEQUILA
    FESTA was born in Tokyo in 2012 and has been expanding its presence in Osaka, Hakata,
    and Nagoya so far.  Since the event held in Tokyo in 2014, JUAST is the principal
    organizer for the events.  JAUST is the first team of people in Japan for promoting
    marketing and patronizing the vibrant spirit industry’s further prosperity and competitiveness.
    Centered on tequila, we at JUAST would help prosper a liquor culture in Japan with diverse
    kinds of spirits.  We transmit wide range of information such as the latest cocktail
    trends, high quality bars and different kinds of spirits from all over the world.
    We endorse the spirits of all kinds, especially tequila.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'yumi_takekoshi.jpg'))
  },
  {
    name: 'Guilhem Grosperrin',
    slug: 'guilhem-grosperrin',
    description: "<p>Born in 1979, and recognized as a Cognac expert, Guilhem
    GROSPERRIN in in charge of the Congnacs GROSPERRIN since 2004.  Founded in 1992
    by his father, Jean, and selling his own Cognacs since 1999, this independent house,
    has witnessed a big development under his direction.</p><p>The Cognacs GROSPERRON
    are recognized for their various innovations in the universe of Cognac.</p><p>The
    company was the first to produce vintages edition using the carbon 14, bottling
    vintages cognac 100% “brut de futs.”</p><p>They were also the first to sell vintage
    cognacs from islands, using a special technique to reduce their “eau-de-vie” to
    the perfect balancing point without using traditional adjuvants, and systemize light
    filtration by slow reduction process.</p>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'guilhem_grosperrin.jpg'))
  },
  {
    name: 'Minzi Kim Wind',
    slug: 'minzi-kim-wind',
    description: "<p>Minzi Kim Wind is an owner chef at Mishmash in Seoul.  She
    was born in Korean Danish parents of mixed culture.  From an early age, she has
    traveled and lived in various countries where she learned the beauty and taste of
    different cultures.  Minzi studied culinary arts at Ferrandi, l’ecole Francaise
    de Gastronomie, in France, and trained for a Michelin restaurant called “Le Sergeant
    Recruiter” in Paris.</p><p>Prior to living in France she has lived in Copenhagen
    and Barcelona, where she also worked in various Michelin Restaurants called, Kokkeriet,
    Kiin Kiin, and Enoteca.  She has experience in both front and back of the house
    in F&B business where she started as an intern to sommelier to manager.  As well
    as culinary school, she has studied hospitality management at Glion Institute of
    Higher Education in Switzerland, bartender/mixology at American Professional Bartending
    Schools of Illinois and visual communication at the School of the Art Institute
    of Chicago in USA.</p><p>She believes creativeness is important in all perspectives,
    especially in the food and beverage industry.  People love to experience the 5 senses
    and enjoy the journey of different flavors.  At Mishmash you can delight all your
    senses, chef Minzi creates new dishes of her own by introducing the modern (contemporary)
    Korean cuisine with a European touch.</p>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'minzi_kim_wind.jpg'))
  },
  {
    name: 'Kevin Attal',
    slug: 'kevin-attal',
    description: "At La Marmite, we pride ourselves in using homemade ingredients
    and  Chef Kevin Attal brings you a selection of the most authentic French flavors
    you can find in Seoul. Having grown up in his family’s kitchen in Paris and at the
    helm of his own restaurant of the same name in Montreal, Chef Kevin Attal now brings
    his exquisite talents to Seoul.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'kevin_attal.jpg'))
  },
  {
    name: 'Ryu Fuji',
    slug: 'ryu-fuji',
    description: "2016 - 1st runner up Diageo World Class Global Final Miami<br>2016
    Champion Diageo World Class Japan<br>2013, 2012, & 2011 Finalist Diageo World Class
    Japan<br>2012 Speed Challenge Winner Diageo World Class Japan<br><p>EDUCATION  &
    PROFESSIONAL QUALIFICATIONS</p>2011 The Elite Bartenders (JWC) Far East<br>2005
    Himeji Institute of technology<br>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'ryu_fuji.jpg'))
  },
  {
    name: 'Ioana Munteanu',
    slug: 'ioana-munteanu',
    description: "A successful young bartender, born in Romania in a beautiful city
    called Brasov in September 1999.  She started to work as a waiter for the summer
    season when she was 16 and fell in love with hospitality.  When she was 18 she started
    to work in clubs and behind the bar and it was also the time when she discovered
    her love for mixing drinks started to learn about classic cocktails and remained
    behind the bar since.  Then at the age of 21 she moved to Dubai where she started
    working as a bartender and after one year she became the head bartender and remained
    so for a couple of years.  She later moved into a Bar Manager position for a successful
    Asian restaurant in Dubai called Asia Asia, and run the bar until today.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'ioana_munteanu.jpg'))
  },
  {
    name: 'Jisung Chun',
    slug: 'jisung-chun',
    description: "Jisung Chun is a Korean rice wine sommelier and a storyteller,  Having
    spent equal halves of her life in Korea and New York, she has built a diverse palette
    of culinary cultures, which comes through in her unique foods and drink pairings.  Rather
    than being confined to one cuisine, she find food pairing in flavors of the ingredients
    and texture of the dishes regardless of the style of the food. Jisung’s main goal
    is to enrich people’s lives by sharing her stories, which are inspire by Korean
    traditional culture and fine arts. Wearing her custom, modern hanbok and aging homemade
    soju in bourbon barrels, she presents old world experiences through a modern lens.  These
    experiences also offer a new path to traditional culture that is approachable and
    relatable to today’s society.",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'jisung_chun.jpg'))
  },
  {
    name: 'Nicolas Julhes',
    slug: 'nicolas-julhes',
    description: "<p><b>1996</b>&nbsp;Found the Epiceries Julhes Paris with his
    family.  He learned from it about sourcing the passion for the product, and in his
    search of distributors, he encounters people that can do amazing things with flavors.</p><p><b>1999</b>&nbsp;Start
    a collaboration with DIAGEOHe developed a program of food pairing.</p><p>Brand Strategy
    consultant for Lagavulin, Talisker, Johnnie Walker, and J&B.</p><p>His work at Julhes
    Paris and his consultant work at Diego make him understand that flavors and taste
    is an esthetic form similar to perfume or painting.</p><p>His passion drives him
    further, and in 2010 he start the process to open a distillery.</p><p><b>2015</b>&nbsp;Funding
    of La Distillierie de Paris</p><p>The Distillerie de Paris is today recognized as
    a space for creation and inspirational thoughts around the world of spirits.</p>",
    photo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profiles', 'nicolas_julhes.jpg'))
  }
]

profiles.each do |profile|
  Profile.create(profile)
end

sponsors = [
  {
    name: 'Sprit It',
    slug: 'http://spirit-it.org',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'spirit_it.png'))
  },
  {
    name: '8 Oz Magazine',
    slug: 'https://www.facebook.com/8ozmagazine/',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', '8ozmagazine.jpg'))
  },
  {
    name: 'Nextcite!',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'nextcite.jpg'))
  },
  {
    name: 'Aurensan Noir',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'aurensan_noir.png'))
  },
  {
    name: 'DA Noir',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'DA-noir.png'))
  },
  {
    name: 'Distillerie de Paris',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'DistilleriedeParis.jpg'))
  },
  {
    name: 'Ancho Reyes',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'ancho_reyes.png'))
  },
  {
    name: 'Bols',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'BOLS_genever_grey.png'))
  },
  {
    name: 'Carpano',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'carpano.png'))
  },
  {
    name: 'Chartreuse',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'chartreuse.png'))
  },
  {
    name: 'Cocktail Kingdom',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'cocktail_kingdom.png'))
  },
  {
    name: 'Cocktail Please',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'cocktail_please.png'))
  },
  {
    name: 'Deanton',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'Deanton.jpg'))
  },

  {
    name: 'Elemental Cocktails',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'elemental_cocktails.png'))
  },
  {
    name: 'Haymans',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'haymans.png'))
  },
  {
    name: 'Champagne Lemarie',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'lemaire.jpg'))
  },
  {
    name: 'Patron',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'patron.png'))
  },
  {
    name: 'Teeling Whiskey',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'teeling_whiskey.png'))
  },
  {
    name: 'Campari',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'campari.jpg'))
  },
  {
    name: 'Tequila Festa',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'tequila_festa.png'))
  },
  {
    name: 'Titos',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'titos.png'))
  },
  {
    name: 'Trois Rivieres',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'trois_rivieres.jpg'))
  },
  {
    name: 'Wolhyang',
    slug: '#',
    logo: File.open(File.join(Rails.root, 'app', 'assets', 'images', 'sponsors', 'Wolhyang-1.png'))
  }
]

sponsors.each do |sponsor|
  Sponsor.create(sponsor)
end

locations = [
  {
    name: 'Mix & Malt',
    description: '',
    slug: 'mix-and-malt',
    street_address1: '3 Changgyeonggung-ro 29-gil',
    street_address2: 'Myeongnyun 3(sam)ga',
    neighborhood: 'Gwanghwamun/Myeondong',
    telephone: '02-765-5945',
    website: 'https://www.facebook.com/MixMalt/',
    marker_x: 303.43,
    marker_y: 117.45,
    marker_number: 1
  },
  {
    name: 'Knockers',
    description: '',
    slug: 'knockers',
    street_address1: '23 Gyedong-gil',
    street_address2: 'Jongno-gu',
    neighborhood: 'Gwanghwamun/Myeondong',
    telephone: '02-542-3208',
    website: 'https://www.knockers.kr',
    marker_x: 248.77,
    marker_y: 155.12,
    marker_number: 2
  },
  {
    name: 'Charles H',
    description: '',
    slug: 'charles-h',
    street_address1: '97 Saemunan-ro',
    street_address2: 'Jongno-gu',
    neighborhood: 'Gwanghwamun/Myeondong',
    telephone: '02-6388-5000',
    website: '',
    marker_x: 224.68,
    marker_y: 161.92,
    marker_number: 3
  },
  {
    name: 'Old Fashioned',
    description: '',
    slug: 'old-fashioned',
    street_address1: '29 Donggyo-ro 46-gil',
    street_address2: '',
    neighborhood: 'Yeonnam-Dong/Sinchon',
    telephone: '',
    website: '',
    marker_x: 184.28,
    marker_y: 184.18,
    marker_number: 4
  },
  {
    name: 'Bar Code',
    description: '',
    slug: 'bar-code',
    street_address1: '26, Yonsei-ro 9-gil',
    street_address2: 'Seodaemun-gu',
    neighborhood: 'Yeonnam-Dong/Sinchon',
    telephone: '',
    website: '',
    marker_x: 150.74,
    marker_y: 189.61,
    marker_number: 5
  },
  {
    name: 'Honey Hole',
    description: '',
    slug: 'honey-hole',
    street_address1: '4-8, Donggyo-ro 39-gil',
    street_address2: 'Mapo-gu',
    neighborhood: 'Yeonnam-Dong/Sinchon',
    telephone: '02-334-2046',
    website: '',
    marker_x: 150.74,
    marker_y: 189.61,
    marker_number: 6
  },
  {
    name: 'The Beastro',
    description: '',
    slug: 'the-beastro',
    street_address1: '8, Wausan-ro 21-gil',
    street_address2: 'Mapo-gu',
    neighborhood: 'Hongdae/Hapjeong',
    telephone: '02-334-2500',
    website: '',
    marker_x: 161.75,
    marker_y: 200.03,
    marker_number: 7
  },
  {
    name: 'Crazy Saint',
    description: '',
    slug: 'crazy-saint',
    street_address1: '6, Eoulmadang-ro 5-gil',
    street_address2: 'Mapo-gu',
    neighborhood: 'Hongdae/Hapjeong',
    telephone: '02-332-3339',
    website: '',
    marker_x: 184.28,
    marker_y: 207.17,
    marker_number: 8
  },
  {
    name: 'West Hamlet',
    description: '',
    slug: 'west-hamlet',
    street_address1: '6, Yangcheon-ro 14-gil',
    street_address2: 'Gangseo-gu',
    neighborhood: 'Gimpo',
    telephone: '02-332-3339',
    website: '',
    marker_x: 45.06,
    marker_y: 183.52,
    marker_number: 9
  },
  {
    name: 'Volstead',
    description: '',
    slug: 'volstead',
    street_address1: '116, Bogwang-ro',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Itaewon',
    telephone: '',
    website: '',
    marker_x: 261.87,
    marker_y: 209.56,
    marker_number: 10
  },
  {
    name: 'APT',
    description: '',
    slug: 'apt',
    street_address1: '4, Bogwang-ro, 51-gil',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Itaewon',
    telephone: '070-7789-9710',
    website: '',
    marker_x: 272.51,
    marker_y: 220.48,
    marker_number: 11
  },
  {
    name: 'Vatos',
    description: '',
    slug: 'vatos',
    street_address1: '1, Itaewon-ro 15-gil',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Itaewon',
    telephone: '02-797-8226',
    website: '',
    marker_x: 247.21,
    marker_y: 242.49,
    marker_number: 12
  },
  {
    name: 'Motor City',
    description: '',
    slug: 'motor-city',
    street_address1: '140-1, Itaewon-ro',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Itaewon',
    telephone: '02-794-8877',
    website: '',
    marker_x: 229.88,
    marker_y: 251.88,
    marker_number: 13
  },
  {
    name: 'Mish Mash',
    description: '',
    slug: 'mish-mash',
    street_address1: '21, Itaewon-ro 55ga-gil',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Itaewon',
    telephone: '02-6465-2211',
    website: '',
    marker_x: 303.43,
    marker_y: 203.38,
    marker_number: 14
  },
  {
    name: 'Bar Backroom',
    description: '',
    slug: 'bar-backroom',
    street_address1: '54, Baekbeom-ro 87-gil',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Itaewon',
    telephone: '010-8675-1902',
    website: '',
    marker_x: 209.42,
    marker_y: 231.31,
    marker_number: 15
  },
  {
    name: 'Flower Shop',
    description: '',
    slug: 'flower-shop',
    street_address1: '116, Bogwang-ro',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Kyunglidan/HBC',
    telephone: '',
    website: '',
    marker_x: 199.05,
    marker_y: 221.04,
    marker_number: 16
  },
  {
    name: 'Le Moulin',
    description: '',
    slug: 'le-moulin',
    street_address1: '36, Hoenamu-ro',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Kyunglidan/HBC',
    telephone: '070-7570-9293',
    website: '',
    marker_x: 236.46,
    marker_y: 232.48,
    marker_number: 17
  },
  {
    name: 'La Marmitte',
    description: '',
    slug: 'la-marmitte',
    street_address1: '7, Sinhueng-ro 3-gil',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Kyunglidan/HBC',
    telephone: '010-4061-5571',
    website: '',
    marker_x: 225.91,
    marker_y: 222.08,
    marker_number: 18
  },
  {
    name: 'Old Knives',
    description: '',
    slug: 'old-knives',
    street_address1: '4, Singhueng-ro 11-gil',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Kyunglidan/HBC',
    telephone: '070-7763-4001',
    website: '',
    marker_x: 215.49,
    marker_y: 211.68,
    marker_number: 19
  },
  {
    name: 'Dandy Pink',
    description: '',
    slug: 'dandy-pink',
    street_address1: '21, Hoenamu-ro 6-gil',
    street_address2: 'Yongsan-gu',
    neighborhood: 'Kyunglidan/HBC',
    telephone: '010-5448-2143',
    website: '',
    marker_x: 219.57,
    marker_y: 241.48,
    marker_number: 20
  },
  {
    name: 'Bar No Name',
    description: '',
    slug: 'bar-no-name',
    street_address1: '30, Seolleung-ro 148-gil',
    street_address2: 'Gangnam-gu',
    neighborhood: 'Cheongdam/Yeoksam',
    telephone: '',
    website: '',
    marker_x: 303.63,
    marker_y: 274.01,
    marker_number: 21
  },
  {
    name: 'All That Music',
    description: '',
    slug: 'all-that-music',
    street_address1: '24, Eonju-ro 170-gil',
    street_address2: 'Gangnam-gu',
    neighborhood: 'Cheongdam/Yeoksam',
    telephone: '02-3443-3595',
    website: '',
    marker_x: 290.37,
    marker_y: 261.06,
    marker_number: 22
  },
  {
    name: 'Chapter One',
    description: '',
    slug: 'chapter-one',
    street_address1: '101, Nonhyeon-ro 175-gil',
    street_address2: 'Gangnam-gu',
    neighborhood: 'Cheongdam/Yeoksam',
    telephone: '02-543-0308',
    website: '',
    marker_x: 277.61,
    marker_y: 274.01,
    marker_number: 23
  },
  {
    name: 'B28',
    description: '',
    slug: 'b28',
    street_address1: '24, Dosan-daero 55-gil',
    street_address2: 'Gangnam-gu',
    neighborhood: 'Cheongdam/Yeoksam',
    telephone: '010-3402-2828',
    website: '',
    marker_x: 303.43,
    marker_y: 248.28,
    marker_number: 24
  },
  {
    name: 'The Sool Gallery',
    description: '',
    slug: 'the-sool-gallery',
    street_address1: '51-20, Teheran-ro 5-gil',
    street_address2: 'Gangnam-gu',
    neighborhood: 'Cheongdam/Yeoksam',
    telephone: '02-555-2283',
    website: '',
    marker_x: 291.71,
    marker_y: 286.84,
    marker_number: 25
  },
  {
    name: 'Nomad',
    description: '',
    slug: 'nomad',
    street_address1: '28, Dosan-daero 101-gil',
    street_address2: 'Gangnam-gu',
    neighborhood: 'Cheongdam/Yeoksam',
    telephone: '02-511-1283',
    website: '',
    marker_x: 318.07,
    marker_y: 261.06,
    marker_number: 26
  },
  {
    name: 'Gatsby',
    description: '',
    slug: 'gatsby',
    street_address1: '37, Dosan-daero 55-gil',
    street_address2: 'Gangnam-gu',
    neighborhood: 'Cheongdam/Yeoksam',
    telephone: '02-511-2606',
    website: '',
    marker_x: 316.45,
    marker_y: 286.84,
    marker_number: 27
  },
  {
    name: 'Pantera',
    description: '',
    slug: 'gatsby',
    street_address1: '24, Olympic-ro 10-gil',
    street_address2: 'Songpa-gu',
    neighborhood: 'Jamsil/Seongnam',
    telephone: '02-419-4949',
    website: '',
    marker_x: 330.72,
    marker_y: 274.01,
    marker_number: 28
  },
  {
    name: 'Isetta',
    description: '',
    slug: 'isetta',
    street_address1: '1, Songpa-daero 22-gil',
    street_address2: 'Songpa-gu',
    neighborhood: 'Jamsil/Seongnam',
    telephone: '070-8823-7988',
    website: '',
    marker_x: 350.03,
    marker_y: 292.45,
    marker_number: 29
  },
  {
    name: 'Bar In House',
    description: '',
    slug: 'bar-in-house',
    street_address1: '20, Bokjeong-ro 2beon-gil',
    street_address2: 'Sujeong-gu, Seongnam-si, Gyeonggi-do',
    neighborhood: 'Jamsil/Seongnam',
    telephone: '031-758-6616',
    website: '',
    marker_x: 367.59,
    marker_y: 310.01,
    marker_number: 30
  }
]

locations.each do |loc|
  Location.create(loc)
end
