#!/usr/bin/env perl
###################################################################
##
## Copyright (C) 2013  Ralf Hemmecke <ralf@hemmecke.org>
##
###################################################################
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
###################################################################
## Usage:
##    perl aldoc2html.pl libaldor
##
## The file reads libaldor.tex and all the \include files. Each line
## is transformed in such a way that it fits for latex2html.
## Output is sent to stdout.
###################################################################

$THIS = "";
$NAME = "";
$EXPORTS = "exports";

include($ARGV[0]);

sub include {
    my($filename)=@_;
    print STDERR "=== $filename ===\n";
    open(my $fh, "<", "$filename.tex") || die "cannot open $filename.tex";
    while(my $line=<$fh>){
        if ($line =~ /^\\documentclass.*{aldoc}/) {
            print "\\documentclass{article}\n";
            print_aldocmacros();
        } elsif ($line =~ /^\\input.(.*)/) {
            my $fn = $1;
            $fn =~ s/}$//;
            include($fn)
        } else {
            print transform($line)
        }
    }
    close $fh
}

sub transform {
    my($line) = @_;
    if ($line =~ /^\\thistype{(.*)}/) {$THIS=$1; return "$line"}
    if ($line =~ /^\\a(l|s)page{(.*)}/) {
        $NAME=$2;
        return "$line\\alhtmltarget{$THIS}{$NAME}\n"
    }
    if ($line =~ /^\\begin{exports}/) {$EXPORTS="exports"}
    if ($line =~ /^\\begin{exports}\[/) {$EXPORTS="exports0"}
    $line =~ s/^\\(begin|end){exports}/\\${1}{$EXPORTS}/;
    $line =~ s/^\\(begin|end){ttyout}/\\${1}{verbatim}/;
    $line =~ s/\\alalias{}{/\\alalias{$THIS}{/g;
    $line =~ s/\\a(l|s)target/\\alhtmltarget{$THIS}/;
    $line =~ s/\\a(l|s)exp/\\alfunc{$THIS}/g;
    $line =~ s/\\alconstant{/\\alsignature{$NAME}{/g;    
    $line =~ s/\\Signature{/\\nsignature{$NAME}{/g;    
    $line =~ s/\\this([^a-z])/$THIS$1/g;
    $line =~ s/\\name([^a-z])/$NAME$1/g;
    $line
}

sub print_aldocmacros {
print <<'EOF';
\usepackage{fancyheadings, epsfig, makeidx, html}

\newcommand{\astype}[1]{\altype{#1}}
\newcommand{\aspage}[1]{\alpage{#1}}
\newcommand{\asfunc}[2]{\alfunc{#1}{#2}}
\newcommand{\asalias}[3]{\alalias{#1}{#2}{#3}}

\newcommand{\alhtmltarget}[2]{\label{#1:#2}{} \index{#2!#1}}
\newcommand{\altypes}[1]{\section*{#1}}
\newcommand{\albuiltin}[1]{\texttt{#1}}%
\newcommand{\alexttype}[2]{\htmlref{\texttt{#2}}{#1}}
\newcommand{\altype}[1]{\htmlref{\texttt{#1}}{#1}}
\newcommand{\alfunc}[2]{\alalias{#1}{#2}{#2}}
\newcommand{\alalias}[3]{\htmlref{\texttt{#3}}{#1:#2}}
\newcommand{\History}[3]{}
\newcommand{\category}[1]{\multicolumn{3}{l}{#1}}

\newenvironment{exports}{%
    \pagebreak[2]
    \par\bigskip\noindent
    \textbf{Exports}\nopagebreak\par
    \begin{list}{}{}
    \item{} \begin{tabular}{lll}
  }%
  {\end{tabular}\end{list}\smallskip}

\newenvironment{exports0}[1][]{%
    \pagebreak[2]
    \par\medskip\begin{list}{}{}
    \item{} #1 \vspace{-1ex}\nopagebreak
    \item{} \begin{tabular}{lll}
  }%
  {\end{tabular}\end{list}\smallskip}

\newenvironment{alwhere}{%
    \medskip
    \begin{list}{}{}
      \item{} where\nopagebreak
      \item \begin{tabular}{lcl}%
  }%
  {\end{tabular}\end{list}\smallskip}
\newenvironment{aswhere}{\begin{alwhere}}{\end{alwhere}}

\newcommand{\thistype}[1]{%
  \newpage\clearpage
  \subsection{#1}%
  \index{#1}%
  \label{#1}{}%
}

\newcommand{\thistypE}[2]{%
  \newpage\clearpage
  \subsection{#2}%
  \index{#1|see{#2}}
  \index{#2}%
  \label{#2}{}%
}

\newcommand{\alpage}[1]{%
    \newpage\clearpage
    \subsubsection{#1}%
  }

\newenvironment{aldocpar}[1]{%
    \pagebreak[2]\par\bigskip\noindent
    \textbf{#1}\nopagebreak\par
      \begin{list}{}{}%
        \item{}
  }%
  {\end{list}\smallskip}

\newcommand{\Aldocpar}[2]{%
    \pagebreak[2]\par\bigskip\noindent
    \textbf{#1}\nopagebreak\par
      \begin{quotation}%
  {#2}
  \end{quotation}\smallskip
}

\newenvironment{usage}{\begin{aldocpar}{Usage}}{\end{aldocpar}}
\newenvironment{descr}{\begin{aldocpar}{Description}}{\end{aldocpar}}
\newenvironment{retval}{\begin{aldocpar}{Returns}}{\end{aldocpar}}
\newenvironment{remarks}{\begin{aldocpar}{Remarks}}{\end{aldocpar}}
\newenvironment{errors}{\begin{aldocpar}{Errors}}{\end{aldocpar}}
\newenvironment{asex}{\begin{aldocpar}{Example}}{\end{aldocpar}}
\newenvironment{alex}{\begin{aldocpar}{Example}}{\end{aldocpar}}

\newcommand{\Usage}[1]{\Aldocpar{Usage}{#1}}
\newcommand{\Descr}[1]{\Aldocpar{Description}{#1}}
\newcommand{\Retval}[1]{\Aldocpar{Returns}{#1}}
\newcommand{\Remarks}[1]{\Aldocpar{Remarks}{#1}}
\newcommand{\Errors}[1]{\Aldocpar{Errors}{#1}}
\newcommand{\Asex}[1]{\Aldocpar{Example}{#1}}

\newcommand{\nsignature}[3]{\alsignature{#1}{{#2} $\to$ {#3}}}

\newcommand{\alsignature}[2]{%
    \pagebreak[2]\par\bigskip\noindent
    \textbf{Signature}\nopagebreak\par
    \begin{list}{}{}
      \item{}
        \begin{tabular}{ll} 
          {#1}: & {#2} \\
        \end{tabular}
    \end{list}%
}%

\newenvironment{signatures}{%
    \pagebreak[2]\par\bigskip\noindent
    \textbf{Signatures}\nopagebreak\par
    \begin{list}{}{}
      \item{}
        \begin{tabular}{ll}%
  }%
  {\end{tabular}\end{list}\smallskip}
\newcommand{\Signatures}[1]{%
    \pagebreak[2]\par\bigskip\noindent
    \textbf{Signatures}\nopagebreak\par
    \begin{list}{}{}
      \item{}
        \begin{tabular}{ll}#1\end{tabular}\end{list}\smallskip
}

\newenvironment{params}{%
    \par\bigskip\noindent
    \pagebreak[2]
    \begin{tabular}{lll}
      \textbf{Parameter} & \textbf{Type} & \textbf{Description}\\ \hline
  }%
  {\end{tabular}\smallskip}
\newcommand{\Params}[1]{%
    \par\bigskip\noindent
    \pagebreak[2]
    \begin{tabular}{lll}
      \textbf{Parameter} & \textbf{Type} & \textbf{Description}\\ \hline
#1\end{tabular}\smallskip
}

\newenvironment{asoutput}{%
    \pagebreak[2]
    \begin{tabbing} \hspace{10ex}\= \kill%
  }%
  {\end{tabbing}
}

\newcommand{\alseealso}[1]{%
    \pagebreak[2]\par\bigskip\noindent
    \textbf{See Also}\nopagebreak\par
    \begin{list}{}{}
      \item{} #1
    \end{list}\smallskip%
}%
EOF
}
