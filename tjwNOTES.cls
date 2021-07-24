\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{tjwNOTES}
    [2021/07/24 TimothyJWalton]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

\LoadClass[a4paper,bibliography=totoc]{scrartcl}

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

\makeatletter	
	\def\@maketitle{%
		\begin{center}
			\ifsections
				{\sffamily\bfseries\huge\@title} \\[1em]
				{\Large\@author} \\[0.5em]
				({\large\@date})
			\else
				{\sffamily\bfseries\Large\@title} \\[1em]
				{\large\@author} \\[0.5em]
				({\normalsize\@date})
			\fi
		\end{center}			
		\bigskip\bigskip
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
\makeatother

%%%%%%%%%%%%%%%%%%%%%%
%%%% Environments %%%%
%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
%%% EXAMPLE
    \definecolor{EGColor}{RGB}{255,133,12}
    \newtheorem*{@eg}{Example}
    \newenvironment{eg}
    {\begin{@eg}
        \def\FrameCommand
        {%
            {\color{EGColor!90!black}\vrule width 0.3em}%
            \hspace{0.em}%
            \fboxsep=\FrameSep\colorbox{EGColor!20}%
        }%
        \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
    }
    {%
        \endMakeFramed
        \end{@eg}
    }
%%% DEFINITION
    \definecolor{DefnColor}{RGB}{199,26,69}
    \newtheorem*{@defn}{Definition}
    \newenvironment{defn}
    {\begin{@defn}
        \def\FrameCommand
        {%
            {\color{DefnColor!90!black}\vrule width 0.3em}%
            \hspace{0.em}%
            \fboxsep=\FrameSep\colorbox{DefnColor!20}%
        }%
        \MakeFramed{\hsize\hsize\advance\hsize-\width\FrameRestore}%
    }
    {%
        \endMakeFramed
        \end{@defn}
    }
%%% THEOREM
    \definecolor{ThmColor}{RGB}{33,67,130}
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
    		{\color{ThmColor!90!black}\vrule width 0.3em}%
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
\makeatother


