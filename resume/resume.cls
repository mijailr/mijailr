\ProvidesClass{resume}
\LoadClass[letterpaper,12pt]{article}

\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{babel}
\usepackage[stretch=10]{microtype}
\usepackage{hyperref}
\usepackage{xcolor}
\usepackage{trimspaces}
\usepackage{fontawesome}
\usepackage[left=1cm,top=1cm,right=1cm,bottom=1cm]{geometry}
\usepackage{graphicx}
\graphicspath{ {./images/} }

\pagestyle{empty}
\renewcommand{\familydefault}{\sfdefault}

\definecolor{teal}{RGB}{0, 128, 129}
\definecolor{defaultColor}{RGB}{52, 58, 64}
\color{defaultColor}

\newcommand*{\trim}[1]{%
  \trim@spaces@noexp{#1}%
}

\hypersetup{
    colorlinks={true},
    linkcolor={red!50!defaultColor},
    citecolor={blue!50!defaultColor},
    urlcolor={defaultColor},
    pdftitle={Resume}
}


% -----------------------
% Header details
% -----------------------

\def \name#1{\def\@name{#1}}
\def \@name {}

\def \location#1{\def\@location{#1}} 
\def \@location {}

\def \profileTitle#1{\def\@profileTitle{\trim{#1}}}
\def \@profileTitle {}

\def \email#1{\def\@email{\trim{#1}}}
\def \@email {}

\def \phone#1{\def\@phone{#1}} 
\def \@phone {}

\def \linkedin#1{\def\@linkedin{\trim{#1}}} 
\def \@linkedin {}

\def \github#1{\def\@github{\trim{#1}}}
\def \@github {}

\def \website#1{\def\@website{\trim{#1}}} 
\def \@website {}

\newcommand{\Link}[3]{
  \href {#1}
  {\textcolor{teal}{#2} \emph{#3}}
}
  
\newcommand\ProfilePicture[1]{%
  \begin{minipage}{0.3\textwidth}\raggedleft
    \includegraphics[width=3.8cm]{#1}
  \end{minipage}%
}

\def \printContact {
  \begingroup
    \Link{mailto:\@email}{\faEnvelope}{\@email}
    \Link{tel:\@phone}{\faPhone}{\@phone}
  \endgroup
  \par
  \smallskip
}

\def \printLinks {
  \begingroup
    \Link{https://github.com/\@github}{\faGithub}{\@github}
    \Link{https://linkedin.com/in/\@linkedin}{\faLinkedin}{\@linkedin}
    \Link{https://\@website}{\faLink}{\@website}
  \endgroup
  \par
  \smallskip
}
\def \printLocation {
  \begingroup
    \textcolor{teal}{\faMapMarker} \emph{\@location}
    \par
    \smallskip
  \endgroup
}

\def \printHeader {
  \begin{minipage}{0.7\textwidth}
    \huge{\bf{\@name}} \\\\
    \Large{\textcolor{teal}{\emph{\@profileTitle}}}
    \medskip \\
    \normalsize{
      \printContact
      \printLinks
      \printLocation
    }
  \end{minipage}%
  \ProfilePicture{profile}

}

% -----------------------
% Skills
% -----------------------

\newcommand{\Skill}[1]{
  % \tikzmarknode[inner sep=0.4em,rounded corners,fill=teal!100!]{A}{\color{white}{\textbf{#1}}}
  \color{teal}{\textbf{#1}}
}

% -----------------------
% Section
% -----------------------

\def \line{
    \linebreak\noindent\makebox[\linewidth]{\textcolor{teal}{\rule{\paperwidth}{0.8pt}}}
}

\newcommand{\SectionTitle}[1]{
  \begingroup
    \Large{\bf{#1}}
    \line
  \endgroup
}

% -----------------------
% Init document
% -----------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printHeader % Print header
}
