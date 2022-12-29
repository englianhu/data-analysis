
<img src='文艺坊图库/大秦赋 - 北京大学.png' height='100'> <img src='文艺坊图库/coursera.jpg' height='100'>

# <span style='color:RoyalBlue'>R语言玩转金融与体彩数据分析</span>

## 前言

**为何辑写此书**
  
  本书是在下首次辑写参考书（纯属个人经验分享与心得），此前分享了**如何安装®Studio服务器与Shiny服务器**^[[安装 ®StudioとShiny服务器](https://github.com/scibrokes/setup-rstudio-server)]：

- [为数据科学家们量身定做の专业统计软件 — ®Studio服务器](https://beta.rstudioconnect.com/englianhu/Introducing-RStudio-Server-for-Data-Scientists/Introducing-RStudio-Server-for-Data-Scientists.html)
- [为数据科学家们量身定做の专业统计软件 — ®Studio服务器（演示文稿）](https://beta.rstudioconnect.com/englianhu/Introducing-RStudio-Server-for-Data-Scientists-Slides/Introducing-RStudio-Server-for-Data-Scientists-slides.html)

在下来自于马来西亚^[个人简历请查阅：[®γσ, ENG LIAN HU](https://beta.rstudioconnect.com/content/3091/ryo-eng.html)]，自2005年入行体彩交易就学习Excel电子表格，而2008年加入**Scicom (MSC) Bhd**后开始接触R语言，并且活跃于[统计之都论坛](https://d.cosx.org)与[经管之家：R语言论坛](http://bbs.pinggu.org/forum-69-1.html)论坛俩与中国大陆同胞交流，并向前辈高手们学习。

前几年，偶然发现了个R语言的使用者界面**®Studio**后，就觉得非常方便，然后自学在[DigitalOcean.com](https://m.do.co/c/aabb124120d0)安装服务器方便随时随地，只要可以上网的地方就可以使用。

前阵子，在下在学习金融交易的时候，无意中发现了本非常实用的经验分享书籍[Successful Algorithmic Trading](https://raw.githubusercontent.com/englianhu/binary.com-interview-question/master/reference/Successful%20Algorithmic%20Trading.pdf)，笔者在金融交易的解说，由入门到精通包括编码分享（笔者介绍了R语言、Python、C++以及比较各优缺点），该笔者**Michael Halls**^[更多该作者详情，请参阅[Struggling To Make Profitable Algo Trading Strategies?](https://www.quantstart.com/successful-algorithmic-trading-ebook)]与在下一样以经验分享著书之见，在下阅读与学习时深深感受到金融交易的武功秘籍（实用教材）如兮，夫复何求哇！

在下才疏学浅，仅有约翰霍金斯大学数据科学专业文凭，倘若有何错误之处，涵清多多包涵并指教。此书乃个人经验之谈。希望在同感身受与共而勉之的情况之下，热衷于金融与体彩行业的学者们可以容易着手。

有关如何辑写`bookdown::gitbook`网络书籍，请参阅[bookdown: Authoring Books and Technical Documents with R Markdown](https://bookdown.org/yihui/bookdown/)。

> 知乎中的<s>以上</s>章节乃预先草拟，辑写前尚会继续修改）欲知更多详情或完整版，请参阅<s>[R语言玩转金融与体彩数据分析](https://link.zhihu.com/?target=https%3A//github.com/englianhu/data-analysis)（GitBook）</s>以下GitHub Readme目录。

出处：[知乎：[原创] R语言玩转金融与体彩数据分析](https://zhuanlan.zhihu.com/p/30882947)

## 目录

- 第0章：前言
- 第1章：介绍
  - 第1.1章：R语言与RStudio
  - 第1.2章：Shiny应用
  - 第1.3章：调用其它语言程序
- 第2章：数据分析
  - 第2.1章：读存数据
    - 第2.1.1章：本地文件
    - 第2.1.2章：外来文件
  - 第2.2章：采集网络数据
    - 第2.2.1章：普通采集
    - 第2.2.2章：API接口
    - 第2.2.3章：Web Driver
  - 第2.3章：数据处理
    - 第2.3.1章：文字与数字
    - 第2.3.2章：数据框与矩阵
    - 第2.3.3章：列表与嵌套数据
    - 第2.3.4章：内存
    - 第2.3.5章：数据库
  - 第2.3章：数据分析程序包
- 第3章：统计模型
  - 第3.1章：基本统计学
    - 第3.1.1章：线性模型
    - 第3.1.2章：广义型线性模型
    - 第3.1.3章：最优模型选择
  - 第3.2章：高级统计学
    - 第3.2.1章：极大似然估计
    - 第3.2.2章：蒙地卡罗
    - 第3.2.3章：马尔可夫链
    - 第3.2.4章：隐马尔可夫链
    - 第3.2.5章：贝叶斯分析
  - 第3.3章：统计学程序包
- 第4章：金融交易
  - 第4.1章：金融交易
    - 第4.1.1章：金融交易介绍
    - 第4.1.2章：金融数据
    - 第4.1.3章：金融交易统计模型介绍
  - 第4.2章：单变量统计模型
    - 第4.2.1章：LASSO、ElasticNet、RIDGE模型
    - 第4.2.2章：Arima模型
    - 第4.2.3章：指数平滑法
    - 第4.2.4章：GARCH模型
  - 第4.3章：多变量统计模型 
    - 第4.3.1：GARCH模型
    - 第4.3.2：
  - 第4.4章：高频率交易模型
    - 第4.4.1章：季节性ARIMA模型
    - 第4.4.2章：MIDAS模型
    - 第4.4.3章：MIDAS-GARCH
    - 第4.4.4章：GARCH模型
  - 第4.5章：其它统计模型
    - 第4.5.1章：Levy Process
    - 第4.5.2章：Wavelet Tranforms
  - 第4.6章：投资管理
    - 第4.6.1章：投资风险管理
    - 第4.6.2章：基金管理
    - 第4.6.3章：多元基金管理
    - 第4.6.4章：基金评估
  - 第4.7章：金融交易程序包
- 第5章：金融投注
  - 第5.1章：金融投注
    - 第5.1.1章：金融投注介绍
    - 第5.1.2章：金融数据
    - 第5.1.3章：金融投注统计模型介绍
  - 第5.2章：投注模型
  - 第5.3章：投资管理
- 第6章：体彩交易
  - 第6.1章：体彩交易
    - 第6.1.1章：体彩交易介绍
    - 第6.1.2章：体彩数据
    - 第6.1.3章：体彩交易统计模型介绍
  - 第6.2章：足球赔率建模
    - 第6.2.1章：单变量泊松模型
    - 第6.2.2章：多变量泊松模型
    - 第6.2.3章：Logistic模型
    - 第6.2.4章：
  - 第6.3章：足彩投注模型
    - 第6.3.1章：普通投注模型
    - 第6.3.2章：凯利投注模型
    - 第6.3.3章：OHLC与GARCH应用
  - 第6.4章：投资管理
  - 第6.5章：体彩交易程序包
- 第7章：彩票、轮盘、老虎机与宾果
  - 第7.1章：彩票分析与预测
    - 第7.1.1章：数据与统计建模
    - 第7.1.2章：投注模式与回酬
  - 第7.2章：轮盘分析与预测
    - 第7.2.1章：数据与统计建模
    - 第7.2.2章：投注模式与回酬
  - 第7.3章：老虎机分析与预测
    - 第7.3.1章：数据与统计建模
    - 第7.3.2章：投注模式与回酬
  - 第7.4章：宾果分析与预测
    - 第7.4.1章：数据与统计建模
    - 第7.4.2章：投注模式与回酬
  - 第8章：高效率编程
    - 第8.1章：环境
    - 第8.2章：高效数据处理
    - 第8.3章：高效统计建模
    - 第8.4章：高效率与高级R语言参考书
- 第9章：基金与投资者管理模型
  - 第9.1章：多元化基金管理
    - 第9.1.1章：多元化基金评估
    - 第9.1.2章：
  - 第9.2章：投资者管理
    - 第9.2.1章：投资者资金流动统计建模
    - 第9.2.2章：
- 第10章：程序交易
  - 第10.1章：交易自动化
    - 第10.1.1章：数据连接自动化
    - 第10.1.2章：统计运算自动化
    - 第10.1.3章：基金评估自动化
    - 第10.1.4章：客户管理自动化
  - 第10.2章：多客户管理
    - 第10.2.1章：多投资者
    - 第10.2.2章：绩效管理
  - 第10.3章：
- 第11章：参考文献

## 投稿著书网站

- [Bookdown](https://bookdown.org)
- [Hans汉斯](https://www.hanspub.org)
- [RPubs](https://www.rpubs.com)
- [书栈网](https://www.bookstack.cn)
- [知乎](http://zhihu.com)
- [Gitbook](https://www.gitbook.com)
- [「猫城」The Journal of Open Source Software](https://github.com/englianhu/joss)

---

[<img src="文艺坊图库/Scibrokes.png" height="14"/> Sςιβrοκεrs Trαdιηg®](http://www.scibrokes.com)<br>
<span style='color:RoyalBlue'>**[<img src="文艺坊图库/Scibrokes.png" height="14"/> 世博量化®](http://www.scibrokes.com)企业知识产权及版权所有，盗版必究。**</span>
