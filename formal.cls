\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{formal}[2017/08/04 Formal latex class]

\DeclareOption{wide}{
    \PassOptionsToPackage{margin=1.5cm}{geometry}
}

\DeclareOption{normal}{
    \PassOptionsToPackage{margin=2.5cm}{geometry}
}

\DeclareOption*{
    \ClassWarning{formal}{Unknown option '\CurrentOption'}
}

\ExecuteOptions{normal}

\ProcessOptions\relax

\LoadClass[12pt,a4paper,draft]{letter}

\RequirePackage[noheadfoot, nomarginpar]{geometry}
\RequirePackage{setspace}

\renewcommand*{\baselinestretch}{2}

\newcommand*{\personalinfo}[1]{\def\frompersonalinfo{#1}}
\newcommand*{\place}[1]{\def\fromplace{#1}}
\personalinfo{}
\place{}

\renewcommand{\ccname}{Do wiadomości}

\longindentation=.6\textwidth
\newdimen\indentedwidth
\indentedwidth=\textwidth
\advance\indentedwidth -\longindentation

\renewcommand*{\opening}[1]{\ifx\@empty\fromaddress
  \thispagestyle{firstpage}%
    {\raggedleft\@date\par}%
  \else  % home address
    \thispagestyle{empty}%
    \begin{minipage}[t]{0.45\textwidth}%
        \setstretch{1.2}\fromsig\\ \fromaddress%
        \ifx\@empty\frompersonalinfo\else
        \\ \frompersonalinfo
        \fi
    \end{minipage}%
    \hfill%
    \begin{minipage}[t]{0.45\textwidth}%
        \ifx\@empty\fromplace
            \raggedleft\@date
        \else
            \raggedleft\fromplace, \@date
        \fi
    \end{minipage}%
    \par%
  \fi
  \ifx\@empty\toaddress\else
    \vfill%
    \hspace*{\longindentation}%
    \parbox{\indentedwidth}{\setstretch{1.2}\raggedright \toname \\ \toaddress \par}%
  \fi
  \vfill%
  \begin{center}\Large\textbf{\MakeUppercase{#1}}\end{center}\par\vspace{3\parskip}}

\renewcommand*{\closing}[1]{\par\nobreak\vspace{6\parskip}%
  \stopbreaks
  \noindent
  \hspace*{\longindentation}%
  \parbox{\indentedwidth}{\raggedright
       \ignorespaces #1\\[6\medskipamount]%
       \ifx\@empty\fromsig
           \fromname
       \else \fromsig \fi\strut}%
   \par\vfill}

