\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[Templete for resume]

%-----------------------------------------------------------------------------%
% defination of class variables
\newcommand{\@resumeSytle}{classic}
\DeclareOption{classic}{\renewcommand{\@resumeSytle}{classic}}
\DeclareOption{fancy}{\renewcommand{\@resumeSytle}{fancy}}
\DeclareOption{icons}{\renewcommand{\@resumeSytle}{icons}}
\DeclareOption{cmu}{\renewcommand{\@resumeSytle}{cmu}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}
% Adjust line spread
\linespread{1.08}
% Adjust vertical spaces before and after personal information
\def\vspaceHead{-2em} \def\vspaceTail{-1em}
% Adjust vertical spaces before section headings for CMU style
\def\vspaceSection{0.25\baselineskip}
% Adjust vertical spaces before institution lines for CMU style
\def\vspaceInstitution{0.5\baselineskip}
%-----------------------------------------------------------------------------%
% input command for name (required)
\newcommand{\name}[1]{\author{#1}}
% input command for phone (required)
\newcommand{\@phone}{}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
% input command for Email (required)
\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
% input command for address
\newcommand{\@address}{}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
% input command for LinkedIn
\newcommand{\@linkedin}{}
\newcommand{\linkedin}[1]{\renewcommand{\@linkedin}{#1}}
% input command for GitHub
\newcommand{\@github}{}
\newcommand{\github}[1]{\renewcommand{\@github}{#1}}
%-----------------------------------------------------------------------------%
% redefine maketitle
\renewcommand\maketitle{
  	\vspace*{\vspaceHead} % '*' for adjust vertical space at the start of a page
  	\begin{center}
        \ifthenelse{\equal{\@resumeSytle}{cmu}}{
            {\LARGE\textbf{\MakeUppercase\@author}}\\[0.25em]
            \setlength{\tabcolsep}{0em}
            \begin{tabularx}{\columnwidth}{>{\raggedright}X >{\centering \hsize=0.5\columnwidth}X >{\raggedleft}X}
                \href{tel:\@phone}{\@phone} &
                \href{https://\@linkedin}{\@linkedin}
                \ifthenelse{\NOT\equal{\@github}{}}{
                    \\[-0.2\baselineskip]\href{https://\@github}{\@github}
                }{} &
                \href{mailto:\@email}{\@email}
            \end{tabularx}
        }{
            {\LARGE\textbf{\@author}}\\[0.25em]
            \ifthenelse{\NOT\equal{\@resumeSytle}{classic}}{\large\phoneIcon}{Phone:}\ \href{tel:\@phone}{\@phone}\ |\ 
            \ifthenelse{\NOT\equal{\@resumeSytle}{classic}}{\large\emailIcon}{Email:}\ \href{mailto:\@email}{\@email}
            \ifthenelse{\NOT\equal{\@linkedin}{}}{
                \hspace{-0.5em} |\ \href{https://\@linkedin}{\large\linkedinIcon} \hspace{-0.25em}
            }{}
            \ifthenelse{\NOT\equal{\@github}{}}{
                \hspace{-0.75em} |\ \href{https://\@github}{\large\githubIcon}
            }{}
            \ifthenelse{\NOT\equal{\@address}{}}{
                \\\ifthenelse{\NOT\equal{\@resumeSytle}{classic}}{\large\addressIcon}{Address:}\ \@address
            }{}
        }
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
\RequirePackage[most]{tcolorbox}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{ifthen}
\RequirePackage{tabularx}
\RequirePackage{titlesec}
\RequirePackage{xparse}
%-----------------------------------------------------------------------------%
% settings for fancy resume style
\newtcbox{\module}{tcbox width=forced left, width=\columnwidth, enhanced, colback=black!10!white, borderline west={1mm}{0pt}{black},boxrule=0mm,
	frame hidden, fontupper=\large\bf, colupper=black, left=0.5em, top=0.2em, bottom=0.2em, before skip=0.25em, after skip=0.25em, sharp corners, breakable}
\newtcbox{\transparent}{blank, on line, opacitytext=0}
\ifthenelse{\equal{\@resumeSytle}{fancy}}{
	\renewcommand{\section}[1]{\module{#1}}
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
\def\githubIcon{\raisebox{0.1em}{\parbox{1.25em}{\JBNF\symbol{"EA84}}}}
\def\linkedinIcon{\raisebox{0.1em}{\parbox{1.1em}{\JBNF\symbol{"F08C}}}}
\def\phoneIcon{\raisebox{0.1em}{\parbox{1.1em}{\JBNF\symbol{"F098}}}}
\def\emailIcon{\raisebox{0.1em}{\parbox{1.1em}{\JBNF\symbol{"F01EF}}}}
\def\addressIcon{\raisebox{0.1em}{\parbox{1.25em}{\JBNF\symbol{"F015}}}}
%-----------------------------------------------------------------------------%
% settings for title formats
\ifthenelse{\equal{\@resumeSytle}{cmu}}{
    \titleformat{\section}[hang]{\centering}{}{0em}{}[\vspace{-0.7\baselineskip}\rule{\columnwidth}{0.75pt}\vspace{-0.2\baselineskip}]
    % parameters: {space left}{space above}{space below}[space remain on the right]
    \titlespacing{\section}{0em}{\vspaceSection}{-\vspaceInstitution}[0em]
    \newcommand{\institution}[2]{\parbox{\textwidth}{\vspace{\vspaceInstitution}\MakeUppercase{#1}\hfill #2}}
}{
    \titleformat{\section}[hang]{\large\bf}{}{0em}{}[\vspace{-0.7\baselineskip}\rule{\columnwidth}{1pt}\vspace{-0.2\baselineskip}]
    % parameters: {space left}{space above}{space below}[space remain on the right]
    \titlespacing{\section}{0em}{0em}{0em}[0em]
    \newcommand{\institution}[2]{\parbox{\textwidth}{\textbf{#1}\hfill #2}}
}
\newcommand{\position}[2]{\parbox{\textwidth}{\textit{#1}\hfill #2}}
\newcommand{\awards}[2]{\parbox{\textwidth}{#1\hfill #2}}
\newcommand{\skills}[2]{\textbf{#1:\ }#2}
\NewDocumentCommand{\note}{s m}{\IfBooleanTF{#1}{\textit{#2}}{#2}}
%-----------------------------------------------------------------------------%
% additional settings
\setlength{\parindent}{0em}
\setlist[itemize, 1]{label=$\bullet$, nosep, leftmargin=1em}
\setlist[itemize, 2]{label=$\circ$, nosep, leftmargin=1.5em}
\setlist[enumerate, 1]{nosep, leftmargin=1.5em}
\setlist[enumerate, 2]{nosep, leftmargin=2em}
\renewcommand{\tabularxcolumn}[1]{m{#1}}
%----------------------------------------------------------------------------%
