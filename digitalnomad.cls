%% start of file 'digitalnomad.cls'

% Copyright 2022 Limitless Interactive, LLC

% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
% associated documentation files (the "Software"), to deal in the Software without restriction, 
% including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
% and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
% subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all copies or
% substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
% NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{digitalnomad}[2022/10/14 v1.0 modern cv format for digital / tech professional]

% Paper Configuration
\DeclareOption{a4paper}{
    \setlength\paperheight{297mm}
    \setlength\paperwidth{210mm}
}
\DeclareOption{letterpaper}{
    \setlength\paperheight{11in}
    \setlength\paperwidth{8.5in}
}

% Font Configuration
\newcommand\@ptsize{}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{sans}{\AtBeginDocument{\renewcommand{\familydefault}{\sfdefault}}}
\DeclareOption{roman}{\AtBeginDocument{\renewcommand{\familydefault}{\rmdefault}}}

% draft/final option
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

% Execute Options
\ExecuteOptions{letterpaper,11pt,final}
\ProcessOptions\relax
\input{size1\@ptsize.clo}

% Required Packages
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage{url}
\RequirePackage{wrapfig}


\urlstyle{tt}
\AtEndPreamble{
    \pagenumbering{arabic}
    \RequirePackage[unicode]{hyperref}
    \hypersetup{
        breaklinks,
        baseurl = https://,
        pdfborder = 0 0 0,
        pdfstartpage = 1,
        pdfcreator = {\LaTeX{} with digital nomad template},
        bookmarksopen = true,
        bookmarksdepth = 2,
        pdfauthor = {\@firstname{}~\@lastname{}}
        pdftitle = {\@firstname{}~\@lastname{}~resume},
        pdfsubject    = {Resum\'{e} of \@firstname{}~\@lastname{}},
        pdfkeywords   = {\@firstname{}~\@lastname{}, curriculum vit\ae{}, resum\'{e}}
    }
}
\RequirePackage{fancyhdr}
\RequirePackage{calc}
\RequirePackage{xargs}
\RequirePackage{microtype}
\RequirePackage{multicol}
\RequirePackage{graphicx}

\fancypagestyle{plain}{
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhf{}
}
\pagestyle{plain}
% todo page numbering

% minimal base settings
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength{\parindent}{0\p@}
\setlength{\parskip}{0\p@}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}

\raggedbottom
\onecolumn

% default colors
\definecolor{color0}{rgb}{0,0,0} % text
\definecolor{color1}{rgb}{0,0,0} % accent
\definecolor{color2}{rgb}{0,0,0} % hints
\definecolor{color3}{rgb}{0,0,0} % black

% design elements
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\renewcommand*{\title}[1]{\def\@title{#1}}
\newcommand*{\email}[2]{\def\@email{#1}\def\@emailtext{#2}}
\newcommand*{\phone}[2]{\def\@phone{#1}\def\@phonetext{#2}}
\newcommand*{\mobile}[2]{\def\@mobile{#1}\def\@mobiletext{#2}}
\newcommand*{\calendar}[2]{\def\@calendar{#1}\def\@calendartext{#2}}
\newcommand*{\repo}[2]{\def\@repo{#1}\def\@repotext{#2}}
\newcommand*{\web}[2]{\def\@web{#1}\def\@webtext{#2}}
\newcommand*{\steam}[2]{\def\@steam{#1}\def\@steamtext{#2}}

\newcommand*{\listitemsymbol}{\faCaretRight}
\newcommand*{\iconemail}{}
\newcommand*{\iconphone}{}
\newcommand*{\iconmobile}{}
\newcommand*{\iconfax}{}
\newcommand*{\iconcalendar}{}
\newcommand*{\iconrepo}{}
\newcommand*{\iconweb}{}
\newcommand*{\iconsteam}{}


% fonts
\AtBeginDocument{\normalfont\color{color0}}

\newcommand*{\fontfname}{}
\newcommand*{\fonttitle}{}
\newcommand*{\fontsection}{}
\newcommand*{\fontsubsection}{}
\newcommand*{\fonthint}{}
\newcommand*{\fontaccent}{}
\newcommand*{\fontdetails}{}


% styles
\newcommand*{\stylename}[1]{{\fontfname#1}}
\newcommand*{\styletitle}[1]{{\fonttitle#1}}
\newcommand*{\stylesection}[1]{{\fontsection#1}}
\newcommand*{\stylesubsection}[1]{{\fontsubsection#1}}
\newcommand*{\stylehint}[1]{{\fonthint\textcolor{color0}{#1}}}
\newcommand*{\styleaccent}{}
\newcommand*{\styledetails}[1]{{\fontdetails#1}}

% load style
\newcommand*{\cvstyle}[1]{
    \RequirePackage{digitalnomad.style.#1}
}
% load color
\newcommand*{\cvcolor}[1]{
    \RequirePackage{digitalnomad.color.#1}
}

% recompute automatic lengths
\newcommand*{\recomputelengths}{}
\AtBeginDocument{\recomputelengths{}}

% creates a length if not defined
\newcommand*{\@initializelength}[1]{%
  \ifdefined#1\else\newlength{#1}\fi}

  
% internal maketitle command to issue a new line only when required
\newif\if@firstdetailselement\@firstdetailselementtrue

\newcommand*{\makenewline}{
    \if@firstdetailselement
    \strut
    \else
    \\\fi
    \@firstdetailselementfalse
}
% header
\newcommand*{\makeheader}{}
\title{}

% footer
\newcommand*{\makefooter}{}
\newif\if@displaypagenumbers\@displaypagenumberstrue
\newcommand*{\nopagenumbers}{\@displaypagenumbersfalse}
\AtEndPreamble{%
  \AtBeginDocument{%
    \if@displaypagenumbers%
      \@ifundefined{r@lastpage}{}{%
        \ifthenelse{\pageref{lastpage}>1}{%
          \newlength{\pagenumberwidth}%
          \settowidth{\pagenumberwidth}{\color{color2}\fontdetails\itshape\strut\thepage/\pageref{lastpage}}%
          \fancypagestyle{plain}{%
            \fancyfoot[r]{\parbox[b]{\pagenumberwidth}{\color{color2}\fontdetails\itshape\strut\thepage/\pageref{lastpage}}}}% the parbox is required to ensure alignment with a possible center footer 
          \pagestyle{plain}}{}}%
      \AtEndDocument{\label{lastpage}}\else\fi}}


% links
\newcommand*{\http}[2]{
    \ifthenelse{\equal{#2}{}}
    {\href{#1}{#1}}
    {\href{#1}{#2}}
}

\newcommand*{\tel}[2]{
    \ifthenelse{\equal{#2}{}}
    {\href{tel:+1#1}{#1}}
    {\href{tel:+1#1}{#2}}
    
}
\newcommand*{\mailto}[2]{
    \ifthenelse{\equal{#2}{}}
    {\href{https://#1}{#1}}
    {\href{https://#1}{#2}}

}

% sections
\newcommand*{\section}[1]{}
\RequirePackage{suffix}
\AtBeginDocument{\WithSuffix\newcommand\section*{\section}}

\newcommand*{\subsection}[1]{}
\AtBeginDocument{\WithSuffix\newcommand\subsection*{\subsection}}

% entries
\newcommand*{\jobitem}[3][.25em]{}
\newcommand*{\job}[8][.25em]{}
\newcommand*{\jobbullet}[1][]{}
\endinput
