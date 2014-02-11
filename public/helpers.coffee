# format list
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

vowelObject = { 'a' : 'a', 'e' : 'e', 'i': 'i', 'o' : 'o', 'u' : 'u', 'y': 'y'}
vowelArray = ['a','e','i','o','u','y']

# Helper functions

# letter removal
# Takes in word (as array) and array of letters to be removed
# take intersection of word and array
# create results array
 # for every letter in intersection
  # if letter is in word then
    # remove letters
    # store copy
  # check for next letter
removeLetters = (word, letters) ->
  # letters = _.intersection word, letters 
  results = []

  remove = (wordCopy, index) ->
    if index < letters.length
      char = letters[index]
      console.log(char)
      if (wordCopy.indexOf char) > -1
        pruned = []
        pruned.push letter for letter in word when letter != char
        copy = pruned[..]
        results.push copy.join('') 
        remove copy, ++index 
      else
        remove wordCopy, ++index
    else
      return null
  copy = word[..]
  remove copy, 0
  results
  
word = 'bitly'.split('')
console.log word
removeLetters word , vowelArray
