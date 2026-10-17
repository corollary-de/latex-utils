\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{documentation}

\LoadClass[a4paper,11pt]{article}

\RequirePackage[
	a4paper,
	left=2cm,
	right=2cm,
	bottom=2cm,
	top=3cm,
	headheight=1cm,
	headsep=1cm,
]{geometry}

\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage[T1]{fontenc}
\RequirePackage[sfdefault]{FiraSans}
\RequirePackage{fancyhdr}


\newcommand{\subtitleValue}{}
\newcommand{\subtitle}[1]{\renewcommand{\subtitleValue}{#1}}

\newcommand{\iconValue}{}
\newcommand{\icon}[1]{\renewcommand{\iconValue}{#1}}

\newcommand{\smalliconValue}{}
\newcommand{\smallicon}[1]{\renewcommand{\smalliconValue}{#1}}

\def\sectionname{}
\renewcommand{\sectionmark}[1]{\ifx\sectionname\empty \def\sectionname{#1} \else \edef\sectionname{\sectionname$\;$\textbullet$\;$#1} \fi}


\sffamily

\pagestyle{fancy}
\fancyhfoffset{0.5cm}
\fancyhfinit{\sffamily}

\makeatletter
\fancyhead[L]{
	\ifx\smalliconValue\empty
		\if\iconValue\empty\else
			\includegraphics[height=\baselineskip]{\iconValue}
		\fi
	\else
		\includegraphics[height=\baselineskip]{\smalliconValue}
	\fi
	\textsc{\small \@title}
}
\makeatother
\fancyhead[C]{\textsc{\large \textbf{\sectionname}}\gdef\sectionname{}}
\fancyhead[R]{\textbf{\normalsize \thepage}}


\makeatletter
\renewcommand{\maketitle}{
	\newsavebox{\titlebox}
	\savebox{\titlebox}{
		\begin{minipage}[t]{0.6\textwidth}
			\centering
			\raggedright
			\Huge \textbf{\@title}\\
			\Large \textbf{\subtitleValue{}}\\
			\normalsize \textbf{\scalebox{1.2}{\raisebox{-0.15em}{\copyright}}\textsc{\;\@date\;\@author}}
		\end{minipage}
	}

	\ifx\iconValue\empty
		\begin{minipage}[c]{0.8\textwidth}
			\usebox{\titlebox}
		\end{minipage}
	\else
		\newlength{\heightoftitlebox}
		\settototalheight{\heightoftitlebox}{\usebox{\titlebox}}

		\newsavebox{\imagebox}
		\sbox{\imagebox}{
			\centering
			\includegraphics[height=\heightoftitlebox+2ex]{\iconValue}
		}
		\newlength{\widthofimage}
		\settowidth{\widthofimage}{\usebox{\imagebox}}

		\begin{minipage}[c]{\widthofimage}
			\usebox{\imagebox}
		\end{minipage}
		\begin{minipage}[c]{0.8\textwidth - \widthofimage}
			\usebox{\titlebox}
		\end{minipage}
	\fi
}
\makeatother
