# Bibliografiya

* [Obshchie zamechaniya](#Obshchie-zamechaniya)
* [Naznachenie i razmeshchenie faylov s bibliografiey](#Naznachenie-i-razmeshchenie-faylov-s-bibliografiey)
* [Nastroyka bibliografii](#Nastroyka-bibliografii)
  * [Gruppirovannye podspiski literatury (VAK, Web of Science i t.p.)](#Gruppirovannye-podspiski-literatury-VAK-web-of-science-i-tp)
    * [V avtoreferate](#V-avtoreferate)
    * [V tekste dissertatsii](#V-tekste-dissertatsii)
    * [Vybor grupp dlya otobrazheniya](#Vybor-grupp-dlya-otobrazheniya)
    * [Naimenovanie spiskov i podspiskov literatury](#Naimenovanie-spiskov-i-podspiskov-literatury)
  * [Strogost sootvetstviya GOST](#Strogost-sootvetstviya-GOST)
* [Zamechaniya po realizatsiyam bibliografii](#Zamechaniya-po-realizatsiyam-bibliografii)
  * [`biblatex` + `biblatex-gost` + biber](#biblatex--biblatex-gost--biber)
  * [Vstroennaya + `gost` + bibtex](#Vstroennaya--gost--bibtex)
    * [ugost2008mod.bst](#ugost2008modbst)
* [Spisok statey v prezentatsii](#Spisok-statey-v-prezentatsii)
* [Dopolnitelnaya informatsiya](#Dopolnitelnaya-informatsiya)
* [V sluchae problem](#V-sluchae-problem)
* [Rezhim chernovika](#Rezhim-chernovika)

## Obshchie zamechaniya
* Dannyy shablon rasschitan na podderzhku raboty dvukh realizatsiy
avtomatizirovannogo formirovaniya spiska literatury i upravleniya bibliografiey:
  * vstroennaya realizatsiya s zagruzkoy fayla cherez dvizhok `bibtex` pri
podderzhke shablonov paketa
[`gost`](http://mirrors.ctan.org/biblio/bibtex/contrib/gost/doc/gost.pdf);
  * realizatsiya paketom `biblatex` cherez dvizhok `biber` (rekomenduemaya)
pri podderzhke shablonov paketa
[`biblatex-gost`](http://mirrors.ctan.org/macros/latex/contrib/biblatex-contrib/biblatex-gost/doc/biblatex-gost.pdf).
* Luchshe vsego vsegda obramlyat znachenie BibTeX-atributov v figurnye skobki ili
kavychki (to est vmesto *month = jul* pisat *month = {jul}*).
* Takzhe luchshe vsegda ukazyvat yazyk BibTeX-zapisi (naprimer, *language =
{russian}* ili *language = {english}*). Zapis yazykov vsegda dolzhna vestis
strochnymi (malenkimi) bukvami.
* Parametr *langid* zapolnyat ne nuzhno -- on kopiruetsya iz parametra *language*.
* Dlya pometki bazy svoey stati (VAK, Scopus, Web of Science), mozhno ispolzovat *addendum = {(VAK, Scopus, Web of Science)}*.
* Dlya avtomaticheskogo podscheta publikatsiy trebuetsya dobavit polya v publikatsiyakh v fayle `biblio/author.bib`:
  * *authorvak = {true}* esli publikatsiya indeksirovana VAK,
  * *authorscopus = {true}* esli publikatsiya indeksirovana Scopus,
  * *authorwos = {true}* esli publikatsiya indeksirovana Web of Science,
  * *authorconf = {true}* dlya dokladov konferentsiy,
  * *authorother = {true}* dlya drugikh publikatsiy.
* Avtomaticheskiy podschet patentov i zaregistrirovannykh programm dlya EVM osushchestvlyaetsya putem
  dobavleniya v fayl `biblio/registered.bib` poley:
  * *authorpatent = {true}* dlya patentov,
  * *authorprogram = {true}* dlya zaregistrirovannykh programm.
* Dlya optimalnogo oformleniya spiska literatury stoit ubeditsya, chto iskhodnyy
*.bib fayl zapolnen pravilnym obrazom.
Primery zapolneniya zapisey i rezultaty primeneniya k nim osnovnykh stiley
privedeny v [opisanii stiley paketa
`gost`](http://ctan.org/tex-archive/biblio/bibtex/contrib/gost) i v
[primerakh primeneniya paketa
`biblatex-gost`](http://mirrors.ctan.org/macros/latex/contrib/biblatex-contrib/biblatex-gost/doc/biblatex-gost-examples.pdf).

## Naznachenie i razmeshchenie faylov s bibliografiey
Fayly s bibliografiey raspolozheny v papke [biblio/](../biblio/):
* raboty avtora — [author.bib](../biblio/author.bib);
* zaregistrirovannye patenty i programmy dlya EVM — [registered.bib](../biblio/reigstered.bib);
* chuzhie raboty, na kotorye avtor ssylaetsya — [external.bib](../biblio/external.bib).

Krome togo, v etoy zhe papke nakhoditsya fayl dlya avtomaticheskoy proverki
bibliograficheskoy informatsii na vozmozhnye dublikaty —
[check-bib-dupes-and-usage.py](../biblio/check-bib-dupes-and-usage.py)
Skript pytaetsya nayti povtoryayushchiesya bibliograficheskie zapisi, kotorye vneseny v
fayly s raznymi tegami (takoe mozhet proizoyti, esli u vas uzhe est neskolko
publikatsiy, podgotovlennykh v LaTeX. Ikh spiski literatury mogut peresekatsya
esli raznye soavtory vnosili ikh v raznye iskhodnye publikatsii pod raznymi
tegami). T.k. obychno spisok literatury dostatochno nebolshoy (okolo 200
pozitsiy), to skript schitaet maloveroyatnym obnaruzhit publikatsii odnogo i togo
zhe avtora v raznykh rabotakh na odnoy stranitse. Esli takoe proiskhodit — vyvoditsya
uvedomlenie. Vtoraya chast skripta proveryaet, vse li ssylki, vnesennye v fayl
bibliografii, byli ispolzovany v tekste dissertatsii.

## Nastroyka bibliografii

### Gruppirovannye podspiski literatury (VAK, Web of Science i t.p.)

V nekotorykh sovetakh prinyato literaturu razbivat na podspiski: VAK (ili, naprimer, rekomendovannye dlya zashchity v dissertatsionnom sovete MGU po spetsialnosti), ne iz spiska VAK (drugie) i prochee (tezisy dokladov i t.p.).

V lyubom sluchae razbienie podrazumevaet v t.ch. podzagolovki v spiske literatury. Primer:

![Primer podpiska v MGU](https://user-images.githubusercontent.com/146893/66545185-d5de5f00-eb42-11e9-8dd0-b93b681e57ab.png)

Sm. podrobnye obsuzhdeniya [#361](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/issues/361) i [#362](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/issues/362).

#### V avtoreferate
Nastroyka vozmozhna v rezhime biblatex (biber), no ne bibtex. Dlya nastroyki podobnogo povedeniya v avtoreferate dostatochno ustanovit znachenie `bibgrouped` v `1` v fayle [Synopsis/setup.tex](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/blob/master/Synopsis/setup.tex) sleduyushchim obrazom:

```tex
\@ifundefined{c@bibgrouped}{
  \newcounter{bibgrouped}
  \setcounter{bibgrouped}{1}  % 0 --- edinyy spisok rabot avtora;
                              % 1 --- sgruppirovannye raboty avtora
}{}
```

#### V tekste dissertatsii

Po umolchaniyu vsya tsitiruemaya literatura vyvoditsya edinym spiskom. Vyvod literatury v tekste dissertatsii reguliruetsya sleduyushchimi strokami v fayle [Dissertation/references.tex](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/blob/master/Dissertation/references.tex):

```tex
\insertbibliofull                           % Podklyuchaem Bib-bazy: vse stati edinym spiskom
% Rezhim s podspiskami
%\insertbiblioexternal                      % Podklyuchaem Bib-bazy: stati, ne yavlyayushchiesya statyami avtora po teme dissertatsii
% Dlya vyvoda vyberite i rasskommentiruyte odno iz dvukh
%\insertbiblioauthor                        % Podklyuchaem Bib-bazy: raboty avtora edinym spiskom
%\insertbiblioauthorgrouped                 % Podklyuchaem Bib-bazy: raboty avtora sgruppirovannye (VAK, WoS, Scopus i t.d.)
```

Chtoby nastroit vyvod rabot avtora, neobkhodimo zakommentirovat komandu `\insertbibliofull`, raskommentirovat `\insertbiblioexternal` i odnu iz dvukh komand, podklyuchayushchikh raboty avtora. Naprimer, dlya vyvoda gruppirovannykh rabot avtora nastroyka vyglyadit tak:

```tex
% \insertbibliofull                           % Podklyuchaem Bib-bazy: vse stati edinym spiskom
% Rezhim s podspiskami
\insertbiblioexternal                      % Podklyuchaem Bib-bazy: stati, ne yavlyayushchiesya statyami avtora po teme dissertatsii
% Dlya vyvoda vyberite i rasskommentiruyte odno iz dvukh
%\insertbiblioauthor                        % Podklyuchaem Bib-bazy: raboty avtora edinym spiskom
\insertbiblioauthorgrouped                 % Podklyuchaem Bib-bazy: raboty avtora sgruppirovannye (VAK, WoS, Scopus i t.d.)
```

#### Vybor grupp dlya otobrazheniya

Po umolchaniyu vyvodyatsya gruppy: VAK, Web of Science, Scopus, tezisy konferentsiy i prochie raboty avtora. Chtoby ne vyvodit kakuyu-to iz ukazannykh grupp, dostatochno zakommentirovat odnu iz sleduyushchikh komand `\printbibliography` v fayle [biblio/biblatex.tex](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/blob/master/biblio/biblatex.tex):

```tex
    \section*{\bibtitleauthor}
    \ifsynopsis
    \printbibliography[heading=pubsubgroup, section=0, keyword=biblioauthorvak,    title=\bibtitleauthorvak,resetnumbers=true] % Raboty avtora iz spiska VAK (sbros numeratsii)
    \else
    \printbibliography[heading=pubsubgroup, section=0, keyword=biblioauthorvak,    title=\bibtitleauthorvak,resetnumbers=false] % Raboty avtora iz spiska VAK (skvoznaya numeratsiya)
    \fi
    \printbibliography[heading=pubsubgroup, section=0, keyword=biblioauthorwos,    title=\bibtitleauthorwos,resetnumbers=false]% Raboty avtora, indeksiruemye Web of Science
    \printbibliography[heading=pubsubgroup, section=0, keyword=biblioauthorscopus, title=\bibtitleauthorscopus,resetnumbers=false]% Raboty avtora, indeksiruemye Scopus
    \printbibliography[heading=pubsubgroup, section=0, keyword=biblioauthorconf,   title=\bibtitleauthorconf,resetnumbers=false]% Tezisy konferentsiy
    \printbibliography[heading=pubsubgroup, section=0, keyword=biblioauthorother,  title=\bibtitleauthorother,resetnumbers=false]% Prochie raboty avtora
```

#### Naimenovanie spiskov i podspiskov literatury

Mozhet potrebovatsya izmenit naimenovanie spiska\podspiska literatury. Naprimer, s naimenovaniya po-umolchaniyu "V izdaniyakh iz spiska VAK RF" na "Stati v retsenziruemykh nauchnykh izdaniyakh, rekomendovannykh dlya zashchity v dissertatsionnom sovete MGU po spetsialnosti". Dlya etogo dostatochno otredoaktirovat sleduyushchie stroki v fayle [common/newnames.tex](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/blob/master/common/newnames.tex):

```tex
%%% Zagolovki bibliografii:

% dlya avtoreferata:
\newcommand{\bibtitleauthor}{Publikatsii avtora po teme dissertatsii}

% dlya stilya bibliografii `\insertbiblioauthorgrouped`
\newcommand{\bibtitleauthorvak}{V izdaniyakh iz spiska VAK RF}
\newcommand{\bibtitleauthorscopus}{V izdaniyakh, vkhodyashchikh v mezhdunarodnuyu bazu tsitirovaniya Scopus}
\newcommand{\bibtitleauthorwos}{V izdaniyakh, vkhodyashchikh v mezhdunarodnuyu bazu tsitirovaniya Web of Science}
\newcommand{\bibtitleauthorother}{V prochikh izdaniyakh}
\newcommand{\bibtitleauthorconf}{V sbornikakh trudov konferentsiy}

% dlya stilya bibliografii `\insertbiblioauthorimportant`:
\newcommand{\bibtitleauthorimportant}{Naibolee znachimye \protect\MakeLowercase\bibtitleauthor}

% dlya spiska literatury v dissertatsii i spiska chuzhikh rabot v avtoreferate:
\newcommand{\bibtitlefull}{Spisok literatury} % (GOST R 7.0.11-2011, 4)
```

### Strogost sootvetstviya GOST

  V sootvetstvii s punktom 5.6.7 [GOST R 7.0.11-2011 SIBID. Dissertatsiya
  i avtoreferat dissertatsii. Struktura i pravila
  oformleniya](http://docs.cntd.ru/document/1200093432) bibliograficheskie
  zapisi v spiske literatury oformlyayut soglasno [GOST
  7.1](http://docs.cntd.ru/document/1200034383). Posledniy predpisyvaet
  oformlenie zapisey v spiske literatury primerno takim obrazom:

  > Lermontov, M. Yu. Sobranie sochineniy: v 4 t. / M. Yu. Lermontov. –– M. : Terra-Kn. klub, 2009. –– 4 t.

  > Familiya, I. O. Nazvanie stati / I. O. Familiya, I. O. Familiya2, I. O. Familiya3 // Zhurnal. –– 2013. –– T. 1, № 5. –– S. 100––120.

  Podobnoe dublirovanie FIO pervogo avtora mnogikh nepodgotovlennykh
  k strogosti GOST 7.1 chitateley mozhet silno smutit. Krome togo, v vashem
  dissertatsionnom sovete mozhet byt ne prinyato strogo sootvetstvovat GOST
  v etoy chasti, i takoy vid spiska literatury mozhet byt vosprinyat kak
  sledstvie oshibki.

  V etom sluchae na svoy strakh i risk mozhno ponizit strogost GOST, zakommentirovat [sleduyushchie
  stroki](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/blob/master/biblio/biblatex.tex#L20-L22)
  fayla `biblio/biblatex.tex`:

  ```tex
  \ltx@iffilelater{biblatex-gost.def}{2017/05/03}%
  {\toggletrue{bbx:gostbibliography}%
  \renewcommand*{\revsdnamepunct}{\addcomma}}{}
  ```

  Spisok literatury teper budet vyglyadet tak:

  > Lermontov M. Yu. Sobranie sochineniy: v 4 t. –– M. : Terra-Kn. klub, 2009. –– 4 t.

  > Familiya I. O., Familiya2 I. O., Familiya3 I. O. Nazvanie stati // Zhurnal. –– 2013. –– T. 1, № 5. –– S. 100––120.

  Podrobnee, smotrite obsuzhdeniya v [#341](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/issues/341), [#215](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/issues/215).

## Zamechaniya po realizatsiyam bibliografii
### `biblatex` + `biblatex-gost` + biber
* V versii `biblatex` 3.1 sushchestvuet [bag](https://github.com/plk/biblatex/issues/355),
poetomu ee ne stoit ispolzovat.
* Preduprezhdenie v loge
```bash
Package biblatex Warning: 'babel/polyglossia' detected but 'csquotes' missing.
(biblatex) Loading 'csquotes' recommended.
```
yavlyaetsya rekomendatsiey avtora `biblatex` i `csquotes`.
`\usepackage{csquotes}` uberet etot warning-recommendation,
tolko smysla v etom pakete dlya russkoyazychnoy dissertatsii net — on dlya
zapadnoevropeyskikh yazykov. Dlya russkogo yazyka `babel` i `polyglossia`
(s parametrom `babelshorthands`) chto mogut — to reshayut.
* Posredstvom etoy svyazki reshaetsya vopros [podscheta avtorskikh literaturnykh
istochnikov](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/issues/33#issuecomment-150912772).

### Vstroennaya + `gost` + bibtex
* V bibtex otsutstvuet vstroennaya vozmozhnost sozdavat neskolko spiskov
literatury dlya odnogo dokumenta, poetomu dlya avtoreferata pridetsya obkhoditsya
bez ssylok na raboty drugikh avtorov, ostavlyaya nuzhnyy po GOST spisok rabot
avtora po teme dissertatsii.
* Otechestvennyy GOST ochen surov, v nastoyashchee vremya eshche ne sozdali takoy
BibTeX-stil, kotoryy by emu polnostyu sootvetstvoval. V dannom shablone
ispolzuetsya stil *utf8gost71u.bst*, on bolee ili menee vmenyaemyy i dostatochno
blizok k standartu. Vprochem, pri napisanii dissertatsii redko kto trebuet
tochnogo sootvetstviya GOST-u, lish vse bylo oformleno krasivo i odnoobrazno.
Esli utf8gost71u.bst vas ne ustraivaet, to vy mozhete vybrat lyuboy drugoy stil
(iz papki [BibTeX-Styles](../BibTeX-Styles/) ili naydennyy v internete). V fayle
biblio.bib akkuratno privedena vsya bibliografiya iz GOST R 7.0.11–2011 i primery
vsekh tipov dokumentov na angliyskom, tak chto vy mozhete poprobovat vse
interesuyushchie vas stili i uvidet, kak kazhdyy iz nikh formatiruet bibliografiyu.
* V stilevykh faylov russkikh GOST-ov mnogie tipy dokumentov (naprimer,
*PHDTHESIS* ili *TECHREPORT*) sdelany ochen plokho. V bolshinstve sluchaev luchshe
ikh vpolne mozhno zamenit na *ARTICLE* ili *BOOK*.
* `bibtex`(`bibtex8`) nekorrektno rabotaet s preobrazovaniyami yunikodnykh
simvolov, potomu sokrashcheniya do initsialov ili vozmozhnosti po izmeneniyu registra
s utf8 rabotat ne budut. Sootvetstvuyushchim obrazom nado zapolnyat `*.bib`
fayl.
* Podborka russkikh stilevykh paketov BibTeX pod UTF-8 razmeshchena v papke
[BibTeX-Styles/](../BibTeX-Styles/).

#### ugost2008mod.bst
Dorabotannyy shablon `ugost2008.bst`:
* Teper ne rugaetsya na tip `@Mastersthesis`.
* Teper est tri funktsii (vmesto odnoy) dlya vydeleniya teksta:
avtory, zhurnal, tom izdaniya, kotorymi mozhno upravlyat. Po umolchaniyu vydeleniya net.
Primer zadaniya vydeleniya pered vyzovom bibliografii
(avtory — kursiv, zhurnal — zhirnyy, tom — podcherknutyy):
```tex
\providecommand*{\BibEmph}[1]{\emph{#1}}
\providecommand*{\BibEmphi}[1]{\textbf{#1}}
\providecommand*{\BibEmphii}[1]{\underline{#1}}
```
* Ssylka DOI, pri nalichii u lyubogo tipa zapisey teper prostavlena
u pervykh punktov posle nomera v spiske literatury, a ne tolko u nazvaniya zhurnala ili knigi.

* Esli u zapisi est DOI, no net URL ili eprint, to v konets zapisi v spiske literatury pishetsya DOI: …

* Dlya togo, chtoby ubrat DOI iz otobrazheniya, pered zapuskom bibliografii pishetsya:
```tex
\makeatletter %http://tex.stackexchange.com/questions/40590/is-there-a-command-to-ignore-the-following-character
\def\?#1{}        % sredstvo udaleniya posleduyushchego znaka
\makeatother
\providecommand*{\BibDOI}[1]{\?}   % Pustoy DOI, sedayushchiy sleduyushchuyu za soboy tochku
```
* Kak i u bazovogo `ugost2008.bst` mozhno otklyuchit razdelitelnoe
tire mezhdu elementami zapisi, zapisav pered vyzovov bibliografii:
```tex
\providecommand*{\BibDash}{}
```
* Teper, esli avtorov bolshe trekh, to oni peremeshchayutsya pravee zaglaviya, v oblast
ukazaniya otvetstvennosti, i tam sokrashchayutsya do pervogo «[i dr.]» (soglasno
rasprostranennoy praktike primeneniya bibliograficheskikh GOSTov).

## Spisok statey v prezentatsii
V spiske statey prezentatsii ne trebuetsya soblyudenie GOST.
Dlya ekonomii mesta na slayde mozhno ubrat lishnyuyu informatsiyu o statyakh avtora, ostaviv lish samoe
neobkhodimoe.
Dlya etogo v fayle [biblatex.tex/](../biblio/biblatex.tex)
nakhoditsya *Spisok lishnikh poley v prezentatsii*.
V nem mozhno vybrat polya, kotorye trebuetsya ubrat iz spiska statey prezentatsii.

## Dopolnitelnaya informatsiya
Spravka k paketu `biblatex-gost` rasskazyvaet [o vzaimosvyazi GOSTov na bibliografiyu](http://mirrors.ctan.org/macros/latex/contrib/biblatex-contrib/biblatex-gost/doc/biblatex-gost.pdf).

[Tsitirovanie v dissertatsii: rekomendatsii po oformleniyu](http://www.dissernet.org/instructions/instruction/citation-in-the-thesis-recommendations-on-the-formulation.htm).

## V sluchae problem
Mnogie problemy svyazany s nesootvetstviem vybrannogo dvizhka dannogo shablona
i dvizhka nastroennogo v polzovatelskoy sisteme dlya kompilyatsii po umolchaniyu.
Dvizhok nastraivaetsya v faylakh `setup.tex` v strochke koda:
```tex
\setcounter{bibliosel}{1}           % 0 --- vstroennaya realizatsiya s zagruzkoy fayla cherez dvizhok bibtex8; 1 --- realizatsiya paketom biblatex cherez dvizhok biber
```

V sluchae problem kompilyatsii vstroennoy bibliografii na dvizhke
`bibtex`, poprobuyte nastroit v srede kompilyatsii zapusk `bibtex8`:
```bat
bibtex8.exe -B -c utf8cyrillic.csf %
```
gde `%` — imya fayla bez rasshireniya, ili

```bat
bibtex8.exe -B -c utf8cyrillic.csf dissertation.aux
```

Esli vyvoditsya v oshibka
```bash
I found no \citation commands---while reading file dissertation.aux
```
to, naprimer pod windows/texlive 2015/texstudio «lechitsya» izmeneniem v
`Parametry`-`Konfiguratsiya TeXStudio`-`Postroenie` nastroyki `Bibliografiya po umolchaniyu`
na `Biber` (stoit chasto `BibTeX`, i ne rabotaet, esli v faylakh `setup.tex`
nastroeno `\setcounter{bibliosel}{1}`). Esli ispolzuetsya WinEdt i MikTEX: `Options`-`Execution Modes`- vkladka `Console Applications`- v spiske sleva punkt `BibTEX`. Parametr Executable menyaem s `bibtex.exe` na `biber.exe`.

Esli numeratsiya spiska literatury nachinaetsya s nepravilnogo nomera, to
vozmozhnoy prichinoy yavlyaetsya starye versii ispolzuemykh paketov `biblatex` i
`biber`. Reshaetsya obnovleniem paketov, obnovleniem vsey ustanovki TeX, ili
mozhno v fayle [biblatex.tex](../biblio/biblatex.tex) vystavit v `false` ili
zakommentirovat optsiyu paketa `biblatex`:
```tex
defernumbers=true,
```
riskuya pri etom poluchit inye problemy s numeratsiey spiska literatury.

## Rezhim chernovika

Pri sborke v rezhime chernovika numeratsiya rabot mozhet byt nevernoy (dlya uskoreniya sborki).
Dlya pravilnoy sortirovki rabot trebuetsya:

* otkommentirovat stroku `defernumbers=true,` v fayle
[biblio/biblatex.tex](../biblio/biblatex.tex),
* v fayle [common/characteristic.tex](../common/characteristic.tex) vynesti stroku
  `\printbibliography[heading=nobibheading,section=0,env=countexternal,keyword=biblioexternal]`
  za predely uslovnogo operatora.
