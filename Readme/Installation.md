# Ustanovka i sborka

* [Bystryy start](#Bystryy-start)
* [Kompilyatsiya chernovika](#Kompilyatsiya-chernovika)
* [Prostye oshibki](#Prostye-oshibki)
* Ustanovka
  * [V Ubuntu s TexLive vnutri konteynera DockerTex](#V-ubuntu-s-texlive-vnutri-konteynera-dockertex)
  * [V Ubuntu](#V-ubuntu)
  * [V Debian](#V-debian)
  * [V Fedora](#V-fedora)
  * [V Gentoo](#V-gentoo)
  * [TeXLive na Linux v obkhod privyazannykh k konkretnomu linuksu paketam](#texlive-na-linux-v-obkhod-privyazannykh-k-konkretnomu-linuksu-paketam)
  * [V MacOS 10.10 i vyshe](#V-MacOS-1010-i-vyshe)
  * [Ustanovka shriftov PSCyr](#Ustanovka-shriftov-pscyr)
    * [Rabochiy sposob ustanovki v Ubuntu 15.10](#Rabochiy-sposob-ustanovki-v-ubuntu-1510)
    * [Ustanovka v MacOS 10.x](#Ustanovka-v-macos-10x)
    * [Rabochiy sposob ustanovki v Debian 9](#Rabochiy-sposob-ustanovki-v-debian-9)
* [Sborka PDF iz komandnoy stroki](#Sborka-pdf-iz-komandnoy-stroki)
* Raznoe
  * [Pakety i versii LaTeX](#Pakety-i-versii-latex)
  * [Redaktirovanie teksta](#Redaktirovanie-teksta)
  * [Formatirovanie iskhodnogo koda](#Formatirovanie-iskhodnogo-koda)
  * [Szhatie faylov](#Szhatie-faylov)
  * [Peresborka pdf dlya tipografii](#Peresborka-pdf-dlya-tipografii)
  * [Otchet o vremeni sborki](#Otchet-o-vremeni-sborki)
  * [Sborka grafiki `.tikz`](#Sborka-grafiki-tikz)

## Bystryy start
1. Skachat shablon v arkhive ili klonirovat etot repozitoriy.
2. Ustanovit v vashey srede kompilyatsii (naprimer, v redaktore TeXStudio) dvizhok
bibliografii `Biber`.
3. Skompilirovat `dissertation.tex` dlya polucheniya dissertatsii i `synopsis.tex`
dlya polucheniya avtoreferata.
4. Ubeditsya, chto vse uspeshno kompiliruetsya na vashem kompyutere (`Warning` v
`*.log` fayle kompilyatsii dopustimy).
5. Esli chto-to ne ustraivaet v oformlenii — proverte zakommentirovanye
vozmozhnosti v faylakh shablona, mnogo tonkostey v GOST ne opredeleny. Naprimer, v
fayle `biblatex.tex` mozhno otklyuchit otobrazhenie v spiske literatury poley DOI
i ISBN, a v `styles.tex` strochkoy `\linespread{1.42}` mozhno sdelat polutornyy
interval mezhdu strochkami «kak v Vorde» (neskolko shire, chem obshcheprinyatyy
«tipografskiy», poetomu na stranitsu vlezet menshe teksta).

## Kompilyatsiya chernovika

Dlya vklyucheniya rezhima chernovika mozhno vypolnit lyuboe iz sleduyushchikh deystviy:

- v fayle `usercfg.mk` dobavit strochku `DRAFTON ?= 1`
- v fayle `setup.tex` pomenyat znachenie parametra `draft` na 1
- zapustit komandu `make draft` ili `make DRAFTON=1`

Pri etom shablon budet sobiratsya s nekimi
otkloneniyami ot GOST, no v neskolko raz bystree (v osnovnom otlichiya kasayutsya
oformleniya spiska literatury). Etot rezhim udoben pri promezhutochnykh sborkakh,
naprimer, vo vremya nabora formul. **Obratite vnimanie**: numeratsiya rabot v spiske
literatury pri ispolzovanii rezhima chernovika mozhet byt nevernoy.
Krome togo, pri ispolzovanii `biblatex` v rezhime chernovika ne vedetsya podschet kolichestva punktov v spiske literatury.

Polzovateli Linux mogut primenyat komandy
`make dissertation-preformat` i `make synopsis-preformat`, chtoby ispolzovat predvaritelnoe
formatirovanie preambuly dissertatsii i avtoreferata (mozhet potrebovatsya ustanovka paketa
[`texlive-mylatexformat`](https://ctan.org/pkg/mylatexformat)).
Eto pozvolyaet uskorit sborku eshche priblizitelno v 1.5 raza (na povtornuyu sborku
chernovika dissertatsii na kompyutere s protsessorom Intel i5 trebuetsya okolo dvukh
sekund).

## Prostye oshibki

Esli ne sobiraetsya bibliografiya, ssylki na literaturu otobrazhayutsya voprosami
ili zhirnymi nazvaniyami:

1. Poprobovat pomenyat parametr `bibliosel` v sootvetstvuyushchem fayle
`setup.tex`, podrobnee chitat [«v sluchae problem s
bibliografiey»](Bibliography.md#V-sluchae-problem).
2. Ochistit papki proekta ot proshlykh vremennykh faylov (`*.aux`, `*.toc`,
`*.bbl`, `*.bcf`, `*.synctex.gz` i prochie podobnye).
3. Ubeditsya, chto v vashey srede kompilyatsii (naprimer, v redaktore TeXStudio)
pravilno vybran dvizhok bibliografii (v sootvetstvii s parametrom `bibliosel` v
kazhdom iz faylov `setup.tex`).
4. Provesti neskolko kompilyatsiy proekta.
5. Esli nichego iz predydushchikh punktov ne pomoglo, zapustit `latexmk` na glavnom
fayle avtoreferata ili dissertatsii, ili vypolnit [sootvetstvuyushchiy
`make`](#Sborka-pdf-iz-komandnoy-stroki).

Esli kompiliruetsya s oshibkami, to izuchenie sootvetstvuyushchego `*.log` fayla mozhet
pomoch opredelit prichinu (kak pravilo, oshibki vyzvany otsutstviem neobkhodimykh
paketov ili ikh versiy). Chasto pervaya oshibka v `*.log` fayle yavlyaetsya
pervoprichinoy ostalnykh.

## Ustanovka

### V Ubuntu s TexLive vnutri konteynera DockerTex

> Protestirovano v Ubuntu 16.04 LTS i Ubuntu 18.04 LTS

Dlya obespecheniya maksimalnoy vosproizvodimosti sborki proekta rekomenduetsya ispolzovat spetsializiarovannyy Docker-konteyner ot proekta [dockertex](https://gitlab.com/raabf/dockertex), baziruyushchiysya na Debian Buster 10 i TexLive 2018, s minimalnoy modifikatsiey (dobavleniem paketa shriftov ot Microsoft - `ttf-mscorefonts-installer` i nabora shriftov Liberation v vide paketa `fonts-liberation`). Obraz konteynera obemom okolo 2.5 Gb budet zagruzhen iz seti, pri etom s uchetom etapa raspakovki v sisteme potrebuetsya okolo 8 Gb svobodnogo mesta v kataloge `/var`.

Ustanovka konteynera v vashu sistemu vypolnyaetsya putem zapuska sootvetstvuyushchego skripta, nakhodyashchegosya v korne etogo shablona:

```bash
sh install-dockertex.sh
```

Dalee neobkhodimo vyyti iz sistemy i zayti snova (libo perezagruzitsya).

Posle etogo stanut dostupny dve novykh komandy - `dockertex` i `dockertexstudio`.
Dlya TexStudio budet sozdan yarlyk s nazvaniem *Docker TexStudio (texlive2018)* v kategorii *Office*.

**Komanda `dockertex`** ispolzuetsya dlya sborki proekta - dissertatsii, avtoreferata i prezentatsii (po suti eto `make` bez argumentov):

```bash
dockertex make
```

Posle vypolneniya komandy budut sozdany tri PDF-fayla: `dissertation.pdf`, `presentation.pdf` i `synopsis.pdf`.

Pri neobkhodimosti mozhno zapustit `make clean`:

```bash
dockertex make clean
```

Ostalnye argumenty `make` mogut byt vyzvany analogichno.

**Komanda `dockertexstudio`** ispolzuetsya dlya zapuska TexStudio iz konteynera:

```bash
dockertexstudio
```

Posle otkrytiya fayla `dissertation.tex` i nazhatiya <F5> budet sozdan PDF dissertatsii.

### V Ubuntu

> Protestirovano na Ubuntu 19.04.
> Dlya LTS-versiy rekomenduetsya ispolzovanie [DockerTex](#V-ubuntu-s-texlive-vnutri-konteynera-dockertex)

Dlya ustanovki XeTeX v Ubuntu i neobkhodimykh dopolnitelnykh paketov mozhno
ispolzovat komandu:

```bash
sudo apt-get install make texlive-xetex texlive-generic-extra texlive-lang-cyrillic texlive-lang-french texlive-science fonts-liberation latexmk biber
```

ili dlya ustanovki polnogo komplekta programm:

```bash
sudo apt-get install texlive-full
```

Dlya ispolzovaniya shriftov Microsoft trebuetsya ikh ustanovka.
Naprimer, dlya Ubuntu eto mozhno sdelat tak:

```bash
sudo apt-get install ttf-mscorefonts-installer
sudo fc-cache -fv
```

### V Debian

> Protestirovano na Debian 10.

Ustanovka analogichna Ubuntu.

Dlya ustanovki shriftov Microsoft dolzhen byt podklyuchen repozitoriy `contrib`.

### V Fedora

> Protestirovano na Fedora 27.

Dlya ustanovki XeTeX neobkhodimo ustanovit sleduyushchie pakety:

```bash
sudo dnf install texlive-xetex latexmk texlive-hyphen-russian biber \
                    texlive-extsizes texlive-cm texlive-amscls texlive-nag \
                    texlive-polyglossia texlive-euenc texlive-multirow \
                    texlive-makecell texlive-ec texlive-was texlive-zapfding \
                    texlive-totcount texlive-totpages texlive-interfaces \
                    texlive-tocloft texlive-tabulary texlive-floatrow \
                    texlive-biblatex texlive-biblatex-gost texlive-cite \
                    texlive-bibtex texlive-impnattypo texlive-cleveref \
                    texlive-tabu texlive-mwe
```

Dalee mozhno ustanovit shrifty iz nabora
[Microsoft's Core Fonts](http://mscorefonts2.sourceforge.net/). Naprimer, tak:

```bash
sudo dnf install http://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo fc-cache -fv
```

> V Fedora 23 est problema
> ([#84](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/issues/84))
> s kompilyatsiey bibliografii s pomoshchyu `biblatex` i `biber`, poetomu neobkhodimo
> pereklyuchitsya na ispolzovanie `bibtex`. Dlya etogo v fayle
> `Dissertation/setup.tex` pereklyuchite `\setcounter{bibliosel}{1}` v `0`, chtoby
> poluchilos `\setcounter{bibliosel}{0}`. Tu zhe samuyu operatsiyu povtorite v fayle
> `Synopsis/setup.tex`.

### V Gentoo

V repozitoriyakh Gentoo lezhit otnositelno staraya versiya TeXLive i soputstvuyushchikh paketov,
odnako osobykh problem s nimi vozniknut ne dolzhno. Sleduet uchityvat lish dva momenta:

- Ustarevshiy `dev-tex/latexmk` (na 31.05.2019). V repozitorii lezhit versiya 456,
kotoraya ne pozvolit sobrat proekt. Neobkhodimo
[sozdat sobstvennyy repozitoriy](https://wiki.gentoo.org/wiki/Custom_repository)
i skopirovat v nego ebild ot 456 versii, pereimenovav v sootvetstvii s aktualnoy
(na dannyy moment eto 464a). (Esli prosto skopirovat ebild pod novym imenem
v tot zhe samyy glavnyy repozitoriy, to pri ocherednom `emerge --sync` on budet perezatert.)
- Stilevoy fayl `impnattypo.sty`, neobkhodimyy dlya sborki proekta, otpravlen meynteynerami
v paket `dev-texlive/texlive-langfrench`, poetomu krome osnovnykh paketov neobkhodimo
ustanovit i ego.

### TeXLive na Linux v obkhod privyazannykh k konkretnomu linuksu paketam
[How to install «vanilla» TeXLive on Debian or Ubuntu?](http://tex.stackexchange.com/a/95373) —
instruktsiya na angliyskom yazyke, kak stavit TeXLive na Linux v obkhod privyazannykh
k konkretnomu linuksu paketam (na primere Debian i Ubuntu).

### V MacOS 10.10 i vyshe
Dlya ustanovki v srede MacOS dostatochno ustanovit paket MacTeX
[otsyuda](https://tug.org/mactex/mactex-download.html). Posle ustanovki
neobkhodimo dobavit puti k ustanovlennym faylam v peremennuyu okruzheniya `PATH`,
naprimer, tak:

```bash
export PATH=$PATH:export PATH=$PATH:/Library/TeX/texbin
```

Chtoby sdelat effekt postoyannym mozhno dobavit etu stroku v `.bash_profile`:

```bash
echo "export PATH=$PATH:export PATH=$PATH:/Library/TeX/texbin" >>~/.bash_profile
```

Teper pri sleduyushchem logine, vam budut dostupny utility iz paketa,
neobkhodimye dlya raboty `make`-skriptov.

### Ustanovka shriftov PSCyr
PSCyr — eto paket krasivykh russkikh shriftov dlya LaTeX. K sozhaleniyu, ego nuzhno
ustanavlivat otdelno. Esli on u vas ne ustanovlen, to nichego strashnogo —
shablon zarabotaet i bez nego. Nu luchshe by ego vse-taki postavit. Instruktsii po
ustanovke PSCyr dlya razlichnykh konfiguratsiy privedeny
[v fayle `PSCyr/README.md` vnutri
repozitoriya](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/blob/master/PSCyr/README.md).
Esli vy ne nashli podkhodyashchuyu vam instruktsiyu, no smogli vypolnit ustanovku
samostoyatelno, to bolshaya prosba
[podelitsya](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/pulls)
vashimi narabotkami.

#### Rabochiy sposob ustanovki v Ubuntu 15.10
(kompilyatsiya iz [instruktsii na welinux](https://web.archive.org/web/20190609183954/http://welinux.ru/post/3200/)
i faylov, kotorye est v shablone)

Nuzhno skachat shablon, nayti v papke PSCyr fayl pscyr0.4d.zip i raspakovat ego
soderzhimoe kuda ugodno. Chtoby ne perepisyvat puti, papka s soderzhimym dolzhna
nazyvatsya PSCyr, a ne pscyr. Zatem nado zayti v
terminal, pereyti k tomu katalogu, gde lezhit papka PSCyr s soderzhimym, i
vypolnit komandy iz vysheupomyanutogo rukovodstva:
```bash
echo "fadr6t AdvertisementPSCyr \"T2AEncoding ReEncodeFont\"" > ./PSCyr/fonts/map/pscyr.map
```
Dalshe nado uznat, gde u vas lokalnyy katalog texmf. Dlya etogo vypolnyaem
```bash
kpsewhich -expand-var='$TEXMFLOCAL'
```
S veroyatnostyu okolo edinitsy rezultat budet `/usr/local/share/texmf/`.
Kopiruem vse tuda:
```bash
sudo cp -R ./PSCyr/* /usr/local/share/texmf/
```
Nu i podklyuchaem:
```bash
sudo texhash
updmap --enable Map=pscyr.map
sudo mktexlsr
```

#### Ustanovka v MacOS 10.x
1. Skachat fayly so shriftami i raspakovat ikh v odnu papku.
2. Sozdat/otredaktirovat fayl `install.sh`, chtoby on soderzhal sleduyushchee:

```bash
#!/bin/sh

INSTALLDIR=`kpsewhich -expand-var='$TEXMFLOCAL'`
mkdir -p $INSTALLDIR/{tex/latex,fonts/tfm/public,fonts/vf/public,fonts/type1/public,fonts/afm/public,doc/fonts,fonts/map/dvips,fonts/map/dvipdfm,fonts/enc/dvips}/pscyr
mv fonts/map/dvips/pscyr/* $INSTALLDIR/fonts/map/dvips/pscyr
mv fonts/map/dvipdfm/pscyr/* $INSTALLDIR/fonts/map/dvipdfm/pscyr
mv fonts/enc/dvips/* $INSTALLDIR/fonts/enc/dvips/*
mv tex/latex/pscyr/* $INSTALLDIR/tex/latex/pscyr
mv fonts/tfm/public/pscyr/* $INSTALLDIR/fonts/tfm/public/pscyr
mv fonts/vf/public/pscyr/* $INSTALLDIR/fonts/vf/public/pscyr
mv fonts/type1/public/pscyr/* $INSTALLDIR/fonts/type1/public/pscyr
mv fonts/afm/public/pscyr/* $INSTALLDIR/fonts/afm/public/pscyr
mv LICENSE doc/README.koi doc/PROBLEMS ChangeLog $INSTALLDIR/doc/fonts/pscyr

VARTEXFONTS=`kpsewhich -expand-var='$VARTEXFONTS'`
rm -f $VARTEXFONTS/pk/modeless/public/pscyr/*

mktexlsr

echo "Map pscyr.map\n" >> $INSTALLDIR/web2c/updmap.cfg
updmap-sys
```

3. Zapustit poluchennyy skript s pomoshchyu `sudo`:

```bash
sudo bash ./install.sh
```
#### Rabochiy sposob ustanovki v Debian 9

Analogichno tomu kak v Ubuntu ne prokhodit, voznikayut slozhnosti s pravami dostupa
k nekotorym faylam. Razbirayus v chem delo. Vyvodit v log sleduyushchee soobshchenie:
```bash
/usr/local/share/texmf/tex/latex/pscyr/pscyr.sty: Permission denied /usr/share/texmf/tex/latex/pscyr/pscyr.sty: Permission denied
```

## Sborka PDF iz komandnoy stroki

Sborku mozhno proizvodit sleduyushchimi komandami:

* dissertatsiya: `latexmk -pdf -pdflatex="xelatex %O %S" dissertation`
* avtoreferat: `latexmk -pdf -pdflatex="xelatex %O %S" synopsis`

Libo mozhno ispolzovat make-fayly (dvizhok `xelatex`): iz kornevogo
kataloga vypolnyat

* `make` dlya sborki vsego
* `make dissertation` dlya sborki dissertatsii,
* `make synopsis` dlya sborki avtoreferata,
* `make presentation` dlya sborki prezentatsii dlya doklada,
* `make dissertation-draft` dlya sborki dissertatsii v rezhime chernovika,
* `make synopsis-draft` dlya sborki avtoreferata v rezhime chernovika,
* `make synopsis-booklet` dlya sborki avtoreferata dlya pechati,
* `make presentation-booklet` dlya sborki prezentatsii dlya pechati,
* `make presentation-handout` dlya sborki razdatochnykh materialov,
* `make draft` dlya bystroy sborki dissertatsii i avtoreferata v rezhime chernovika,
* `make release` dlya sborki vsego i vneseniya finalnykh *.pdf faylov v
  sistemu kontrolya versiy git
* `make clean` ochistka ot vremennykh faylov
* `make distclean` ochistka vsekh generiruemykh faylov (vklyuchaya *.pdf*)
* `make pdflatex` sborka polnoy versii s dvizhkom `pdflatex` (neskolko
  bystree dlya avtoreferata, chem `xelatex`, dvizhok dlya bibliografii v
  sootvetstvii s nastroykami
  [`setup.tex`](../common/setup.tex)).

Prezentatsiya mozhet sobiratsya sobiratsya lyubym iz trekh dvizhkov:
`pdflatex`, `xelatex`, `lualatex`.

## Raznoe

### Pakety i versii LaTeX
* Shablon po umolchaniyu vklyuchaet ryad rasprostranennykh paketov, chtoby vy mogli
srazu imi polzovatsya. Odnako, na vashey mashine kakie-to pakety mogut byt ne
ustanovleny. Esli vam oni ne nuzhny, to vy mozhete ikh prosto udalit (komanda
`\usepackage{<imya paketa>}`).
* Luchshe vsego ispolzovat aktualnye i polnye versii LaTeX-distributivov, eto
pomozhet izbezhat mnogikh problem. Naprimer, [MikTeX](http://miktex.org/download)
2.9.6361+ dlya Windows ili [TeXLive](http://www.tug.org/texlive/acquire.html)
2017+ dlya mnozhestva OS.

### Redaktirovanie teksta
* Esli u vas eshche ne sformirovalis predpochteniya po LaTeX-redaktoru, to obratite
vnimanie na [TeXStudio](https://texstudio.org/#download),
sushchestvuyushchiy dlya vsekh osnovnykh platform.
* Nekotorye redaktory (v tom chisle TeXStudio) pozvolyayut podklyuchit proverku
grammatiki s pomoshchyu [Language
Tool](http://wiki.languagetool.org/checking-la-tex-with-languagetool) (est
podderzhka russkogo yazyka). Polnostyu ot oshibok on ne spaset, no poisk prostykh
sluchaev oblegchaet. Naprimer, v predlozhenii «Kak pravilo slon bolshe cherepakhi.»
on poprosit postavit zapyatuyu, esli odno i to zhe slovo ispolzuetsya podryad (ili
s intervalom v neskolko slov) — LT vtoroe slovo podcherknet i pri neobkhodimosti
ne slozhno ponyat, est smysl ispolzovat sinonim, mozhet byt napisat «etot,
kotoryy» ili tak i ostavit. Podobnykh prostykh proverok —
[sotni](https://github.com/languagetool-org/languagetool/blob/master/languagetool-language-modules/ru/src/main/resources/org/languagetool/rules/ru/grammar.xml).

### Formatirovanie iskhodnogo koda
Programma [`latexindent`](https://www.ctan.org/pkg/latexindent) pozvolyaet
formatirovat iskhodnyy kod `.tex` faylov.
Eto delaet kod bolee chitaemym i edinoobraznym.

Dlya formatirovaniya polzovatelskikh dokumentov mozhno ispolzovat komandu:

```bash
make indent
```
Mozhno ukazyvat drugoy fayl dlya formatirovaniya.
Naprimer, dlya formatirovaniya tolko fayla `MyFILE.tex`:

```bash
make indent INDENT_FILES=MyFILE.tex
```
Po umolchaniyu nastroyki formatirovaniya schityvayutsya iz fayla `indent.yaml`.
Dlya ispolzovaniya drugogo fayla nastroek, naberite v komandnoy stroke:
```bash
make indent INDENT_SETTINGS=mysettings.yaml
```

### Szhatie faylov
Razmer vykhodnykh `.pdf` faylov mozhet byt bolshim.
Osobenno, esli v tekste prisutstvuet mnogo risunkov s bolshim razresheniem.
Programma [`gs`](https://ghostscript.com/) pozvolyaet znachitelno umenshit
razmer `.pdf` faylov za schet snizheniya kachestva rastrovykh izobrazheniy.

Dlya szhatiya fayla dissertatsii mozhno ispolzovat komandu:
```bash
make compress-lowdpi
```
Szhatyy fayl budet sozdan s suffiksom `*_lowdpi.pdf`

Po umolchaniyu, razreshenie izobrazheniy snizhaetsya do 144 DPI. Izmenit razreshenie
i drugie nyuansy mozhno putem redaktirovaniya fayla [`compress.mk`](../compress.mk#L36-L60)

Szhat proizvolnyy pdf fayl `somefile.pdf` mozhno komandoy:

```bash
make compress-lowdpi COMPRESS_FILE=somefile
```

### Peresborka pdf dlya tipografii
Tipografii mogut vydvigat spetsialnye trebovaniya k pdf faylam. Naibolee tipichnymi yavlyayutsya:
 * otsutsvie prozrachnosti
 * zadanie vsekh tsvetov v CMYK
 * ispolzovanie formata PDF versii 1.3

Dlya privedeniya pdf v sootvestvie s dannymi trebovaniyami mozhno ispolzovat komandu:
```bash
make compress-cmyk
```
Printsip raboty i vozmozhnye pobochnye effekty opisany v [`compress.mk`](../compress.mk#L64-L143).

### Otchet o vremeni sborki

Dlya vyvoda na ekran v kontse sborki informatsii o zatrachennom vremeni mozhno
ispolzovat flag `TIMERON=1`.
K primeru, zapusk komandy

```bash
make synopsis TIMERON=1
```

vyvedet na ekran v kontse sborki informatsiyu o vremeni, zatrachennom na kazhdyy
vyzov ispolzuemogo dvizhka latex, a takzhe summarno zatrachennoe vremya.

### Sborka grafiki `.tikz`

V protsesse sozdaniya grafiki s ispolzovaniem biblioteki [`tikz`](https://en.wikipedia.org/wiki/PGF/TikZ) trebuetsya chastaya kompilyatsiya iskhodnogo fayla.
Proizvodit ee vmeste s ostalnym tekstom dovolno zatratno po vremeni.

Dlya uskorennoy kompilyatsii faylov `.tikz` otdelno ot ostalnogo shablona predusmotren retsept `make tikz`.
Dlya zapuska kompilyatsii risunka trebuetsya zadat put k faylu `.tikz` pri pomoshchi peremennoy `TIKZFILE`.

Naprimer,

```bash
make tikz TIKZFILE=Presentation/images/tikz_plot.tikz
```

sgeneriruet fayl `tikz_plot.pdf` v kornevoy papke.

### Generatsiya razdatochnogo materiala
Dlya zashchity mozhet potrebovatsya pechat razdatochnogo materiala prezentatsii.
V etikh materialakh soderzhatsya slaydy prezentatsii i, vozmozhno, kommentarii k nim.

Dlya generatsii razdatochnykh materialov v shablone predusmotren fayl `presentation_handout.tex`.
Pervym delom trebuetsya sgenerirovat samu prezentatsiyu `presentation.pdf`.
Dalee, v fayle `presentation_handout.tex` nado dobavit slaydy s sootvetstvuyushchimi kommentariyami pri
pomoshchi makro `\includeslide`.
Vykhodnoy fayl `presentation_handout.pdf` generiruetsya pri pomoshchi komandy
```bash
make presentation-handout
```
