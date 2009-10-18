\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pwrmgr}[2009/09/21 Klasa dla prac magisterskich]

\newif\ifpwr@pdf
\ifx\pdfoutput\undefined\else
\ifx\pdfoutput\relax\else
\ifcase\pdfoutput\else
\pwr@pdftrue
\fi
\fi
\fi
\ifpwr@pdf\else
\ClassError{pwrmgr}{!!! Please use ONLY pdfLaTeX !!!}
\fi

\LoadClass[12pt]{mwbk}
\RequirePackage{lmodern}
\RequirePackage[T1,plmath]{polski}
\RequirePackage[expansion,protrusion,kerning,spacing,tracking]{microtype}
\g@addto@macro\verbatim{\microtypesetup{activate=false}}

\RequirePackage{graphicx}
\RequirePackage{makeidx}\makeindex
\bibliographystyle{plplain}

\RequirePackage[tbtags]{amsmath}
\RequirePackage{amsthm,amsfonts}
\RequirePackage{mathbbol}

\RequirePackage{listings}
\let\@oldchap\chapter@toc
\def\chapter@toc{\@oldchap\addtocontents{lol}{\protect\addvspace{10\p@}}}
\def\lstlistingname{Program}
\def\lstlistlistingname{Spis program\'ow}%'
\def\listoflistings{\lstlistoflistings\addtocontents{toc}{\protect\contentsline{chapter}{\lstlistlistingname}{\thepage}}}
\lstnewenvironment{RCode}[2]{\lstset{language=R,frame=single,caption={#2},label={#1}}}{}
\lstnewenvironment{MatlabCode}[2]{\lstset{language=Matlab,frame=single,caption={#2},label={#1}}}{}

\theoremstyle{definition}\newtheorem{definicja}{Definicja}
\theoremstyle{plain}\newtheorem{twierdzenie}{Twierdzenie}
\theoremstyle{plain}\newtheorem{lemat}{Lemat}
\newtheoremstyle{uwagi}{3pt}{3pt}{}{}{\bf}{:}{.5em}{}
\theoremstyle{uwagi}\newtheorem*{uwaga}{Uwaga}
\newenvironment{dowod}[1][\empty]{
\ifx\empty#1
\begin{proof}[Dow\'od]\else
\begin{proof}[Dow\'od (#1)]
\fi}{\end{proof}}
\newcommand\CND{\mbox{\qedhere}}

\newcommand\en[1]{\selecthyphenation{english}#1\selecthyphenation{polish}}

\newenvironment{figurehere}{\begin{center}\def\@captype{figure}}{\end{center}}
\newenvironment{tablehere}{\begin{center}\def\@captype{table}}{\end{center}}

% strona tytułowa porzyczona z pakietu pwrdtyt.sty

\RequirePackage[absolute]{textpos}

\newcommand\tytul[2][20mm]{\gdef\@tytul{\vspace{#1}#2}}
\def\@tytul{\@latex@error{No \noexpand\tytul given}\@ehc}
\newcommand\tytulen[2][3mm]{\gdef\@tytulen{\\[#1](#2)}}
\def\@tytulen{\@latex@error{No \noexpand\tytulen given}\@ehc}
\def\autor#1{\gdef\@autor{#1}}
\def\@autor{\@latex@error{No \noexpand\autor given}\@ehc}
\def\promotor#1{\gdef\@promotor{#1}}
\def\@promotor{\@latex@error{No \noexpand\promotor given}\@ehc}
\def\wydzial#1{\gdef\@wydzial{#1}}
\def\@wydzial{Wydzia\l\ Podstawowych Problem\'ow Techniki}
\def\kluczowe#1{\gdef\@kluczowe{#1}}
\def\@kluczowe{\@latex@error{No \noexpand\kluczowe given}\@ehc}
\def\streszczenie#1{\gdef\@streszczenie{#1}}
\def\@streszczenie{\@latex@error{No \noexpand\streszczenie given}\@ehc}
\def\bibliografia#1{\IfFileExists{#1.bib}{\gdef\@bibliografia{#1}}{\@latex@error{#1.bib: No such file or directory}\@ehg}}
\def\@bibliografia{\@latex@error{No \noexpand\bibliografia given}\@ehc}
\def\wciecia#1{\gdef\@wciecia{#1}}
\def\@wciecia{2}

\SetTOCIndents{{}{\quad}{A.10.\enspace}{A.9.10.\enspace}{A.9.9.10.\enspace}{\quad}{\quad}}

\AtBeginDocument{\cleardoublepage\global\@mainmatterfalse\pagenumbering{roman}
\begin{titlepage}%
\begin{textblock*}{210mm}(0mm,0mm)
\selecthyphenation{nohyphenation}
\noindent\unitlength1mm%
\begin{picture}(0,0)
\put(132,-25){\makebox(0,0)[cb]{\fontsize{16pt}{18pt}\usefont{T1}{ugm}{m}{n}\@wydzial}}%
\put(68,-186){\framebox(128,80){}}%
\put(72,-182){\framebox(120,72){}}%
\put(132,-95){\makebox(0,0)[cb]{\fontsize{30pt}{32pt}\usefont{T1}{ugm}{m}{n}PRACA DYPLOMOWA}}%
\put(132,-120){\makebox(0,0){\parbox{115mm}{\centering\fontsize{16pt}{18pt}\usefont{T1}{ugm}{m}{n}\@tytul\@tytulen}}}%
\put(132,-160){\makebox(0,0){\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}\@autor}}%
\put(192,-197){\makebox(0,0)[tr]{\parbox{115mm}{\fontsize{12pt}{14pt}\usefont{T1}{ugm}{m}{n}\raggedleft s{\l}owa kluczowe:\\\@kluczowe}}}%
\put(72,-237){\makebox(0,0)[tl]{\parbox{115mm}{\fontsize{10pt}{12pt}\usefont{T1}{ugm}{m}{n}\raggedright streszczenie:\\\@streszczenie}}}%
\put(132,-282){\makebox(0,0)[bc]{\fontsize{16pt}{18pt}\usefont{T1}{ugm}{m}{n} Wroc{\l}aw \number\year}}%
\put(132,-176){\makebox(0,0){\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}Promotor: \@promotor}}%
\end{picture}
\end{textblock*}
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \mbox{}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@autor\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@tytul\@empty
  \global\let\@tytulen\@empty
  \global\let\@wydzial\@empty
  \global\let\@streszczenie\@empty
  \global\let\@kluczowe\@empty
  \global\let\@prommotor\@empty
  \global\let\title\relax
  \global\let\tytul\relax
  \global\let\tytulen\relax
  \global\let\author\relax
  \global\let\autor\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\streszczenie\relax
  \global\let\wydzial\relax
  \global\let\kluczowe\relax
  \global\let\promotor\relax
  \setcounter{tocdepth}{\@wciecia}
  \tableofcontents
}

\newif\ifpwr@hasintro\pwr@hasintrofalse
\newif\ifpwr@haschapters\pwr@haschaptersfalse
\newif\ifpwr@hasappendices\pwr@hasappendicesfalse

\newcommand\wstep[1]{%
\ifpwr@hasintro
\@latex@error{Can have only one \protect\wstep}\@ehc
\fi
\ifpwr@haschapters
\@latex@error{\protect\wstep\space must precede \protect\rozdzial}\@ehc
\fi
\ifpwr@hasappendices
\@latex@error{\protect\wstep\space must precede \protect\dodatek}\@ehc
\fi
\global\pwr@hasintrotrue
\chapter*{Wst\k ep}\input{#1}
}

\newcommand\wykaz[2]{%
\ifpwr@hasintro
\ifpwr@haschapters
\ifpwr@hasappendices\else
\appendix
\global\pwr@hasappendicestrue
\fi
\chapter{#1}\input{#2}
\else
\@latex@error{Must be present before \protect\wstep\space or after \protect\dodatek}\@ehc
\fi
\else
\chapter*{#1}\input{#2}
\fi
}

\newcommand\rozdzial[1]{%
\ifpwr@hasintro\else
\@latex@error{You must include \protect\wstep}\@ehc
\fi
\ifpwr@haschapters\else
\mainmatter
\fi
\ifpwr@hasappendices
\@latex@error{\protect\rozdzial\space must precede \protect\dodatek}\@ehc
\fi
\global\pwr@haschapterstrue
\input{#1}
}

\newcommand\dodatek[1]{%
\ifpwr@hasintro\else
\@latex@error{You must include \protect\wstep}\@ehc
\fi
\ifpwr@haschapters\else
\@latex@error{You must include at least one \protect\rozdzial}\@ehc
\fi
\ifpwr@hasappendices\else
\appendix
\fi
\global\pwr@hasappendicestrue
\input{#1}
}

\newif\ifpwr@bib\pwr@bibfalse
\let\pwr@cite\cite
\renewcommand\cite{\global\pwr@bibtrue\pwr@cite}
\newif\ifpwr@ind\pwr@indfalse
\let\pwr@index\index
\renewcommand\index{\global\pwr@indtrue\pwr@index}
\AtEndDocument{\backmatter
\ifpwr@hasintro\else
\@latex@error{You must include \protect\wstep}\@ehc
\fi
\ifpwr@haschapters\else
\@latex@error{You must include at least one \protect\rozdzial}\@ehc
\fi
\ifpwr@hasappendices\else
\backmatter
\fi
\prefixing
\ifpwr@bib\bibliography{\@bibliografia}\fi
\ifpwr@ind\printindex\fi
}

