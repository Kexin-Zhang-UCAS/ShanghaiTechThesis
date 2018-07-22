\NeedsTeXFormat{LaTeX2e}[1995/12/01]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 模板的命名，增加模板可选项

	% 定义上科大论文模板的类名为STUThesis
	\ProvidesClass{ShanghaiTechThesis}[2018/7/19 v1.0 ShanghaiTech University Thesis Template] 

	% 增添学位级别选项
	\newif\ifstu@bachelor\stu@bachelorfalse
	\newif\ifstu@master\stu@masterfalse
	\newif\ifstu@doctor\stu@doctorfalse

	% 增添所在院系选项
	\newif\ifstu@spst\stu@spstfalse
	\newif\ifstu@slst\stu@slstfalse
	\newif\ifstu@stu\stu@stufalse

	% 传递选项至文档类
	\DeclareOption{bachelor}{\stu@bachelortrue}
	\DeclareOption{master}{\stu@mastertrue}
	\DeclareOption{doctor}{\stu@doctortrue}

	\DeclareOption{spst}{\stu@spsttrue}
	\DeclareOption{slst}{\stu@slsttrue}
	\DeclareOption{stu}{\stu@stutrue}

	% 将所有选项传给ctexbook
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
	\ProcessOptions\relax

	% 传递选项后的赋值
	\ifstu@bachelor
		\newcommand\cndegree{本\quad 科}
		\newcommand\Cndegree{本科}
		\newcommand\engdegree{Bachelor of Science}
		\relax
	\else\ifstu@master
		\newcommand\cndegree{硕\quad 士}
		\newcommand\Cndegree{硕士}
		\newcommand\engdegree{Master of Science}
		\relax
	\else\ifstu@doctor
		\newcommand\cndegree{博\quad 士}
		\newcommand\Cndegree{博士}
		\newcommand\engdegree{Doctor of Philosophy}
		\relax
	\else\ClassError
	\fi\fi\fi

	\ifstu@spst
		\newcommand\cnschool{物质科学与技术学院}
		\newcommand\enschool{School of Physical Science and Technology}
		\relax
	\else\ifstu@slst
		\newcommand\cnschool{生命科学与技术学院}
		\newcommand\enschool{School of Life Science and Technology}
		\relax
	\else\ifstu@stu
		\newcommand\cnschool{信息科学与技术学院}
		\newcommand\enschool{School of Inforamtion Science and Technology}
		\relax
	\else\ClassError
	\fi\fi\fi

	% 选用CTEX文档类,并固定格式，可更改
	\LoadClass[a4paper, UTF8, twoside, openright, no-math]{ctexbook}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CTeX Settings 和一些文章基本设置
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
	\ctexset{%
		appendixname=附录,
		contentsname={目\hspace{\ccwd}录},
		listfigurename=插图,
		listtablename=表格,
		figurename=图,
		tablename=表,
		bibname=参考文献,
		indexname=索引,
	}

	% Title Settings at the chapter Level
	\ctexset{chapter={
		format={\centering},
		nameformat={\Large\bfseries},
		titleformat={\Large\bfseries},
		aftername={\quad},
		beforeskip={15\p@},
		afterskip={12\p@},
		}
	}
	% Title Settings at the section Level
	\ctexset{section={
		format={\large\bfseries},
		afterskip={1.0ex \@plus .2ex},
		}
	}
	% Title Settings at the subection Level
	\ctexset{subsection={
		format={\bfseries\normalsize},
		indent={0\ccwd},
		afterskip={1.0ex \@plus .2ex},
		}
	}
	% Title Settings at the subsubection Level
	\ctexset{subsubsection={
		format={\normalfont\normalsize},
		indent={0\ccwd},
		afterskip={1.0ex \@plus .2ex},
		}
	}

	\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
	\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
	\linespread{1.3}             % 行距缩放因子

	% 使用该命令后，若每章最后一页为奇数页，则后面一页pagestyle设置为empty
	\def\cleardoublepage{\clearpage%
	\if@openright%
	  \ifodd
	    \c@page%
	  \else%
  	    \thispagestyle{empty}%
  	    \hbox{}%
	    \newpage%
	  \fi%
	\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%基础宏包导入和文章基本格式的设置
	% 目录超链接等包和设置
	\RequirePackage{hyperref}
		\hypersetup{colorlinks=true,linkcolor=blue,citecolor={blue}}
		\hypersetup{xetex, bookmarksnumbered, colorlinks, urlcolor=black, linkcolor=black, citecolor=black, plainpages=false, pdfstartview=FitH}
	% 页面尺寸设置包
	\RequirePackage{geometry}
		\geometry{a4paper,left=25mm,right=25mm,top=25mm,bottom=25mm}

	% 页眉页脚设置相关包并进行简单设置	
	\RequirePackage{fancyhdr}
	\RequirePackage{lastpage}
	% 每章第一页格式，已默认使用，只需设置
		\if@twoside
		\fancypagestyle{plain}{
		\fancyhf{}
		\fancyhead[LO,RE]{\small\kaishu 上海科技大学\Cndegree 学位论文}
		\fancyhead[RO]{\small\kaishu {\leftmark}}
		\fancyhead[LE]{\small\kaishu {\rightmark}}
		\fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
		\renewcommand{\headheight}{32pt}
		}
		%章节正文格式，需在frontmatter后使用\pagestyle{main}
		\fancypagestyle{main}{
		\fancyhf{}
		\fancyhead[LO,RE]{\small\kaishu 上海科技大学\Cndegree 学位论文}
		\fancyhead[RO]{\small\kaishu {\leftmark}}
		\fancyhead[LE]{\small\kaishu {\rightmark}}
		\fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
		\renewcommand{\headheight}{32pt}
		}
		\else
		\fancypagestyle{plain}{
		\fancyhf{}
		\fancyhead[L]{\small\kaishu 上海科技大学\Cndegree 学位论文}
		\fancyhead[R]{\small\kaishu {\leftmark}}
		% \fancyhead[LE]{\small\kaishu {\rightmark}}
		\fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
		\renewcommand{\headheight}{32pt}
		}
		%章节正文格式，需在frontmatter后使用\pagestyle{main}
		\fancypagestyle{main}{
		\fancyhf{}
		\fancyhead[L]{\small\kaishu 上海科技大学\Cndegree 学位论文}
		\fancyhead[R]{\small\kaishu {\leftmark}}
		% \fancyhead[LE]{\small\kaishu {\rightmark}}
		\fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
		\renewcommand{\headheight}{32pt}
		\fi
	% 设置文献处理包
	\RequirePackage[numbers,sort & compress]{natbib}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 常用宏包的导入和基本设置
	% 基础数学包
	\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}  
	\RequirePackage{upgreek}
	% 图形颜色等包
	\RequirePackage{graphicx,xcolor,CJKfntef}
		\graphicspath{{picture/}{logo/}}%图片检索路径，可自行拓展
		\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
	% caption相关设置包并简单设置
	\RequirePackage{caption}
	\RequirePackage{subcaption}
	\RequirePackage[list=off]{bicaption}
		\DeclareCaptionFont{kaishu}{\kaishu}
		\captionsetup{format=plain,labelformat=simple,labelsep=space,justification=centering,font={small,kaishu}}
		\captionsetup[bi-first]{bi-first}
		\captionsetup[bi-second]{bi-second}
		\captionsetup[sub]{font=footnotesize}

		\DeclareCaptionOption{bi-first}[]{
			\def\tablename{\sjtu@tablename}
			\def\figurename{\sjtu@figurename}
		}
		\DeclareCaptionOption{bi-second}[]{
			\def\tablename{Table}
			\def\figurename{Figure}
		}

	% 输出长表格longtable环境
	\RequirePackage{longtable} 
	% Set fontnote font size in threeparttable三线表包
	\RequirePackage{threeparttable}
	% 使用enumitem宏包配制列表环境
	\RequirePackage[inline]{enumitem}
	% 紧凑间距
	\setlist{nosep}
	% 列表和段落头对齐
	\setlist*{leftmargin=*}
	\setlist[1]{labelindent=\parindent} % Only the level 1
	% 脚注包
	\RequirePackage[perpage, bottom]{footmisc}
	% Setting Package siunitx
	\RequirePackage{siunitx}
		\sisetup{detect-all} % Detecting fonts
	% Setting Package listings/lstlistings
	\RequirePackage{listings}
		\lstset{tabsize=4, %
		frame=shadowbox, %把代码用带有阴影的框圈起来
		commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
		rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
		keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
		showstringspaces=false,%不显示代码字符串中间的空格标记
		stringstyle=\ttfamily, % 代码字符串的特殊格式
		keepspaces=true, %
		breakindent=22pt, %
		numbers=left,%左侧显示行号
		stepnumber=1,%
		numberstyle=\tiny, %行号字体用小号
		basicstyle={\footnotesize\ttfamily}, %
		showspaces=false, %
		flexiblecolumns=true, %
		breaklines=true, %对过长的代码自动换行
		breakautoindent=true,%
		breakindent=4em, %
		aboveskip=1em, %代码块边框
		%% added by http://bbs.ctex.org/viewthread.php?tid=53451
		fontadjust,
		captionpos=t,
		framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-9pt,belowcaptionskip=9pt,
		xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
		texcl=true,
		% 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
		extendedchars=false,columns=flexible,mathescape=true
		numbersep=-1em
		}
	% tikz相关包
	\RequirePackage{tikz}
		\usetikzlibrary{shapes.geometric, arrows}
	% algorithm相关包，输出代码
	\RequirePackage{algorithm, algorithmicx, algpseudocode}
		\@addtoreset{algorithm}{chapter}
		% New definitions
		\algnewcommand\algorithmicswitch{\textbf{switch}}
		\algnewcommand\algorithmiccase{\textbf{case}}
		\algnewcommand\algorithmicdefault{\textbf{default}}
		% New "environments"
		% using \algtext*{<env>} removes any typesetting of that command
		\algdef{SE}[SWITCH]{Switch}{EndSwitch}[1]{\algorithmicswitch\ (#1)}{\algorithmicend\ \algorithmicswitch}%
		%\algtext*{EndSwitch}%
		\algdef{SE}[CASE]{Case}{EndCase}[1]{\algorithmiccase\ #1:}{\algorithmicend\ \algorithmiccase}%
		\algtext*{EndCase}%
		\algdef{SE}[DEFAULT]{Default}{EndDefault}{\algorithmicdefault\ :}{\algorithmicend\ \algorithmicdefault}%
		\algtext*{EndDefault}%
		% The following add some extra commands to LaTeX algorithmicx package
		% Assert
		\algnewcommand\algorithmicassert{\texttt{assert}}
		\algnewcommand\Assert[1]{\State \algorithmicassert(#1)}%
		\renewcommand{\listalgorithmname}{算法}
	%


% 无冲突包，具体使用有待测试
	\RequirePackage{wasysym}
	\RequirePackage{metalogo,doc}
	\RequirePackage{array}
	\RequirePackage{dcolumn}
	\RequirePackage{multirow}
	\RequirePackage{booktabs}
	\RequirePackage{pdfpages}
	\RequirePackage{calc}



% 试验包
	% \RequirePackage{anyfontsize}
	% \RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
	% %newtx字体包
	% \RequirePackage[defaultsups]{newtxtext}
	% \RequirePackage{newtxmath}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 基础命令设置
% 旧定理类环境设置
		% 	\newtheorem{definition}{定义}[chapter]
		% 	\newtheorem{example}{例}[chapter]
		% 	\newtheorem{lemma}{引理}[chapter]
		% 	\newtheorem{theorem}{定理}[chapter]
		% 	\newtheorem{remark}{注}[chapter]
% 新定理类环境设置
	\newtheoremstyle{break}% name
	{}%      Space above, empty = `usual value'
	{}%      Space below
	{\itshape}% Body font
	{}%         Indent amount (empty = no indent, \parindent = para indent)
	{\bfseries}% Thm head font
	{.}%        Punctuation after thm head
	{\newline}% Space after thm head: \newline = linebreak
	{}%         Thm head spec
	\theoremstyle{plain}
		\newtheorem{algo}{算法~}[chapter]
		\newtheorem{thm}{定理~}[chapter]
		\newtheorem{lem}[thm]{引理~}
		\newtheorem{prop}[thm]{命题~}
		\newtheorem{cor}[thm]{推论~}
	\theoremstyle{definition}
		\newtheorem{defn}{定义~}[chapter]
		\newtheorem{conj}{猜想~}[chapter]
		\newtheorem{exmp}{例~}[chapter]
		\newtheorem{rem}{注~}
		\newtheorem{case}{情形~}
	\theoremstyle{break}
		\newtheorem{bthm}[thm]{定理~}
		\newtheorem{blem}[thm]{引理~}
		\newtheorem{bprop}[thm]{命题~}
		\newtheorem{bcor}[thm]{推论~}
		\renewcommand{\proofname}{\bfseries证明}

% 数学命令简化设置
	\newcommand{\rd}{\mathrm{d}}
	\newcommand{\dsN}{\mathbb{N}^{+}}
	\newcommand{\dsR}{\mathbb{R}}
	\newcommand{\dsC}{\mathbb{C}}
	\renewcommand{\eqref}[1]{ (\ref{#1}) }
	\newcommand{\jacp}{\alpha,\beta}
	\newcommand{\funinner}[2]{\langle#1, #2\rangle}
	\newcommand{\vecinner}[2]{(#1, #2)}

% Floating parameters
	\renewcommand{\textfraction}{0.15}
	\renewcommand{\topfraction}{0.85}
	\renewcommand{\bottomfraction}{0.65}
	\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法、代码的编号为"3-1"的形式，即分隔符由.变为短杠
	\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
	\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
	\renewcommand\p@subfigure{\thefigure}
	\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
	\renewcommand{\thealgorithm}{\arabic{chapter}--\arabic{algorithm}}
	\AtBeginDocument{\renewcommand{\thelstlisting}{\arabic{chapter}--\arabic{lstlisting}}}



% 流程图定义基本形状
	\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
	\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
	\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
	\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
	\tikzstyle{arrow} = [thick,->,>=stealth]



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置标题页
% 在tex文件中使用\command，在cls文件中使用\stu@command
% define classification etc. 定义分类号等
	\newcommand{\classification}[1][分类号]{\def\stu@classification{#1}}
	\newcommand{\confidential}[1][密级]{\def\stu@confidential{#1}}
	\newcommand{\UDC}[1][UDC]{\def\stu@UDC{#1}} 
	\newcommand{\IDnumber}[1][学号]{\def\stu@IDnumber{#1}}

	% define title and author   定义中英文title和author
	\newcommand{\cntitle}[1][中文标题]{\def\stu@cntitle{#1}}
	% \newcommand{\scntitle}[1][中文标题2]{\def\stu@scntitle{#1}}
	\newcommand{\entitle}[1][English Title]{\def\stu@entitle{#1}}
	\newcommand{\sentitle}[1][]{\def\stu@sentitle{#1}}
	% 作者
	\newcommand{\cnauthor}[1][姓名]{\def\stu@cnauthor{#1}}
	\newcommand{\enauthor}[1][name]{\def\stu@enauthor{#1}}

	% 指导教师
	\newcommand{\cnadvisor}[1][指导老师]{\def\stu@cnadvisor{#1}}
	\newcommand{\enadvisor}[1][advisor]{\def\stu@enadvisor{#1}}

	\newcommand{\cnresearch}[1][研究方向]{\def\stu@cnresearch{#1}}
	\newcommand{\enresearch}[1][research]{\def\stu@enresearch{#1}}

	% major 二级学科
	\newcommand{\cnmajor}[1][学科（专业）]{\def\stu@cnmajor{#1}}
	\newcommand{\enmajor}[1][major]{\def\stu@enmajor{#1}}

	% define time
	\newcommand{\cnsubmitdate}[1][2000年1月1日]{\def\stu@cnsubmitdate{#1}}
	\newcommand{\ensubmitdate}[1][Jan. 1st, 2000]{\def\stu@ensubmitdate{#1}}
						% \newcommand{\jobbegin}[1][]{\def\stu@jobbegin{#1}}
						% \newcommand{\jobend}[1][]{\def\stu@jobend{#1}}
						% \newcommand{\reportfinish}[1][]{\def\stu@reportfinish{#1}}

	% 定义下划线的长度及线上内容
	\def\stu@underline[#1]#2{\underline{\hbox to #1{\hfill#2\hfill}}}
	\def\stuunderline{\@ifnextchar[\stu@underline\underline}

	% rename标题页命令，建立中英文两个标题页
	\renewcommand{\maketitle}{%
		\pagestyle{empty}
		\cleardoublepage
		\begin{center}
			{\songti\zihao{-5} 分类号:~\stuunderline[100pt]{\stu@classification}\hfill 密级:~\stuunderline[88pt]{\stu@confidential}}\\
			\vspace{0.7cm}
			{\songti\zihao{-5}
				U~D~C:~\stuunderline[100pt]{\stu@UDC} \hfill 学号:~\stuunderline[88pt]{\stu@IDnumber} }\\
			\vspace{2cm}
			{\bfseries\heiti\zihao{2} 上~海~科~技~大~学\\\vspace{2.5ex}\cndegree\quad 学 \quad 位 \quad 论\quad 文}\\ 
			\vspace{1cm}
				\begin{figure}[h]
					\begin{center}
						\includegraphics[width=3cm]{logo/logo.jpg}
					\end{center}
				\end{figure}
			\vspace{1cm}
			{\heiti\zihao{4}
				\begin{tabular}{rl}
					\begin{CJKfilltwosides}{7em}中文论文题目：\end{CJKfilltwosides}&\stuunderline[300pt]{\stu@cntitle}\\ [2mm]
						                                                        % &\stuunderline[300pt]{\stu@scntitle}\\ [2mm]\\
					\begin{CJKfilltwosides}{7em}英文论文题目：\end{CJKfilltwosides}&\stuunderline[300pt]{\stu@entitle}\\ [2mm]
																				  &\stuunderline[300pt]{\stu@sentitle}\\ [2mm]
				\end{tabular}
			}\\
			\vspace{1cm}
			{\heiti\zihao{4}
				\begin{tabular}{rl}
					\begin{CJKfilltwosides}{6em}作者姓名：\end{CJKfilltwosides}&\stuunderline[250pt]{\stu@cnauthor}\\ [3mm]
					\begin{CJKfilltwosides}{6em}指导教师：\end{CJKfilltwosides}&\stuunderline[250pt]{\stu@cnadvisor}\\ [3mm]
					\begin{CJKfilltwosides}{6em}研究方向：\end{CJKfilltwosides}&\stuunderline[250pt]{\stu@cnresearch}\\ [3mm]
					\begin{CJKfilltwosides}{6em}学科(专业)：\end{CJKfilltwosides}&\stuunderline[250pt]{\stu@cnmajor}\\ [3mm]
					\begin{CJKfilltwosides}{6em}所在学院：\end{CJKfilltwosides}&\stuunderline[250pt]{\cnschool}\\ [3mm]
					\begin{CJKfilltwosides}{6em}提交日期：\end{CJKfilltwosides}&\stuunderline[250pt]{\stu@cnsubmitdate}\\ [3mm]
				\end{tabular}
			}
		\end{center}
		}
	\newcommand{\makeentitle}{%
		\pagestyle{empty}
		\cleardoublepage
		\vspace*{50pt}   
		\begin{center}
			{\linespread{1.2}\selectfont
			\sffamily\zihao{-1} \stu@entitle\\\stu@sentitle}
			\vspace{1cm}
			\vskip\stretch{1}
			\begin{figure}[h]
				\begin{center}
					\includegraphics[width=3cm]{logo/logo.jpg}
				\end{center}
			\end{figure}
			\vspace{1.5cm}
			{\bfseries\zihao{-2}\stu@enauthor}\\
			\vspace{0.5cm}
			{\normalfont\zihao{-3} \enschool}\\
			\vspace{2.5ex}
			{\normalfont\zihao{-3} ShanghaiTech University}\\
			\vspace{3.5cm}
			{\it\normalsize \zihao{-4} A thesis submitted for the degree of\\
			\engdegree}\\
			\vfill
			\stu@ensubmitdate
		\end{center}
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 原创性声明
	\newcommand\declarerriginal{%
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
		{\bfseries\zihao{3} 上海科技大学学位论文原创性声明}
	\end{center}
	\vskip 10pt
	{\par\zihao{-4}本人郑重声明：所呈交的学位论文，是本人在导师的指导下， 
	独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含
	任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献
	的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果
	由本人承担。\par}
	\vskip 60pt
	\hspace{13em}学位论文作者签名：\hrulefill\hspace{1.5em}
	\vskip 15pt
	\hspace{16em}日\hspace{1em}期：\hrulefill\hrulefill 年 \hrulefill 月 \hrulefill 日\hspace{1em}
	\cleardoublepage
	}

% 授权声明
	\newcommand\declareauthorization{%
	\cleardoublepage
	\pagestyle{empty}
	\begin{center}
	{\bfseries\zihao{3} 上海科技大学学位论文版权使用授权书}
	\end{center}
	\vskip 10pt
	{\par\zihao{-4}本学位论文作者完全了解学校有关保留、使用学位论文的规定，
	同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，
	允许论文被查阅和借阅。本人授权上海交通大学可以将本学位论文的全部或部分内容
	编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。\par
	本学位论文属于\\
	\hspace*{9em}\textbf{保\hspace{1em}密} \rule{3mm}{3mm}，
	在~\hrulefill~年解密后适用本授权书。\\
	\hspace*{9em}\textbf{不保密} \rule{3mm}{3mm} 。\\
	（请在以上方框上打勾）
	\par}
	\vskip 60pt
	学位论文作者签名：\hrulefill\hspace{3em}指导教师签名：\hrulefill
	\vskip 15pt
	日\hspace{1em}期：\hrulefill\hrulefill 年 \hrulefill 月 \hrulefill 日
	\hfill \hspace{3em}日\hspace{1em}期：\hrulefill\hrulefill 年 \hrulefill 月 \hrulefill 日
	}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置separatepage的格式
% 中英文摘要
	\newenvironment{cnabstract}{\chapter{摘\quad 要}}{}
	\newcommand\cnkeywords[1]{\vspace{2ex}\noindent{\heiti 关键词:} #1}
	\newenvironment{enabstract}{\chapter{Abstract}}{}
	\newcommand\enkeywords[1]{\vspace{2ex}\noindent{\bfseries Keywords:~} #1}

% 主要符号对照表
	\newenvironment{mainsymbol}{\chapter{主要符号对照表}}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 致谢
	\renewenvironment{thanks}{\chapter{致\quad 谢}}{}

% 个人作品
	\newenvironment{publications}[1]
	{\chapter{发表文章}%
		\@mkboth{\MakeUppercase 发表文章}
		{\MakeUppercase 发表文章}%
		\list{\@biblabel{\@arabic\c@enumiv}}%
		{\settowidth\labelwidth{\@biblabel{#1}}%
			\leftmargin\labelwidth
			\advance\leftmargin\labelsep
			\@openbib@code
			\usecounter{enumiv}%
			\let\p@enumiv\@empty
			\renewcommand\theenumiv{\@arabic\c@enumiv}}%
		\sloppy
		\clubpenalty4000
		\@clubpenalty \clubpenalty
		\widowpenalty4000%
		\sfcode`\.\@m}
	{\def\@noitemerr
		{\@latex@warning{Empty `publications' environment}}%
		\endlist}

% 简介
	\newenvironment{resume}{\chapter{简\quad 历}}{}
	\newenvironment{resumesection}[1]
	{{\noindent\normalfont\bfseries #1}
		\list{}{\labelwidth\z@
			\leftmargin 2\ccwd}
		\item\relax}
	{\endlist}
	\newenvironment{resumelist}[1]
	{{\noindent\normalfont\bfseries #1}
		\list{}{\labelwidth\z@
			\leftmargin 4\ccwd
			\itemindent -2\ccwd
			\listparindent\itemindent}
		\item\relax}
	{\endlist}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 其他设置，用于临时放置新特性
	\renewcommand\tableofcontents{%
		\if@twocolumn
		\@restonecoltrue\onecolumn
		\else
		\@restonecolfalse
		\fi
		\chapter{\contentsname}%
		\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
		\@starttoc{toc}%
		\if@restonecol\twocolumn\fi
	}

	\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

	\renewcommand{\labelitemi}{\ensuremath{\bullet}}

	\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

	\@addtoreset{algorithm}{chapter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput