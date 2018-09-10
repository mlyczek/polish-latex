\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{contract}[2018/01/30 Class for legislation contracts]

\RequirePackage[utf8]{inputenc}
\RequirePackage{ifthen}

\newboolean{@aneks}
\setboolean{@aneks}{false}

\newcommand*{\@ZawartaEnding}{a }

\DeclareOption{aneks}{\setboolean{@aneks}{true}\renewcommand*{\@ZawartaEnding}{ej }}
\ProcessOptions\relax

\LoadClass[12pt,a4paper,draft]{article}

\RequirePackage[margin=2.5cm, noheadfoot, nomarginpar]{geometry}
\RequirePackage[r.]{polski}
\RequirePackage{setspace}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Totally new commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\bold}{\fontseries{b}\selectfont}
\newcommand*{\textbold}[1]{{\bold #1}}

\newcommand*{\firstparty}[1]{\gdef\@firstparty{#1}}
\firstparty{}

\newcommand*{\secondparty}[1]{\gdef\@secondparty{#1}}
\secondparty{}

\newcommand*{\contractdate}[1]{\gdef\@contractdate{#1}}
\contractdate{\@date}

\newcommand*{\annexnumber}[1]{\gdef\@annexnumber{#1}}
\annexnumber{1}

\newcommand*{\contractpoint}[1]{\S#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Counters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{points}

\renewcommand*{\thepoints}{\S\arabic{points}}
\newcommand*{\point}{%
    \refstepcounter{points}%
    {\vspace{1em}\centering\thepoints\par\vspace{.3em}\noindent}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Amendments to article class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
    \begin{singlespace}%
        \begin{center}%
            \ifthenelse{\boolean{@aneks}}%
                {%
                    {\large \bold ANEKS nr \@annexnumber\par}%
                    zawarty w dniu \@date\par
                    \vspace{.5em}
                    do\par
                    \vspace{.5em}
                }{}%
            {\large \bold \MakeUppercase{\@title} \par}%
            zawart\@ZawartaEnding w dniu \@contractdate\par%
            \vspace{1em}%
            pomiędzy:%
        \end{center}%
    \end{singlespace}
    \noindent\@firstparty,%
    \begin{center}%
        a\par%
    \end{center}%
    \noindent\@secondparty,%
    \begin{center}%
        o treści następującej:
    \end{center}%
    \par
}

