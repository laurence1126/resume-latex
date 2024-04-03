\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[Templete for resume]

%-----------------------------------------------------------------------------%
% defination of class variables
\newcommand{\@resumeSytle}{classic}
\DeclareOption{fancy}{\renewcommand{\@resumeSytle}{fancy}}
\DeclareOption{icons}{\renewcommand{\@resumeSytle}{icons}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}
\def\vspaceHead{-2em} \def\vspaceTail{-1em}
%-----------------------------------------------------------------------------%
% input command for name
\newcommand{\name}[1]{\author{#1}}
% input command for phone
\newcommand{\@phone}{}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
% input command for Email
\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
% input command for address
\newcommand{\@address}{}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
%-----------------------------------------------------------------------------%
% redefine maketitle
\renewcommand\maketitle{
  	\vspace*{\vspaceHead} % '*' for adjust vertical space at the start of a page
  	\begin{center}
    	{\LARGE\textbf{\@author}}\\[0.25em]
    	\ifthenelse{\NOT\equal{\@resumeSytle}{classic}}{\phoneIcon}{Phone:}\ \href{tel:\@phone}{\@phone}\ |\ 
    	\ifthenelse{\NOT\equal{\@resumeSytle}{classic}}{\emailIcon}{Email:}\ \href{mailto:\@email}{\@email}\\
    	\ifthenelse{\NOT\equal{\@resumeSytle}{classic}}{\addressIcon}{Address:}\ \@address
  	\end{center}
  	\thispagestyle{fancy}
    \ifthenelse{\equal{\@resumeSytle}{fancy}}{
        \vspace{\the\dimexpr \vspaceTail + 0.5em \relax}
    }{
        \vspace{\vspaceTail}
    }
}
%-----------------------------------------------------------------------------%
% load required packages
\usepackage[most]{tcolorbox}
\usepackage{enumitem}
\usepackage{fancyhdr}
\usepackage{fontspec}
\usepackage{geometry}
\usepackage{hyperref}
\usepackage{ifthen}
\usepackage{titlesec}
%-----------------------------------------------------------------------------%
% settings for fancy resume style
\newtcbox{\module}{tcbox width=forced left, width=\columnwidth, enhanced, colback=black!10!white, borderline west={1mm}{0pt}{black},boxrule=0mm,
	frame hidden, fontupper=\large\bf, colupper=black, left=0.5em, top=0.2em, bottom=0.2em, before skip=0.25em, after skip=0.25em, sharp corners, breakable}
\newtcbox{\transparent}{blank, on line, opacitytext=0}
\ifthenelse{\NOT\equal{\@resumeSytle}{fancy}}{
	\renewcommand{\module}[1]{\section{#1}}
}{}
%-----------------------------------------------------------------------------%
% settings for document page size
% A4 paper full size: 210mm x 297mm
\geometry{a4paper, total={190mm, 277mm}, left=10mm, top=10mm}
%-----------------------------------------------------------------------------%
% Settings for no hyphenation
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000
%-----------------------------------------------------------------------------%
% href links no special effect
\hypersetup{hidelinks, colorlinks=true, urlcolor=black, linkcolor=black}
%-----------------------------------------------------------------------------%
% settings for fancy header, footer, and page number
\fancyfootoffset{0pt}
\pagestyle{fancy}
\rhead{}\lhead{}
\cfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
%------------------------------------------------------------------------------%
% settings for document general fonts
% set the default folder to search for fonts
\def\@fontPath{./fonts/}
\IfFontExistsTF{Helvetica Neue}{
    \setmainfont{Helvetica Neue}[Renderer=HarfBuzz]
}{
    \setmainfont{HelveticaNeue}[
        Extension=.ttf,
        Path=\@fontPath,
        UprightFont=*,
        BoldFont=*-Bold,
        ItalicFont=*-Italic,
        BoldItalicFont=*-BoldItalic,
        Renderer=HarfBuzz
    ]
}
\IfFontExistsTF{JetBrainsMono Nerd Font}{
    \newfontfamily\JBNF{JetBrainsMono Nerd Font}[Scale=1.1, Renderer=HarfBuzz]
}{
    \newfontfamily\JBNF{JetBrainsMonoNerdFont}[
        Extension=.ttf,
        Path=\@fontPath,
        UprightFont=*-Regular,
        BoldFont=*-Bold,
        ItalicFont=*-Italic,
        BoldItalicFont=*-BoldItalic,
        Scale=1.1,
        Renderer=HarfBuzz
    ]
}

% define shortcut for icons
\def\githubIcon{\raisebox{-0.1em}{\JBNF\symbol{"EA84}\transparent{*}}}
\def\phoneIcon{\raisebox{-0.05em}{\JBNF\symbol{"EB93}}\hspace{0.5em}}
\def\emailIcon{\raisebox{-0.05em}{\JBNF\symbol{"F42F}}\hspace{0.5em}}
\def\addressIcon{\raisebox{-0.1em}{\large\JBNF\symbol{"F06A1}}\hspace{0.5em}}
%-----------------------------------------------------------------------------%
% settings for title formats
\titleformat{\section}[hang]{\large\bf}{}{0em}{}[\vspace{-0.8em}\rule{\columnwidth}{1pt}\vspace{-0.15em}]
\titlespacing{\section}{0em}{0em}{0em}[0em]
% parameters: {space left}{space above}{space below}[space remain on the right]
\newcommand{\institution}[2]{\parbox{\textwidth}{\textbf{#1}\hfill #2}}
\newcommand{\position}[2]{\parbox{\textwidth}{\textit{#1}\hfill #2}}
\newcommand{\awards}[2]{\parbox{\textwidth}{#1\hfill #2}}
\newcommand{\skills}[2]{\mbox{\textbf{#1:\ }#2}}
\newcommand{\note}[1]{\mbox{\textit{#1}}}
%-----------------------------------------------------------------------------%
% additional settings
\linespread{1.03} % set line spread
\setlength{\parindent}{0em}
\setlist[itemize, 1]{label=$\bullet$, nosep, leftmargin=1em}
\setlist[itemize, 2]{label=$\circ$, nosep, leftmargin=1.5em}
\setlist[enumerate, 1]{nosep, leftmargin=1.5em}
\setlist[enumerate, 2]{nosep, leftmargin=2em}
%----------------------------------------------------------------------------%
