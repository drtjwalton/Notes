\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{tjwLECS}
    [2022/01/20 TimothyJWalton]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax

\LoadClass[	a4paper,
			bibliography=totoc,
			titlepage=false,
			chapterprefix=true
			]{scrreprt}
			
	\renewcommand*{\raggedchapter}{\raggedleft}
	\RedeclareSectionCommand[	innerskip=4pt,
								prefixfont=\LARGE
								]{chapter}
	\addtokomafont{chapter}{\Huge} 
	\renewcommand*\chapterlineswithprefixformat[3]{	\ifstr{#1}{chapter}
														{\MakeUppercase{#2}#3}
														{#2#3}
													}
%\DeclareTOCStyleEntry[beforeskip=0.5cm]{chapter}{chapter}

\renewcommand{\familydefault}{\sfdefault}

\makeatletter
    \DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
    \DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
    \DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
    \DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
    \DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
    \DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
    \DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\makeatother

%%% CREATE COMMAND FOR HARDSECTION: A SECTION WITH AN AFTER THE NUMBER
\DeclareNewSectionCommand[
    afterskip=1.5ex plus .2ex,
    beforeskip=-3.25ex plus -1ex minus -.2ex,
    indent=0pt,
    level=1,
    font=\usekomafont{section},
    tocindent=1.5em,
    tocnumwidth=2.3em,
    counterwithin=chapter,
	style=section,
	tocstyle=section
	]{hardsection}
\makeatletter
	\let\c@hardsection\c@section
	\@addtoreset{subsection}{hardsection}
\makeatother
\renewcommand{\thehardsection}{\arabic{chapter}.\arabic{section}*}

%%%%%%%%%%%%%%%%%%
%%%% Packages %%%%
%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm} 
    \renewcommand{\qedsymbol}{$\blacklozenge$}
\RequirePackage{array}		% Custom array definitions
	\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
	\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
	\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\RequirePackage{bm}
\RequirePackage[open,openlevel=2]{bookmark}	
\RequirePackage[thicklines]{cancel}
\RequirePackage{enumitem} 
	\newlist{LOBJS}{itemize}{1}
	\setlist[LOBJS,1]{	leftmargin=1.2cm,
						label={$\blacktriangleright$}
						}
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage{framed} 
\RequirePackage[left=2.4cm,right=2.2cm,top=2.2cm,bottom=2.2cm,footskip=1cm,marginparwidth=1.8cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{marginnote}
    \reversemarginpar
    \renewcommand*{\marginfont}{\color{red}\footnotesize}
\RequirePackage{mathtools}
    \mathtoolsset{
		showonlyrefs=true 
		}
\RequirePackage[framemethod=TikZ]{mdframed} 
\RequirePackage{multirow}
\RequirePackage{pgfplots}	
	\pgfplotsset{compat=1.17}
	\usepgfplotslibrary{fillbetween}
\RequirePackage{setspace}
\RequirePackage{tikz} 		
	\usetikzlibrary{angles, arrows.meta, calc, decorations.markings, decorations.pathreplacing, patterns, positioning, quotes, shapes, shapes.geometric, shapes.misc, tikzmark, trees, intersections}
	\tikzset{middlearrow/.style={	decoration={markings,
									mark= at position 0.55 with {\arrow[scale=1.6]{#1}} ,
									},
									postaction={decorate}
								}
			}
	\tikzset{beginarrow/.style={	decoration={markings,
									mark= at position 0.15 with {\arrow[scale=1.6]{#1}} ,
									},
									postaction={decorate}
								}
			}
	\tikzset{toarrow/.style={	decoration={markings,
									mark= at position #1 with {\arrow[scale=1.6]{to}} ,
									},
									postaction={decorate}
								}
			}
	\tikzset{	cross/.style={cross out, draw=black, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt}, 
				cross/.default={3pt}
				}
\RequirePackage{totcount}
\RequirePackage{varwidth}
\RequirePackage{xcolor} 
\RequirePackage{hyperref} 	
	\hypersetup{    colorlinks,
		            linkcolor={red!50!black},
		            citecolor={blue!50!black},
		            urlcolor={blue!80!black}, 
		            pdfstartview={XYZ null null 1},
		            bookmarksnumbered
		            }
		            
%%%%%%%%%%%%%%%%%%%%
%%%% Page Style %%%%
%%%%%%%%%%%%%%%%%%%%	
\setlength{\parindent}{0cm}
\RequirePackage[autooneside=false,automark,headsepline]{scrlayer-scrpage}
	\setkomafont{section}{\LARGE\sffamily\bfseries}
	\RedeclareSectionCommand[   afterskip=0.2cm,
	                            beforeskip=1cm]{section}

	\clearpairofpagestyles
	\ihead{\leftmark}
	\ohead{\ifstr{\leftmark}{\rightmark}{}{\rightmark}}
	\addtokomafont{pagehead}{\sf\upshape}
	\cfoot*{\thepage}
	\addtokomafont{pagefoot}{\upshape}
	\makeatletter
		\newcommand*\addsubsec{\secdef\@addsubsec\@saddsubsec}
		\newcommand*{\@addsubsec}{}
		\def\@addsubsec[#1]#2{\subsection*{#2}\addcontentsline{toc}{subsection}{#1}
			\if@twoside\ifx\@mkboth\markboth\markright{#1}\fi\fi
		}
		\newcommand*{\@saddsubsec}[1]{\subsection*{#1}\@mkboth{}{}}
	\makeatother
	
%%%%%%%%%%%%%%%%%%%%
%%%% TITLE PAGE %%%%
%%%%%%%%%%%%%%%%%%%%
\newif\iftjwonly
\tjwonlyfalse
\DeclareOption{tjwonly}{\tjwonlytrue}
\ProcessOptions\relax

\makeatletter
	\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}} 

	\newcommand{\institution}[1]{\gdef\@institution{#1}}
	\def\@institution{\@latex@warning@no@line{No \noexpand\institution given.}}
	\definecolor{TitleColour}{RGB}{0,127,176}

	\def\@maketitle{%
		\begin{center}
			\begin{tabular}{c}
				{\hspace{-0.5cm}\sffamily\bfseries\Large\@institution}\\[1em]
				{\hspace{-0.5cm}\sffamily\Large\@date}\\[5em]
				\setlength{\fboxsep}{3em}
				\noindent\makebox[\textwidth][l]{	\hspace{-\dimexpr\oddsidemargin+1.4in}%
													\colorbox{TitleColour!50}{%
														\parbox{\dimexpr\paperwidth-1\fboxsep}{%
															\centering
															\begin{varwidth}{\dimexpr\textwidth-1\fboxsep}
																\centering\sffamily\bfseries\Huge\@title
															\end{varwidth}}
															}%
														}\\[10em]
			\hspace{-0.5cm}\includegraphics[height=3cm]{uclan.png} \\[1.8cm]			
			\iftjwonly
				\hspace{-0.5cm}
					\begin{tabular}{c}
						{\sffamily lectures notes by} \\[0.4em]
						{\sffamily\bfseries\Large Dr Timothy J. Walton} \\[0.8cm]
						\begin{tabular}{rl}
							{\sffamily o:} 	& {\sffamily LE116} \\[0.1cm]
							{\sffamily e:} 	& {\sffamily \href{mailto:twalton@uclan.ac.uk}{twalton@uclan.ac.uk}} \\[0.1cm]
							{\sffamily t:} 	& {\sffamily +44\; 1772\; 894023} \\[0.1cm]
							{\sffamily tw:}	& {\sffamily \href{https://twitter.com/drtjwalton}{@drtjwalton}} \\
						\end{tabular}
					\end{tabular}
			\else
				\hspace{-0.5cm}
					\begin{tabular}{c}
						{\sffamily lectures notes by} \\[0.4em]
						{\sffamily\bfseries\Large\@author}
					\end{tabular}
			\fi	
        \end{tabular}
        \vspace{0.4em}
    \end{center}
	\newpage
	}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Command definitions %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
    \newcommand{\id}{\text{id}} 
    \DeclareMathOperator{\Exists}{\exists} 
    \DeclareMathOperator{\Forall}{\forall} 	
    \newcommand{\st}{\;\operatorname{:}\;}
    \newcommand{\RR}{\mathbb{R}} 		
    \newcommand{\NN}{\mathbb{N}} 		
    \newcommand{\ZZ}{\mathbb{Z}} 		
    \newcommand{\QQ}{\mathbb{Q}} 		
    \newcommand{\CC}{\mathbb{C}} 		
    \newcommand\tensor{\otimes}	
    \newcommand\w{\wedge}	
    \newcommand\Lie{\mathcal{L}}
    \newcommand\wh[1]{\widehat{#1}}
    \newcommand\wt[1]{\widetilde{#1}}
    \newcommand\conj[1]{\overline{#1}}	
    \newcommand\df{\frac{}{}} 		
    \newcommand\QUAD[1]{\quad\text{#1}\quad}	
    \newcommand\QQUAD[1]{\qquad\text{#1}\qquad}
    \newcommand\LRA{\Longrightarrow}			
    \newcommand\LLRA{\Longleftrightarrow}
    \newcommand\lra{\longrightarrow}
    \newcommand\qLRA{\quad\LRA\quad}	
    \newcommand\qLLRA{\quad\LLRA\quad}
    \newcommand\qqLRA{\qquad\LRA\qquad}	
    \newcommand\qqLLRA{\qquad\LLRA\qquad}
    \newcommand\ds{\displaystyle}
    \newcommand\union{\cup}
    \newcommand\intersect{\cap}
    \newcommand\TWOSQMATRIX[4]{	\begin{pmatrix*}[r]
	    							#1	&	#2	\\[0.1cm]
		    						#3	&	#4
			    				\end{pmatrix*}					
				    			}
    \newcommand\THREESQMATRIX[9]{	\begin{pmatrix*}[r]
    									#1	&	#2	&	#3	\\[0.1cm]
    									#4	&	#5	&	#6	\\[0.1cm]
    									#7	&	#8	&	#9	
    								\end{pmatrix*}					
    								}
    \newcommand\TWOTHREEMATRIX[6]{	\begin{pmatrix*}[r]
    									#1	&	#2	&	#3	\\[0.1cm]
    									#4	&	#5	&	#6	
    								\end{pmatrix*}					
    								}
    \newcommand\THREETWOMATRIX[6]{	\begin{pmatrix*}[r]
    									#1	&	#2 	\\[0.1cm]
    									#3	&	#4 	\\[0.1cm]
    									#5	&	#6 
    								\end{pmatrix*}					
    								}
    \newcommand\TWOONEMATRIX[2]{	\begin{pmatrix*}[r]
    									#1	\\[0.1cm]
    									#2
    								\end{pmatrix*}					
    								}
    \newcommand\THREEONEMATRIX[3]{	\begin{pmatrix*}[r]
    									#1	\\[0.1cm]
    									#2	\\[0.1cm]
    									#3
    								\end{pmatrix*}					
    								}
    \newcommand\TWOVEC[2]{	\begin{pmatrix*}[r]
    							#1	\\[0.1cm]
    							#2
    						\end{pmatrix*}					
    						}				
    \newcommand\THREEVEC[3]{\begin{pmatrix*}[r]
    							#1	\\[0.1cm]
    							#2	\\[0.1cm]
    							#3
    						\end{pmatrix*}					
    						}		
    \definecolor{cancol}{RGB}{190,22,34}
	\renewcommand\CancelColor{\color{cancol}}		
\makeatother

%%%%%%%%%%%%%%%%%%%%%%
%%%% Environments %%%%
%%%%%%%%%%%%%%%%%%%%%%
\makeatletter

%%% EXAMPLE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\definecolor{EGColor}{RGB}{255,133,12}
	\newcounter{eg}[section]\setcounter{eg}{0}
	\renewcommand{\theeg}{\arabic{section}.\arabic{eg}}
	\newenvironment{eg}[1][]{%
	\refstepcounter{eg}%
		\ifstrempty{#1}%
		{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
								\node[anchor=east,rectangle, fill=white, draw=EGColor!40,line width=1.4pt, rounded corners]
								{\strut Example~\theeg};}}
		}%
		{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
								\node[anchor=east,rectangle, fill=white, draw=EGColor!40,line width=1.4pt,rounded corners]
								{\strut Example~\theeg:~#1};}}%
		}%
		\mdfsetup{	innertopmargin=10pt,linecolor=EGColor!50,
					linewidth=1.4pt,topline=true,
					backgroundcolor=EGColor!20, roundcorner=8pt,
					frametitleaboveskip=\dimexpr-\ht\strutbox\relax
					}
		\begin{mdframed}[]
		\def\gapcolor{EGColor!20}\relax%
		}{\end{mdframed}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% DEFINITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\definecolor{DefnColor}{RGB}{199,26,69}
	\newcounter{defn}[section]\setcounter{defn}{0}
	\renewcommand{\thedefn}{\arabic{section}.\arabic{defn}}
	\newenvironment{defn}[1][]{%
	\refstepcounter{defn}%
	\ifstrempty{#1}%
	{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
							\node[anchor=east,rectangle,fill=white, line width=1.4pt,rounded corners]
							{\strut Definition~\thedefn};}}
	}%
	{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
							\node[anchor=east,rectangle,fill=white, draw=DefnColor!40,line width=1.4pt,rounded corners]
							{\strut Definition~\thedefn:~#1};}}%
	}%
	\mdfsetup{	innertopmargin=10pt,linecolor=DefnColor!40,
				linewidth=1.4pt,topline=true,
				backgroundcolor=DefnColor!20, roundcorner=8pt,
				frametitleaboveskip=\dimexpr-\ht\strutbox\relax
				}
	\begin{mdframed}[]
	\def\gapcolor{DefnColor!20}\relax%
	}{\end{mdframed}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%%% THEOREM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \definecolor{ThmColor}{RGB}{0,127,176}
	\newcounter{thm}[section]\setcounter{thm}{0}
	\renewcommand{\thethm}{\arabic{section}.\arabic{thm}}
	\newenvironment{thm}[1][]{%
	\refstepcounter{thm}%
	\ifstrempty{#1}%
	{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
							\node[anchor=east,rectangle,fill=white, draw=ThmColor!40,line width=1.4pt,rounded corners]
							{\strut Theorem~\thethm};}}
	}%
	{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
							\node[anchor=east,rectangle,fill=white, draw=ThmColor!40,line width=1.4pt,rounded corners]
							{\strut Theorem~\thethm:~#1};}}%
	}%
	\mdfsetup{	innertopmargin=10pt,linecolor=ThmColor!40,
				linewidth=1.4pt,topline=true,
				backgroundcolor=ThmColor!20, roundcorner=8pt,
				frametitleaboveskip=\dimexpr-\ht\strutbox\relax
				}
	\begin{mdframed}[]
	\def\gapcolor{ThmColor!20}\relax%
	}{\end{mdframed}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% THEOREM* (NON-NUMBERED) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\newenvironment{thm*}[1][]{%
	\ifstrempty{#1}%
	{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
							\node[anchor=east,rectangle,fill=white, draw=ThmColor!40,line width=1.4pt,rounded corners]
							{\strut Theorem};}}
	}%
	{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
							\node[anchor=east,rectangle,fill=white, draw=ThmColor!40,line width=1.4pt,rounded corners]
							{\strut Theorem:~#1};}}%
	}%
	\mdfsetup{	innertopmargin=10pt,linecolor=ThmColor!40,
				linewidth=1.4pt,topline=true,
				backgroundcolor=ThmColor!20, roundcorner=8pt,
				frametitleaboveskip=\dimexpr-\ht\strutbox\relax
				}
	\begin{mdframed}[]
	\def\gapcolor{ThmColor!20}\relax%
	}{\end{mdframed}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% PROOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\renewenvironment{proof}[1][]{%
	\mdfsetup{	hidealllines=true,
				singleextra={\draw[line width=1.4pt,rounded corners=8pt,color=ThmColor!40] (O) -- (O-|P) -- (P) -- (P-|O);
				\draw[line width=4pt,color=ThmColor!50] (O) -- (P-|O);}
				}
	\begin{mdframed}[]
	\def\gapcolor{white}\relax%
	{\bf Proof:}
	}{	\qed
		\end{mdframed}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% LEARNING OBJECTIVES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\newenvironment{lobjs}
    {	\vspace{-0.6cm}
    	\def\FrameCommand
        {%
    		{\color{ThmColor!90!black}\vrule width 1em}%
            \hspace{-0.5em}%
    		\setlength{\fboxrule}{1.6pt}
            \fboxsep=\FrameSep\fcolorbox{ThmColor}{white}%
        }%
    	\MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
    	Following completion of this chapter, you should be able to:
    	\begin{LOBJS}
    }
    {	\end{LOBJS}
		\vspace{-0.2cm}
        \endMakeFramed	%
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% SOLUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \newenvironment{soln}{%
		\par\bigskip
		\noindent
		{\scriptsize \bf\MakeUppercase{Solution}}:
		\leftskip=0.6cm\rightskip=0.6cm
		}{	\par\medskip
			}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% REMARK %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\newcounter{rem}[section]\setcounter{rem}{0}
	\renewcommand{\therem}{\arabic{section}.\arabic{rem}}
	\newenvironment{remark}[1][]{%
	\refstepcounter{rem}%
	\ifstrempty{#1}%
	{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
							\node[anchor=east,rectangle,fill=white, rounded corners]
							{\strut $\bigstar$ Remark~\therem};}}
	}%
	{\mdfsetup{frametitle={	\tikz[baseline=(current bounding box.east),outer sep=0pt]
							\node[anchor=east,rectangle,fill=white,rounded corners]
							{\strut$\bigstar$ Remark~\therem:~#1};}}%
	}%
	\mdfsetup{	innertopmargin=6pt,linecolor=black,
				linewidth=1.4pt,topline=true,
				backgroundcolor=white, roundcorner=8pt,
				frametitleaboveskip=\dimexpr-\ht\strutbox\relax
				}
	\begin{mdframed}[]\relax%
	}{\end{mdframed}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% GAPPED %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifgapped
\gappedfalse
\DeclareOption{gapped}{\gappedtrue}
\ProcessOptions\relax

\ifgapped
	\def\gapcolor{white}
	\newenvironment{gap}[1][]{%
	\begin{flushleft}
	\begingroup\color{\gapcolor}\relax%
	}{\endgroup\end{flushleft}}
\else
	\newenvironment{gap}[1][]{%
	\begin{flushleft}
	\begingroup\color{black}\relax%
	}{\endgroup\end{flushleft}}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatother





