## Kak pisat dissertatsiyu na GitHub?

* [Hint](#Hint)
* [Bez obnovleniya shablona](#Bez-obnovleniya-shablona)
* [S obnovleniem](#S-obnovleniem)
* [Esli chto-to poshlo ne tak](#Esli-chto-to-poshlo-ne-tak)
* [Sinkhronizatsiya s upstream (dlya prodvinutykh polzovateley)](#Sinkhronizatsiya-s-upstream-dlya-prodvinutykh-polzovateley)

### Hint

Pri ispolzovanii Git mozhet okazatsya poleznym dobavit nuzhnye dlya paketa
[`gitinfo2`](https://www.ctan.org/pkg/gitinfo2) fayly v lokalnuyu kopiyu `.git/hooks`, togda v rezhime chernovika na kazhdoy stranitse dissertatsii budet ukazyvatsya ispolzuemaya reviziya dokumenta (korotkiy khesh kommita) i data ego vneseniya.

### Bez obnovleniya shablona

Opisannuyu nizhe skhemu mozhno ispolzovat dlya togo, chtoby pisat svoyu
dissertatsiyu na GitHub ispolzuya shablon
*Russian-Phd-LaTeX-Dissertation-Template*

0) Sozdaem uchetnuyu zapis na GitHub.

1) Loginimsya, zhmem znachok Fork na glavnoy stranitse shablona. Posle
etogo shablon poyavitsya v spiske repozitoriev uzhe vashey uchetnoy
zapisi.

2) Otkryvaem svoyu kopiyu shablona. Zhmem knopku Branch:master, v pole
«Find or create a branch» pishem imya dlya vetki repozitoriya pod svoy
disser. U menya ([@kostyfisik](https://github.com/kostyfisik)) eto «**disser-Ladutenko**». Esli posle nazhatiya na knopku v
pole vvoda vy vidite nadpis «Filter branches/tags» — vy v chuzhoy kopii
repozitoriya.

3) Dalshe mozhno klonirovat shablon k sebe na kompyuter. Delat eto
nado iz **SVOEY** kopii shablona!

4) Pishem disser v svoey vetke, raduemsya vozmozhnostyam sistemy kontrolya
versii, naprimer mozhno utrom posmotret, a chto imenno ty menyal po
tekstu vchera v 3 chasa nochi…

Ili nauchnik nadelal pravok po vsemu tekstu, delaem novuyu vetku,
zamenyaem svoy fayl na ispravlennyy, na sayte delaem compare,
smotrim chto pomenyalos.

Prodvinutyy nelenivyy nauchnik sdelaet vam pull request s
predlagaemymi izmeneniyami. Khoroshey idey mozhet okazatsya ispolzovat
instrumenty dlya code review i collaboration, sushchestvuyushchie na GitHub. Pered tem kak
vnosit izmeneniya uzhe v vetku so svoimi izmeneniyami — sozdaete eshche odnu vetku,
a potom iz nee delaete pull request v svoyu osnovnuyu vetku disera.
Ssylku na izmeneniya v PR mozhno poslat nauchniku, a on mozhet pryamo na
sayte dobavlyat kommentarii imenno po predlagaemym izmeneniyam (t.e. on ikh smozhet
prosmatrivat inkrementalno, a ne po vsemu diseru srazu). Mozhno zavodit
lichnye issue (ili ikh mozhet dobavlyat nauchnik), vrode «dobavit kartinku XXX»,
«izmenit opisanie effekta YYY» i t.d. Optimiziruyte vash rabochiy protsess,
sdelayte ego maksimalno effektivnym!

### S obnovleniem

Ostalnye instruktsii vypolnyayutsya iz komandnoy stroki v Linux, a dlya
Windows\Mac est programmy dlya raboty s git… v kotorykh tozhe mozhno
vypolnyat ukazannye nizhe komandy! Nuzhny oni dlya togo, chtoby uluchsheniya
v osnovnom shablone mozhno bylo nalozhit poverkh uzhe nachatogo disera.

1) Ukazyvaem v svoey lokalnoy kopii (na kompyutere), chto otkuda ona
dolzhna poluchat obnovleniya. Eto delaetsya odin raz dlya kazhdoy lokalnoy
kopii.

`git remote add upstream https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template`

2) Teper v lyuboy moment mozhno obnovit svoyu lokalnuyu kopiyu i svoyu
kopiyu na sayte GitHub sleduyushchim naborom komand.

Pereklyuchaemsya v master vetku: `git checkout master`

Sinkhroniziruem lokalnuyu kopiyu s svoey kopiey na sayte: `git pull`

Poluchaem aktualnye obnovleniya: `git fetch upstream`

Smotrim chto pomenyalos: `git diff upstream/master`

Slivaem izmeneniya v svoyu lokalnuyu kopiyu: `git merge upstream/master`

Otpravlyaem ikh v svoyu kopiyu na sayte: `git push`

3) Ne slozhno podtyanut obnovleniya uzhe neposredstvenno v svoy disser. Dlya etogo
(podstavleno imya moey vetki dissera):

`git checkout disser-Ladutenko`

po zhelaniyu: `git diff master`

`git merge master`

Esli izmeneniya byli ne ochen konfliktuyushchie (kto-to podpravil fayly
shablona, kotorye vy i ne trogali, naprimer Readme ili kakie-to
vnutrennie optsii) vse tozhe proydet bez dopolnitelnykh voprosov, a
sostoyanie repozitoriya srazu peremotaetsya vpered cherez vse novye kommity
(fast-forward).

```bash
Updating 22ca047..112b54a
Fast-forward
 Dissertation/disstyles.tex                |  16 +++++++++-
 README.md                                 |   8 +++--
 Bibliography.md => Readme/Bibliography.md |   0
 Installation.md => Readme/Installation.md |   6 ++--
 Links.md => Readme/Links.md               |   0
 Readme/github.md                          | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Synopsis/synstyles.tex                    |  19 ++++++++---
 Synopsis/title.tex                        |  77 ++++++++++++++++++++++-----------------------
 Synopsis/userstyles.tex                   |   1 +
 biblio/biblatex.tex                       |   8 ++---
 common/data.tex                           |  18 ++++++-----
 common/styles.tex                         |   6 ----
 synopsis.tex                              |  33 ++++++++++++++++++--
 13 files changed, 284 insertions(+), 71 deletions(-)
 rename Bibliography.md => Readme/Bibliography.md (100%)
 rename Installation.md => Readme/Installation.md (96%)
 rename Links.md => Readme/Links.md (100%)
 create mode 100644 Readme/github.md
```

4) V protivnom sluchae mozhet potrebovatsya ruchnoe razreshenie konfliktov. Naprimer,

```bash
$ git merge master
Auto-merging dissertation.tex
Auto-merging common/styles.tex
CONFLICT (content): Merge conflict in common/styles.tex
Auto-merging common/packages.tex
CONFLICT (content): Merge conflict in common/packages.tex
Auto-merging Dissertation/userstyles.tex
Auto-merging Dissertation/userpackages.tex
Auto-merging Dissertation/part3.tex
CONFLICT (content): Merge conflict in Dissertation/part3.tex
Auto-merging Dissertation/part2.tex
CONFLICT (content): Merge conflict in Dissertation/part2.tex
Auto-merging Dissertation/appendix.tex
CONFLICT (content): Merge conflict in Dissertation/appendix.tex
Automatic merge failed; fix conflicts and then commit the result.
```

Togda nado kazhdyy fayl s konfliktom otkryt i ispravit konflikt vruchnuyu.

Dlya faylov `partX.tex` eto, kak pravilo, oznachaet, chto nado udalit strochku

``` tex
<<<<<<< HEAD
```
v nachale fayla, nayti strochku
``` tex
=======
```
i udalit ot nee do strochki
``` tex
>>>>>>> master
```

Chashche vsego khochetsya ostavit HEAD, no mogut byt varianty. Naprimer:

``` tex
<<<<<<< HEAD
%%% Maket stranitsy %%%
% Vystavlyaem znacheniya poley (GOST 7.0.11-2011, 5.3.7)
\geometry{a4paper,top=2cm,bottom=2cm,left=2.5cm,right=1cm}

=======
>>>>>>> master
```

Opisanie k geometrii uekhalo v drugoy fayl, tak chto ego udalyaem, a ot master ostanetsya pustoe mesto.

Eshche primer:

``` tex
<<<<<<< HEAD
%%% Intervaly %%%
\usepackage[onehalfspacing]{setspace} % Optsiya zapuska paketa pravit ne tolko intervaly v obychnom tekste, no i formulnye
\usepackage{needspace}

%%% Razryvy stranits %%%
% \needspace{2\baselineskip} raspolagaet dve posleduyushchie strochki na
% odnoy stranitse. Tut ispolzuetsya, chtoby slovo "zadachi" i "polozheniya"
% okazalis na odnoy stranitse so spiskom iz zadach i polozheniy
%\usepackage{needspace}
\makeatletter
\newcommand\mynobreakpar{\par\nobreak\@afterheading}
\makeatother

=======
>>>>>>> master
```

Obyavleniya \usepackage pereekhali v drugoy fayl, ikh tut udalyaem, blok pro razryv stranits ostavlyaem. Sluzhebnye

``` tex
<<<<<<< HEAD
=======
>>>>>>> master
```

razumeetsya, udalyaem.

Posle togo kak vse konflikty razresheny — ne zabudte sdelat finalnyy
kommit, kotoryy ya obychno nazyvayu merge.

Sobstvenno vse, nichego drugogo, chtoby podderzhivat uzhe chastichno napisannyy disser v sootvetstvii s usiliyami avtorov shablona dostich ideala ne trebuetsya.

### Esli chto-to poshlo ne tak

Nichego strashnogo, vsegda est vozmozhnost otkatitsya k kommitu pryamo
pered tem, kak vy nachali delat merge!

### Sinkhronizatsiya s upstream (dlya prodvinutykh polzovateley)

Shablon vremya ot vremeni obnovlyaetsya, i mozhet vozniknut zhelanie
dobavit poleznye izmeneniya k sebe v rabotu.
Odnako delat eto pri pomoshchi `merge` mozhet byt problematichno.
Dlya takikh sluchaev udobno ispolzovat komandu  `git rebase`.

Rassmotrim situatsiyu -- vy nachali pisat svoyu rabotu posle kommita nomer 3 v vetke `master`.
Posle etogo shablon byl obnovlen v vetke `upstream`.
Eta situatsiya proillyustrirovana na risunke nizhe.

```
+--------+     +--------+     +--------+     +--------+     +--------+
|commit 1+----->commit 2+----->commit 3+--+-->commit 4+----->commit 5|   upstream
+--------+     +--------+     +--------+  |  +--------+     +--------+
                                          |
                                          |
                                          |  +--------+     +--------+
                                          +-->commit 6+----->commit 7|   master*
                                             +--------+     +--------+
```

Dlya `merge` v dannom sluchae navernyaka ponadobitsya razreshat mnozhestvo konfliktov.
`git` predostavlyaet bolee legkiy sposob sinkhronizatsii izmeneniy -- `rebase`.

Dlya sliyaniya vetok vvedite komandu:

```bash
git rebase upstream
```

Posle etogo `git` primenit Vashi izmeneniya nachinaya s poslednego kommita vetki `upstream`.
Rezultat etoy operatsii budet vyglyadet tak:

```
                                                             upstream
+--------+     +--------+     +--------+     +--------+     +--------+     +---------+     +---------+
|commit 1+----->commit 2+----->commit 3+----->commit 4+----->commit 5+----->commit 6*+----->commit 7*|   master
+--------+     +--------+     +--------+     +--------+     +--------+     +---------+     +---------+
```

Takoy podkhod vyzovet minimalnoe kolichestvo konfliktov (esli u vetok tolko odno peresechenie).

Minusom dannogo podkhoda yavlyaetsya to, chto `hash` vsekh kommitov vetki `master` budet izmenen.
Sledstviem etogo budet to, chto ssylki na eti kommity v issue tracker budut slomany,
tak chto dannyy sposob luchshe **ne ispolzovat pri nalichii ssylok na kommity v issue tracker**.

Krome togo, pri zagruzke izmeneniy na server potrebuetsya ispolzovat *silu*:

```bash
git push --force origin master
```

A pri posleduyushchey sinkhronizatsii na *drugom* kompyutere nado budet ispolzovat:

```bash
git fetch origin
git reset --hard origin/master
```
