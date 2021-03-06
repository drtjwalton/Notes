\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{tjwNOTES}
    [2022/02/15 TimothyJWalton]

% OPTIONS: sections, nodate
	
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

\tolerance=1
\hyphenpenalty=10000
\hbadness=10000

\LoadClass[a4paper,bibliography=totoc,toc=sectionentrywithdots]{scrartcl}

\renewcommand{\familydefault}{\sfdefault}
\renewcommand{\abstractname}{\vspace{-\baselineskip}}

\makeatletter
    \DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
    \DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
    \DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
    \DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
    \DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
    \DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
    \DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\makeatother

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
\usepackage[greek,english]{babel}
\RequirePackage{bm}
\RequirePackage[open,openlevel=2]{bookmark}	
\RequirePackage{enumitem} 
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage{framed} 
\RequirePackage[left=2.8cm,right=2.6cm,top=3.2cm,bottom=3.2cm,footskip=1cm,marginparwidth=1.8cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{marginnote}
    \reversemarginpar
    \renewcommand*{\marginfont}{\color{red}\footnotesize}
\RequirePackage{mathtools}
\RequirePackage[framemethod=TikZ]{mdframed} 
\RequirePackage{pdfpages}
\RequirePackage{pgfplots}	
	\pgfplotsset{compat=1.17}
\RequirePackage{setspace}
\RequirePackage{tikz} 		
	\usetikzlibrary{angles, arrows.meta, calc, decorations.markings, decorations.pathreplacing, patterns, positioning, quotes, shapes, shapes.geometric, shapes.misc, tikzmark, trees, intersections, fillbetween}
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
\RequirePackage{transparent}
\RequirePackage{xcolor} 
\RequirePackage{xifthen}
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
\RequirePackage[autooneside=false,automark]{scrlayer-scrpage}
	\setkomafont{section}{\LARGE\sffamily\bfseries}
	\setkomafont{date}{\normalsize}
	\RedeclareSectionCommand[   afterskip=0.2cm,
	                            beforeskip=1cm]{section}

	\clearpairofpagestyles
	%\ihead{\leftmark}
	%\ohead{\ifstr{\leftmark}{\rightmark}{}{\rightmark}}
	%\addtokomafont{pagehead}{\sf\upshape}
	\cfoot*{\thepage}
	\addtokomafont{pagefoot}{\upshape}
	%\makeatletter
	%	\newcommand*\addsubsec{\secdef\@addsubsec\@saddsubsec}
	%	\newcommand*{\@addsubsec}{}
	%	\def\@addsubsec[#1]#2{\subsection*{#2}\addcontentsline{toc}{subsection}{#1}
	%		\if@twoside\ifx\@mkboth\markboth\markright{#1}\fi\fi
	%	}
	%	\newcommand*{\@saddsubsec}[1]{\subsection*{#1}\@mkboth{}{}}
	%\makeatother
	
%%%%%%%%%%%%%%%%%%%%
%%%% TITLE PAGE %%%%
%%%%%%%%%%%%%%%%%%%%
\newif\ifsections
\sectionsfalse
\DeclareOption{sections}{\sectionstrue}
\ProcessOptions\relax

\newif\ifnodate
\nodatefalse
\DeclareOption{nodate}{\nodatetrue}
\ProcessOptions\relax


\renewenvironment{abstract}{\small	\begin{center}
										\bfseries \vspace{-.5em}\vspace{0pt}
									\end{center}
									\quote
									}
									{\endquote}

\makeatletter	
	\def\@maketitle{%
		\begin{center}
			\ifsections
				\begin{spacing}{1.2}
					\sffamily\bfseries\huge\@title
				\end{spacing} 
				{\Large\@author} \\[0.5em]
				\ifnodate
				\else
					({\large\@date})
				\fi
			\else
				\begin{spacing}{1.2}
					\sffamily\bfseries\Large\@title
				\end{spacing}
				{\large\@author} \\[0.5em]
				\ifnodate
				\else
					({\normalsize\@date})
				\fi
			\fi
		\end{center}			
  	}
\makeatother
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Command definitions %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\g}{\texttt{g}}
\newcommand{\etaT}{\text{\large\begin{otherlanguage}{greek}\texttt{\texteta}\end{otherlanguage}}}
\newcommand{\M}{\mathcal{M}}
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
\newcommand\lra{\longrightarrow}
\newcommand\qLRA{\quad\Longrightarrow\quad}	
\newcommand\qLLRA{\quad\Longleftrightarrow\quad}
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
\newcommand{\incfig}[2]{\def\svgwidth{\columnwidth}\import{#1}{#2.pdf_tex}}
    
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

\makeatother



