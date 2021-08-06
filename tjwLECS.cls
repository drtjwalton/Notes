\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{tjwLECS}
    [2021/07/20 TimothyJWalton]

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
\RequirePackage[left=2.8cm,right=2.6cm,top=3.2cm,bottom=3.2cm,footskip=1cm,marginparwidth=1.8cm]{geometry}
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
\RequirePackage{setspace}
\RequirePackage{tikz} 		
	\usetikzlibrary{angles, arrows.meta, calc, decorations.markings, decorations.pathreplacing, patterns, positioning, quotes, shapes, shapes.geometric, shapes.misc, tikzmark, trees}
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
				{\hspace{-2cm}\sffamily\bfseries\Large\@institution}\\[1em]
				{\hspace{-2cm}\sffamily\Large\@date}\\[5em]
				\setlength{\fboxsep}{3em}
				\noindent\makebox[\textwidth][l]{	\hspace{-\dimexpr\oddsidemargin+1.63in}%
													\colorbox{TitleColour!50}{%
														\parbox{\dimexpr\paperwidth-1\fboxsep}{%
															\centering
															\begin{varwidth}{\dimexpr\textwidth-2\fboxsep}
																\centering\sffamily\bfseries\Huge\@title
															\end{varwidth}}
															}%
														}\\[10em]
			\hspace{-2cm}\includegraphics[height=3cm]{uclan.png} \\[1.8cm]			
			\iftjwonly
				\hspace{-1.2cm}
					\begin{tabular}{c}
						{\sffamily lectures notes by} \\[0.4em]
						{\sffamily\bfseries\Large Dr Timothy J. Walton} \\[0.8cm]
						\begin{tabular}{rl}
							{\sffamily o:} 	& {\sffamily Room ????} \\[0.3cm]
							{\sffamily e:} 	& {\sffamily \href{mailto:????@uclan.ac.uk}{????@uclan.ac.uk}} \\[0.3cm]
							{\sffamily t:} 	& {\sffamily $+44\; ????\; ??????$} \\[0.3cm]
							{\sffamily tw:}	& {\sffamily \href{https://twitter.com/drtjwalton}{@drtjwalton}} \\
						\end{tabular}
					\end{tabular}
			\else
				\hspace{-1.8cm}
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
%%% EXAMPLE
    \definecolor{EGColor}{RGB}{255,133,12}
	\newenvironment{eg}{
	    \def\FrameCommand
        {%
            {\color{EGColor!90!black}\vrule width 0.3em}%
            \hspace{0.em}%
    		\fboxsep=\FrameSep\colorbox{EGColor!20}%
        }%
        \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
		{\bf Example} \\[0.2cm] 
		}
    {%
        \endMakeFramed
    }       
%%% DEFINITION
    \definecolor{DefnColor}{RGB}{199,26,69}
	\newenvironment{defn}{
	    \def\FrameCommand
        {%
            {\color{DefnColor!90!black}\vrule width 0.3em}%
            \hspace{0.em}%
    		\fboxsep=\FrameSep\colorbox{DefnColor!20}%
        }%
        \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
		{\bf Definition}.
		}
    {%
        \endMakeFramed
    }    
%%% THEOREM
    \definecolor{ThmColor}{RGB}{0,127,176}
    \newcounter{thmcounter}
    \newenvironment{thm}[1]{
	    \refstepcounter{thmcounter}
	    \def\@currentlabel{\arabic{thmcounter}}
        \def\FrameCommand
        {%
            {\color{ThmColor!75!black}\vrule width 0.3em}%
            \hspace{0.em}%
    		\fboxsep=\FrameSep\colorbox{ThmColor!15}%
        }%
        \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
	    \ifstrempty{#1}{%
		    			{\bf Theorem\;\@currentlabel} \\[0.2cm] }{%
					    {\bf Theorem\;\@currentlabel} \; (#1) \\[0.2cm] }
	    }
    {%
        \endMakeFramed
    }
%%% PROOF  
    \renewenvironment{proof}
    {	\vspace{-0.6cm}
    	\def\FrameCommand
        {%
    		{\color{ThmColor!90!black}\vrule width 0.34em}%
            \hspace{-0.5em}%
    		\setlength{\fboxrule}{1pt}
            \fboxsep=\FrameSep\fcolorbox{ThmColor}{white}%
        }%
    	\MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
    	{\bf Proof:}
    }
    {	\qed
        \endMakeFramed	%
    }
%%% THEOREM* (NON-NUMBERED)
    \newenvironment{thm*}[1]{
        \def\FrameCommand
        {%
            {\color{ThmColor!75!black}\vrule width 0.3em}%
            \hspace{0.em}%
    		\fboxsep=\FrameSep\colorbox{ThmColor!15}%
        }%
        \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
	    \ifstrempty{#1}{%
		    			{\bf Theorem} \\[0.2cm] }{%
					    {\bf Theorem} \; (#1) \\[0.2cm] }
	    }
    {%
        \endMakeFramed
    }
%%% PROPOSITION
    \newenvironment{prop}[1]{
    	\refstepcounter{thmcounter}
    	\def\@currentlabel{\arabic{thmcounter}}
        \def\FrameCommand
        {%
            {\color{ThmColor!75!white}\vrule width 0.3em}%
            \hspace{0.em}%
    		\fboxsep=\FrameSep\colorbox{ThmColor!20}%
        }%
        \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
    	\ifstrempty{#1}{%
    					{\bf Proposition\;\@currentlabel} \\[0.2cm] }{%
    					{\bf Proposition\;\@currentlabel} \; (#1) \\[0.2cm] }
    	}
    {%
        \endMakeFramed
    }
%%% PROPOSITION* (NON-NUMBERED)
    \newenvironment{prop*}[1]{
    	\def\FrameCommand
        {%
            {\color{ThmColor!75!black}\vrule width 0.3em}%
            \hspace{0.em}%
    		\fboxsep=\FrameSep\colorbox{ThmColor!20}%
        }%
        \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
    	\ifstrempty{#1}{%
    					{\bf Proposition} \\[0.2cm] }{%
    					{\bf Proposition} \; (#1) \\[0.2cm] }
    	}
    {%
        \endMakeFramed
    }
%%% LEARNING OBJECTIVES 
	\newenvironment{lobjs}
    {	\vspace{-0.6cm}
    	\def\FrameCommand
        {%
    		{\color{ThmColor!90!black}\vrule width 0.6em}%
            \hspace{-0.5em}%
    		\setlength{\fboxrule}{1pt}
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
%%% SOLUTION 
    \newenvironment{soln}{%
		\par\bigskip
		\noindent
		{\scriptsize \bf\MakeUppercase{Solution}}:
		\leftskip=0.6cm\rightskip=0.6cm
		}{	\par\medskip
			}
%%% NB (NOTE) 
    \newenvironment{nb}{%
		\par\bigskip
		\noindent
		\underline{\bf NB}:
		\leftskip=1cm\rightskip=0em\itshape
		}{\par\medskip}
\makeatother

