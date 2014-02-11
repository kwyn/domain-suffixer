angular.module "suffixer", ['ngRoute']
  .config ($routeProvider, $locationProvider) => 
    $locationProvider.html5Mode true
    $routeProvider.when '/' , {
      controller : 'frameController',
      templateUrl : 'templates/frame.html'
    }
    .otherwise {
      redirectTo : '/'
    }
  .controller 'frameController', ($scope, $http) =>
    $scope.idea = ''
    $scope.results
    $scope.success = false
    $scope.fail = false

    whois = (domain) ->
      query = "?url=#{domain}"
      $http {
        method: 'GET',
        url: "/whois#{query}"
      }
      .then (res) ->
        console.log res

    $scope.search = (idea)->
      if (findIt $scope.idea) != undefined
        $scope.success = true
        $scope.fail = false
        $scope.results = findIt $scope.idea
        whois $scope.results
      else
        $scope.results = "no results :("
        $scope.success = false
        $scope.fail = true
      
findIt = (word) ->
  wordArray = word.split ''
  suffixes = wordArray[-4..]
  while suffixes.length > 1
    suffix = suffixes.join('')
    if domainObject[suffix]
      results = wordArray[0..-(suffixes.length+1)].join('') + domainObject[suffixes.join('')]
      suffixes.shift()
    else
      suffixes.shift()
  results

altGenRemoveVowels = (word) ->
  alts = []
  i = 0 
  wordArray = word.split ''
  while i < vowelArray.length
    limited = []
    vowel = vowelArray[i]
    if (wordArray.indexOf vowel) > -1
      limited.push(letter) for letter in wordArray when letter != vowelObject[vowel]
      alts.push(limited.join(''))
    i++
  alts

domain = [".aero",".biz",".cat",".com",".coop",".edu",".gov",".info",".int",".jobs",".mil",".mobi",".museum",
".name",".net",".org",".travel",".ac",".ad",".ae",".af",".ag",".ai",".al",".am",".an",".ao",".aq",".ar",".as",".at",".au",".aw",
".az",".ba",".bb",".bd",".be",".bf",".bg",".bh",".bi",".bj",".bm",".bn",".bo",".br",".bs",".bt",".bv",".bw",".by",".bz",".ca",
".cc",".cd",".cf",".cg",".ch",".ci",".ck",".cl",".cm",".cn",".co",".cr",".cs",".cu",".cv",".cx",".cy",".cz",".de",".dj",".dk",".dm",
".do",".dz",".ec",".ee",".eg",".eh",".er",".es",".et",".eu",".fi",".fj",".fk",".fm",".fo",".fr",".ga",".gb",".gd",".ge",".gf",".gg",".gh",
".gi",".gl",".gm",".gn",".gp",".gq",".gr",".gs",".gt",".gu",".gw",".gy",".hk",".hm",".hn",".hr",".ht",".hu",".id",".ie",".il",".im",
".in",".io",".iq",".ir",".is",".it",".je",".jm",".jo",".jp",".ke",".kg",".kh",".ki",".km",".kn",".kp",".kr",".kw",".ky",".kz",".la",".lb",
".lc",".li",".lk",".lr",".ls",".lt",".lu",".lv",".ly",".ma",".mc",".md",".mg",".mh",".mk",".ml",".mm",".mn",".mo",".mp",".mq",
".mr",".ms",".mt",".mu",".mv",".mw",".mx",".my",".mz",".na",".nc",".ne",".nf",".ng",".ni",".nl",".no",".np",".nr",".nu",
".nz",".om",".pa",".pe",".pf",".pg",".ph",".pk",".pl",".pm",".pn",".pr",".ps",".pt",".pw",".py",".qa",".re",".ro",".ru",".rw",
".sa",".sb",".sc",".sd",".se",".sg",".sh",".si",".sj",".sk",".sl",".sm",".sn",".so",".sr",".st",".su",".sv",".sy",".sz",".tc",".td",".tf",
".tg",".th",".tj",".tk",".tm",".tn",".to",".tp",".tr",".tt",".tv",".tw",".tz",".ua",".ug",".uk",".um",".us",".uy",".uz", ".va",".vc",
".ve",".vg",".vi",".vn",".vu",".wf",".ws",".ye",".yt",".yu",".za",".zm",".zr",".zw"]

domainObject = {}

domainObject[value.substring(1)] = value for value in domain