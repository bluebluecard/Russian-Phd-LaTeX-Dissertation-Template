LaTeX template for a Russian PhD dissertation and its synopsis (author’s abstract).

## Features
* Encoding: UTF-8.
* Standard: GOST R 7.0.11-2011.
* Supported engines: pdfTeX, XeTeX, LuaTeX.
* Supported bibliography backends: built-in BibTeX-based workflow and BibLaTeX
  with Biber.

[**Template compilation examples**](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/releases/latest).

[**Software installation and dissertation PDF build instructions**](Readme/Installation.md).

[**How to write a dissertation on GitHub**](Readme/github.md)

## Discussion
General questions are best posted in the Gitter channel:
[![Join the chat at https://gitter.im/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

For bug reports and concrete proposals, please use the [Issues](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template/issues) section.

## Structure
* [dissertation.tex](dissertation.tex): main dissertation file.
* **[Dissertation folder](Dissertation/):** Structured file system for the dissertation template.
  * **images folder:** Place images used only in the dissertation here.
  * [setup.tex](Dissertation/setup.tex): Simplified dissertation formatting configuration.
* [synopsis.tex](synopsis.tex): main synopsis file.
* **[Synopsis folder](Synopsis/):** Structured file system for the synopsis template.
  * **images folder:** Place images used only in the synopsis here.
  * [setup.tex](Synopsis/setup.tex): Simplified synopsis formatting configuration.
* [presentation.tex](presentation.tex): main presentation file.
* **[Presentation folder](Presentation/):** Structured file system for the presentation template.
  * **images folder:** Place images used only in the presentation here.
  * [setup.tex](Presentation/setup.tex): Simplified presentation formatting configuration.
* **[Documents folder](Documents/):** Useful documents (GOST standards and regulations).
* **[PSCyr folder](PSCyr/):** PSCyr package + installation instructions.
* **[BibTeX-Styles folder](BibTeX-Styles/):** Collection of Russian BibTeX styles for UTF-8.
* **[common folder](common/):** Shared settings and content management files.
  * [characteristic.tex](common/characteristic.tex): Shared research summary used in dissertation and synopsis.
  * [concl.tex](common/concl.tex): Conclusion shared by synopsis and dissertation (according to [GOST R 7.0.11-2011](Documents/GOST%20R%207.0.11-2011.pdf), sections 5.3.3 and 9.2.3).
  * [data.tex](common/data.tex): Shared data (title, advisor, opponents, keywords, etc.).
  * [packages.tex](common/packages.tex) and [styles.tex](common/styles.tex): Shared package and style settings.
  * [setup.tex](common/setup.tex): Shared dissertation/synopsis configuration, including bibliography backend selection.
* **[biblio folder](biblio/):** Bibliography files.
  * [author.bib](biblio/author.bib): Author publications on the dissertation topic.
  * [registered.bib](biblio/registered.bib): Registered patents and software certificates.
  * [external.bib](biblio/external.bib): External references cited by the author.
* **images folder:** Shared image files.
  * **cache folder:** Folder for precompiled figures.
    * [placeholder.txt](images/cache/placeholder.txt): File needed to precompile figures on [Overleaf](https://www.overleaf.com/).
* **listings folder:** Shared listing files.
* **letters folder:** Files for generating mailing envelopes for the synopsis distribution.

Additional files:

* [Makefile](Makefile), [compress.mk](compress.mk), [unix.mk](unix.mk),
  [windows.mk](windows.mk), [examples.mk](examples.mk), [latexmkrc](latexmkrc): Template build system files.
* [usercfg.mk](usercfg.mk): User build-system settings.
* [indent.yaml](indent.yaml): Source code formatting configuration for
  [latexindent](https://www.ctan.org/pkg/latexindent).
* [.editorconfig](.editorconfig): Editor configuration file for tools that support
  [EditorConfig](https://editorconfig.org/).
* [Dockerfile](Dockerfile), [install-dockertex.sh](install-dockertex.sh): Files for building a
  [Docker](https://www.docker.com/) image for template compilation.
* [siunitx.cfg](siunitx.cfg): SI unit definitions for
  [siunitx](https://ctan.org/pkg/siunitx).
* [synopsis_booklet.tex](synopsis_booklet.tex),
  [presentation_booklet.tex](presentation_booklet.tex): Files for generating printable versions
  of the synopsis and presentation.
* [presentation_handout.tex](presentation_handout.tex): File for generating handouts from the
  presentation with notes under slides.
* [tikz.tex](tikz.tex): Standalone build file for [tikz](https://www.ctan.org/pkg/pgf) vector graphics.

## Additional useful information

* [Bibliography formatting](Readme/Bibliography.md)
* [How to contribute changes](CONTRIBUTING.md)
* [Useful links](Readme/Links.md)
* [Template in the ShareLaTeX gallery](https://www.sharelatex.com/templates/thesis/russian-phd-latex-dissertation-template) (very old version).

## Acknowledgements
* Many thanks to Yulia Martynova for the [original version of the template](http://alessia-lano.livejournal.com/4267.html).
* Many thanks to [dustalov](https://github.com/dustalov),
  [Lenchik](https://github.com/Lenchik), [tonkonogov](https://github.com/tonkonogov)
  for significant contributions and discussions.
* Thanks to [storkvist](https://github.com/storkvist), [kshmirko](https://github.com/kshmirko),
  [ZoomRmc](https://github.com/ZoomRmc), [tonytonov](https://github.com/tonytonov),
  [Thibak](https://github.com/Thibak), [eximius8](https://github.com/eximius8),
  [Nizky](https://github.com/Nizky) for useful fixes and remarks.

## License

CC BY 4.0

This means you may modify and use the template in any way, as long as attribution
for the dissertation formatting template is preserved (as a list of authors in this
file). There are no restrictions on dissertation text content: all rights for the
substantive dissertation content remain with the dissertation author.

In particular, if your dissertation includes an acknowledgements section (for
example, thanking your advisor for guidance, colleagues for help, etc.), it is up
to the author whether to thank the
*Russian-Phd-LaTeX-Dissertation-Template* authors for assistance with formatting.
Using the template imposes no restrictions on the use of generated files (for
example, final dissertation or synopsis PDFs), i.e., it does not regulate how those
files are distributed, copied, modified, and so on.
