\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{studentpaper}[2025/09/21 Custom Document Class for Student Papers]

\LoadClass[12pt]{article}

% ========== 基本包 ==========
\RequirePackage[utf8]{inputenc}
\RequirePackage{ctex}               % 中文支持
\RequirePackage{geometry}           % 页边距
\RequirePackage{setspace}           % 行距
\RequirePackage{indentfirst}        % 首段缩进
\RequirePackage{ragged2e}           % 左对齐支持
\RequirePackage{fontspec}           % 字体
\RequirePackage{graphicx}           % 插入校徽
\RequirePackage[none]{hyphenat}     % 禁止断词
\RequirePackage[en-GB]{datetime2}


\usepackage{apacite}



\DTMlangsetup[en-GB]{ord=omit}



% ========== 页面设置 ==========
% 页面设置
\geometry{margin=1in}               % 页边距
\setstretch{2.4}                    % 全文Word double spacing
\RaggedRight                        % 左对齐
\setlength{\parindent}{0.5in}       % 首行缩进
\sloppy


% ========== 字体设置 ==========
\setmainfont{Times New Roman}       % 西文字体 Times New Roman
\setCJKmainfont{SimSun}             % 中文宋体
\AtBeginDocument{\fontsize{12pt}{12pt}\selectfont} % 正文字体12pt，行距12pt模拟Word双倍行距效果

\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{} % 清空默认页眉页脚
\rhead{\fontsize{12pt}{14.4pt}\selectfont\thepage} % 右上角页码
\lhead{} 
\chead{} 
\lfoot{} 
\cfoot{} 
\rfoot{} 
\renewcommand{\headrulewidth}{0pt} % 移除页眉下划线
\renewcommand{\footrulewidth}{0pt} % 移除页脚下划线

\usepackage{titlesec}  % 必须先加载titlesec包

% 自定义section标题格式
\titleformat{\section}             % 自定义section标题
  {\normalfont\fontsize{12pt}{12pt}\selectfont\bfseries\centering} % 12pt Times New Roman，加粗，居中
  {}                              % 无编号
  {0pt}                           % 标签与标题之间的间距（无标签时为0）
  {}                              % 标题内容

% 自定义section标题间距
\titlespacing*{\section}          
  {0pt}    % 左侧间距
  {8pt}    % 标题上方间距
  {8pt}    % 标题下方间距，与正文段后间距一致

% 自定义 subsection 标题格式
\titleformat{\subsection}%
  {\normalfont\fontsize{12pt}{14.4pt}\selectfont\bfseries\raggedright} % 12pt，加粗，左对齐
  {}                % 无编号
  {0pt}                           % 标签与标题之间的间距（无标签时为0）
  {}                              % 标题内容

% 自定义 subsection 间距
\titlespacing*{\subsection}%
  {0pt}   % 左缩进
  {8pt}   % 标题上方间距
  {0pt}   % 标题下方间距



% ========== 信息命令 ==========
\renewcommand{\@title}{}
\renewcommand{\@author}{}
\newcommand{\@studentid}{}
\newcommand{\@instructor}{}
\newcommand{\@course}{}
\newcommand{\@institute}{}
\renewcommand{\@date}{}
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\instructor}[1]{\renewcommand{\@instructor}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\institute}[1]{\renewcommand{\@institute}{#1}}
\renewcommand{\today}{\DTMdisplaydate{\number\year}{\number\month}{\number\day}{-1}}        % 定义今日日期为纯数字+月全名+年


% ========== 自定义标题页 ==========
% 将校徽文件命名为 logo.png 并放在同一目录
\renewcommand{\maketitle}{
  \begin{titlepage}

    \begin{center}
      % 插入校徽
      \includegraphics[width=0.15\textwidth]{logo.png}
        \vspace{\baselineskip}  % 空一行
      
      % 标题（12pt，加粗）
      {\bfseries\fontsize{12pt}{12pt}\selectfont \@title\par}
        \vspace{8pt}

      % by、姓名、学号（12pt）
      {\fontsize{12pt}{12pt}\selectfont by\par}
      \vspace{8pt}
      {\fontsize{12pt}{12pt}\selectfont \@author\par}
      \vspace{8pt}
      {\fontsize{12pt}{12pt}\selectfont \@studentid\par}
      \vspace{8pt}
        \vspace{\baselineskip}  % 空一行


      % 教师、课程（12pt）
      {\fontsize{12pt}{12pt}\selectfont Instructor: \@instructor \par}
      \vspace{8pt}
      {\fontsize{12pt}{12pt}\selectfont \@course\par}
      \vspace{8pt}
        \vspace{\baselineskip}  % 空一行


      % 学校、日期（12pt）
      {\fontsize{12pt}{12pt}\selectfont \@institute\par}
        \vspace{8pt}
      {\fontsize{12pt}{12pt}\selectfont \@date\par}

    \end{center}
  \end{titlepage}

  % 在正文页第一行添加居中标题，12pt，加粗
  \newpage
  \begin{center}
    {\bfseries\fontsize{12pt}{12pt}\selectfont \@title}
  \end{center}
}
\endinput
