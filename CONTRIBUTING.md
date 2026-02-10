## Reporting issues
If you encounter problems, you can ask in the Gitter chat.

[![Join the chat at https://gitter.im/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Please describe issues with a [minimal working example](http://meta.tex.stackexchange.com/questions/228/ive-just-been-asked-to-write-a-minimal-example-what-is-that "Producing a concise Minimal Working Example")
so that people willing to help can copy your code, compile it, and reproduce what
you see. It is best to phrase desired results concretely in the form “this is what
I get, and this is what I want instead.”

If you want a fix to be included in the template faster, create an Issue and include
a minimal working example.

## Simple fixes

If you want to make a simple fix (for example, correct a typo or add useful text to
the installation guide), you can do it directly on GitHub. Short guide:

1. Fork the repository by clicking the **Fork** button in the top-right corner of
   any repository page.
2. Open your fork, choose the page you want to edit, and click the pencil icon in
   the top-right corner (**edit this file**).
3. Edit the file and save your changes.
4. A large green **New Pull Request** button will appear in your fork. Click it and
   create a pull request.

## Complex fixes

If you want to make a more complex change (for example, update the template itself),
it is better to do it locally first, verify that everything works, and only then
open a pull request. Proposed changes should be validated with three compilers
(`pdflatex`, `xelatex`, `lualatex`) and two bibliography modes (`bibtex` and
`biblatex`).

If you are familiar with `make`, there is an `examples` target in the repository
root for this check. Running `make examples` tries to build the synopsis and the
dissertation with three compilers in multiple modes.

If you are new to git, a good starting point is this article:
[Pull Requests on GitHub, or How to contribute to someone else's project](http://habrahabr.ru/post/125999/).

## Style
Preferred:
* use four-space indentation, according to [latexindent settings](indent.yaml).
* avoid trailing spaces
* keep a trailing empty line at the end of file
* use `LF` line endings (not `CRLF`)

  (on Windows, [automatic conversion](https://git-scm.com/book/ru/v1/%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-Git-%D0%9A%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5-Git#%D0%A4%D0%BE%D1%80%D0%BC%D0%B0%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BF%D1%80%D0%BE%D0%B1%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5-%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB%D1%8B) can be convenient: `git config --local core.autocrlf true`)
* use UTF-8
