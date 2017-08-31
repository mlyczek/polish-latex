\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{formal}[2017/08/04 Formal latex class]

\LoadClass[12pt,a4paper,draft]{letter}

\RequirePackage[margin=2.5cm, noheadfoot, nomarginpar]{geometry}

\renewcommand*{\baselinestretch}{2}

\longindentation=.6\textwidth
\newdimen\indentedwidth
\indentedwidth=\textwidth
\advance\indentedwidth -\longindentation

\renewcommand*{\opening}[1]{\ifx\@empty\fromaddress
  \thispagestyle{firstpage}%
    {\raggedleft\@date\par}%
  \else  % home address
    \thispagestyle{empty}%
    \begin{minipage}[t]{0.45\textwidth}\fromsig\\ \fromaddress\end{minipage}%
    \hfill%
    \begin{minipage}[t]{0.45\textwidth}\raggedleft\@date\end{minipage}%
    \par%
  \fi
  \ifx\@empty\toaddress\else
    \vfill%
    \hspace*{\longindentation}%
    \parbox{\indentedwidth}{\raggedright \toname \\ \toaddress \par}%
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
