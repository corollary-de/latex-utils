\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[Homework LaTeX class]

%\DeclareOption{optname}{cmd}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}	% forward all other opts
\ProcessOptions\relax

\LoadClass[a4paper,11pt]{article}

\RequirePackage[english,ngerman]{babel}
\RequirePackage{textcomp}
\RequirePackage{fontspec}


\RequirePackage[
	a4paper,
	left=3cm,
	right=3cm,
	top=1cm,
	bottom=1.5cm,
	headheight=1cm,
	headsep=1.5cm,
	includeheadfoot,
	heightrounded,
]{geometry}

\RequirePackage{fancyhdr}

\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{array}

\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}m{#1}}

\RequirePackage{amsfonts}
\RequirePackage{amsmath}

\RequirePackage{pythonhighlight}
\lstset{
    inputencoding=utf8,
    extendedchars=true,
}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{automata, positioning, arrows, shapes.geometric, calc, patterns}
\tikzset{
	node distance=2cm,
	every state/.style={thick, fill=gray!10, anchor=center},
	dot/.style = {circle, fill, minimum size=#1, inner sep=0pt, outer sep=0pt},
	dot/.default = 6pt
}



\newcommand{\Mat}[1]{\begin{matrix}#1\end{matrix}}
\newcommand{\mat}[1]{\begin{smallmatrix}#1\end{smallmatrix}}
\newcommand{\rMat}[1]{\left(\Mat{#1}\right)}
\newcommand{\rmat}[1]{\left(\mat{#1}\right)}
\def\dotminus{\mathbin{\ooalign{\hss\raise1ex\hbox{.}\hss\cr
  \mathsurround=0pt$-$}}}
\newcommand{\coin}{\overset{{\scriptscriptstyle\$}}{\leftarrow}}


\makeatletter
\newcommand{\@course}{}
\newcommand{\@task}{}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\task}[1]{\renewcommand{\@task}{#1}}
\makeatother


\makeatletter
\renewcommand{\maketitle}{
	\fancyhead[HC]{\Large\textsc{\@course}}
	\fancyhead[HL]{\@date}
	\fancyhead[HR]{\textsc{\@task}}
	\fancyfoot{}
	\begingroup
	\ifx\@title\empty
	\else
	\begin{center}
		\LARGE
		\textbf{\@title}
	\end{center}
	\fi
	\vspace{-1em}
	\noindent
	\@author
	\endgroup
}
\makeatother

\AtBeginDocument{\thispagestyle{fancy}}
\AtBeginDocument{\title{}}

\pagestyle{fancy}
\fancyhfoffset{1cm}

\setcounter{MaxMatrixCols}{100}

