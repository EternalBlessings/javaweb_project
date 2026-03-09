# library_javaweb_project

------

图书管理系统是一个基于JavaWeb+mysql的现代化图书馆管理平台，旨在实现图书、读者、借阅信息的高效管理，支持管理员和读者两种用户角色，提供便捷的图书查询、借阅、归还等功能，提升图书馆服务质量和管理效率。

------

***\*小型图书管理系统\****

要求：

(1)使用Filter过滤器进行身份认证;

(2)采用Servelet和JSP进行页面设计;

(3)使用Spring进行bean的管理；

(4) 设计相应数据库关系表，通过JDBC连接数据库,并进行数据库数据查询、增、删、改图书信息等表操作。

(5)可以查看图书信息和图书库存数量。

***\*要求包含5个以上实体：图书分类信息，图书基础信息，新书信息，书库信息，图书库存量信息。\****

------

# 前端架构设计

2.1 技术栈选择与架构分析 

2.1.1 技术栈组成

本图书管理系统前端采用 JSP + EL + JSTL + CSS3 + Servlet 的经典技术栈组合，各技术组件分工明确，形成高效的前端开发体系：

核心技术组件：

JSP（JavaServer Pages） ：作为视图层核心技术，提供动态页面生成能力

EL（Expression Language） ：简化数据访问语法，实现JSP页面对后端数据的无缝获取

JSTL（JSP Standard Tag Library） ：提供标准化标签库，减少Java代码在页面中的直接使用

CSS3 ：负责界面样式设计，实现响应式布局和视觉美化

Servlet ：处理HTTP请求响应，充当控制器角色 

2.1.2 技术选型优势分析

服务器端渲染 ：页面在服务器端编译执行，提高首屏加载速度

与Java无缝集成 ：可直接调用Java方法和访问后端数据

丰富的内置对象 ：提供request、response、session等9大内置对象

 

2.2 MVC模式中的View层设计 

2.2.1 MVC架构定位

在本图书管理系统中， 前端JSP页面完全承担View（视图）层的职责 ，与Model（模型）和Controller（控制器）层形成清晰的分层架构.

Model层 ：后端传递的数据对象（Book、Reader、BorrowRecord、VO等）

View层 ：JSP页面组成的用户界面层，负责数据展示和用户交互

Controller层 ：对应的Servlet控制器，处理业务逻辑和页面跳转

 

2.2.3 View层设计原则

\1. 职责单一原则

JSP页面专注于数据展示和用户交互,业务逻辑完全由Servlet和Service层处理,数据访问由DAO层负责

\2. 松耦合设计

<!-- 通过EL表达式解耦，页面不直接依赖Java对象 -->

<td>${book.name}</td>  <!-- 不关心book对象的具体实现 -->

<c:forEach items="${bookList}" var="book">  <!-- 只关心集合结构 -->,页面不直接依赖具体的Java类,通过标准接口（getter方法）访问数据,便于后期维护和扩展

 

2.3 前端页面结构规划 

2.3.1 页面分类体系

基于功能模块和用户角色，本系统的前端页面结构分为以下四个主要类别：

 

```
公共模块

├── index.jsp   系统首页/登录入口

└── error.jsp   错误页面统一处理

用户认证模块

├── login.jsp       管理员登录页面

├── readerlogin.jsp    读者登录页面

└── register.jsp     用户注册页面（支持管理员/读者选择）

管理员模块

├── adminindex.jsp      管理员首页

├── addBook.jsp       图书添加页面

├── bookList.jsp       图书列表页面

├── editBook.jsp       图书编辑页面

├── adminBorrowManage.jsp  借阅管理页面

└── allBook.jsp       全部图书展示页面2.3 模块划分与职责

读者模块

├── readerindex.jsp     读者首页

├── queryBookForm.jsp    图书查询表单页面

├── queryBookResult.jsp   查询结果展示页面

├── readerBorrow.jsp     图书借阅页面

├── myBorrow.jsp       我的借阅页面

└── return.jsp       图书归还页面

 
```

2.3.2 页面通用结构设计

\1. 页面布局框架 所有功能页面采用统一的布局结构，确保用户体验一致性：

\2. CSS样式架构 采用模块化的CSS组织方式：

```
css

├── style.css       主样式文件

├──自定义btn，from,status等组件，动画交互
```

2.2.3 数据绑定与交互机制

```
EL表达式数据访问模式

<!-- 单对象属性访问 -->

<td>${book.isbn}</td>

<td>${book.name}</td>

<td>${book.author}</td>

 

<!-- 集合对象遍历 -->

<c:forEach items="${bookList}" var="book" varStatus="status">

  <tr>
 <td>${status.count}</td>

<td>${book.isbn}</td>

<td>${book.name}</td>

<td>${book.author}</td>

<td>${book.price}</td>

<td>${book.count}</td>

  </tr>

</c:forEach> 

<!-- 复杂对象属性访问 -->

<c:forEach items="${borrowList}" var="vo">

  <td>${vo.readerName}</td>

  <td>${vo.bookIsbn}</td>

  <td>${vo.bookName}</td>

  <td>${vo.borrowTime}</td>

  <td>${vo.returnTime}</td>

</c:forEach>
```

 

2.3 前端页面结构规划 

2.3.1 页面层次结构设计

```
一级页面（系统入口层）

index.jsp ：系统首页，提供角色选择和功能介绍

adminindex.jsp ：管理员工作台，系统管理功能总览

readerindex.jsp ：读者个人中心，个人功能入口

二级页面（功能模块层）

认证模块： login.jsp 、 readerlogin.jsp 、 register.jsp

图书管理： addBook.jsp 、 bookList.jsp 、 allBook.jsp

借阅管理： adminBorrowManage.jsp 、 readerBorrow.jsp 、 return.jsp

查询功能： queryBookForm.jsp 、 queryBookResult.jsp

个人中心： myBorrow.jsp

三级页面（操作详情层）

editBook.jsp ：图书信息编辑详情
```

####  后端架构设计

##### **1．*****\*Filter过滤器\*******\*设计\****

###### （1）**管理员登录过滤器(LoginFilter)**

未登陆时拦截与登录之后能访问的权限，仅保留登录权限。

核心代码如下

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps1.jpg) 

##### （2）**读者登录过滤器(ReaderLoginFilter)**

与管理员一样，未登陆时拦截与登录之后能访问的权限，仅保留登录权限。

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps2.jpg) 

##### **2．*****\*Servlet设计\****

##### （1）**管理员与读者的注册登录登出相关Servlet**

##### ① **管理员或读者登录servlet**

整体完成了从前端接收登录参数、校验合法性、数据库验证账号密码，到处理登录结果（成功/失败/异常）的全流程，核心是基于JDBC的管理员或读者账号密码校验与登录状态的Session存储。

管理员登录核心代码如下(读者类似)

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps3.jpg)![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps4.jpg) 

##### ② **管理员或读者注册servlet**

实现了管理员账户注册的完整业务逻辑，完成了从前端接收注册参数、校验合法性、查重用户名，到数据库插入新管理员信息、处理注册结果（成功/失败/异常）的全流程，核心是基于JDBC的用户名唯一性校验与管理员信息的数据库插入操作。管理员注册servlet代码如下(读者类似)

| ***\*![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps5.jpg)\**** |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ***\*![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps6.jpg)\**** | ***\*![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps7.jpg)\**** |

##### ③ **管理员或读者登出servlet**

核心逻辑是销毁管理员的登录Session，清除登录状态并跳转至登录页

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps8.jpg) 

##### （2）查询书籍Servlet(BookListServlet)	

Servlet中实现图书列表查询并转发到JSP页面展示的核心逻辑，主要完成了从数据库查询图书数据、处理查询结果、将数据传递给JSP页面的功能

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps9.jpg) 

 

##### （3）增加书籍Servlet(AddBookServlet)	

AddBookServlet实现了管理员新增图书的核心业务逻辑，整体是参数接收与校验→数据封装→多表数据库插入→结果反馈的流程。核心代码如下

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps10.jpg)![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps11.jpg) 

##### （4）**根据Isbn查询书籍     servlet(QueryBookByIsbnServlet)**

实现单本书籍的查询

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps12.jpg) 

##### （5）**编辑书籍servlet(EditBookServlet、UpdateBookServlet)**

编辑图书的Servlet核心逻辑，主要完成了根据ISBN查询待编辑图书的信息，并将数据传递到编辑页面回显的功能，同时处理查询过程中的异常和无数据情况,用户在编辑页面填好新数据提交后，需要UpdateBookServlet来接收新数据、处理转换、调用DAO更新数据库。

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps13.jpg) 

##### （6）**删除书籍servlet(DeleteBookServlet)**

实现了根据ISBN删除图书、处理删除结果并转发回图书列表页的功能，同时捕获删除过程中的异常

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps14.jpg) 

##### （7）**读者的模糊查询书籍(ReaderBookServlet)**

通过关键词搜索图书和浏览所有图书。根据不同请求类型调用DAO层对应的方法，获取图书数据集合。将图书数据传递到 readerBook.jsp 页面展示，若出现数据库异常则返回失败提示。

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps15.jpg) 

##### （8）**读者借阅书籍servlet(ReaderBorrowServlet)**

实现了读者借阅图书前的合法性校验，以及借阅成功后的库存扣减操作，是图书管理系统中借阅模块的关键环节

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps16.jpg) 

 

 

 

 

 

 

 

### （9）**读者归还书籍servlet(ReturnServlet)**

实现了读者归还图书前的账号合法性校验、归还操作执行以及归还成功后的库存恢复，是图书管理系统中归还模块的关键环节

 

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps17.jpg) 



## **3．*****\*数据访问层Dao模块设计\****

### （1）**封装图书的增删查改(BookDao)**

核心功能: findAllBooks()方法查询数据库中所有图书，返回 List<Book> 集合。 addBook() 方法重载两个版本，实现图书信息的新增（一个独立操作，一个支持外部传入数据库连接）。decreaseBookStock() ：借阅图书时，将对应图书库存减1（需保证库存大于0）。

| ![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps18.jpg) | ![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps19.jpg) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
|                                                              |                                                              |

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps20.jpg) 

 

 

 

### （2）**读者借阅数据访问层(ReaderBorrowDao)**

核心功能：isAccountExist() 通过读者名称校验读者是否存在。isSameBookBorrowed() 校验读者是否已借阅某本书且未归还。borrowBook() 新增读者的图书借阅记录。returnBook() 更新借阅记录的归还时间，完成图书归还。getBorrowRecordsByReader() 查询指定读者的所有借阅记录。

| ![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps21.jpg) | ![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps22.jpg) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
|                                                              |                                                              |

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps23.jpg) 

##### （3）**更新newbookinfo表的数据访问层(NewBookInfo)**

核心功能：增加图书时不止book表更新，newbookinfo表也随之更新

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps24.jpg) 

# JSP核心页面实现

3.1 用户认证模块实现

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps25.jpg) 

3.1.1 管理员登录页面（login.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps26.jpg) 

3.1.2 读者登录页面（readerlogin.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps27.jpg) 

3.1.3 用户注册页面（register.jsp） 

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps28.jpg) 

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps29.jpg) 

3.2 管理员功能界面实现

3.2.1 管理员首页（adminindex.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps30.jpg) 

3.2.2 图书添加页面（addBook.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps31.jpg)![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps32.jpg) 

3.2.3 图书列表页面（bookList.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps33.jpg) 

3.2.4 图书编辑页面（editBook.jsp） 

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps34.jpg) 

3.2.5 借阅管理页面（adminBorrowManage.jsp） 

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps35.jpg) 

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps36.jpg) 

3.3 读者功能界面实现

3.3.1 读者首页（readerindex.jsp）

 ![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps37.jpg)

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps38.jpg) 

3.3.2 图书查询页面（queryBookForm.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps39.jpg) 

3.3.3 查询结果页面（queryBookResult.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps40.jpg) 

3.3.4 图书借阅页面（readerBorrow.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps41.jpg) 

3.3.5 我的借阅页面（myBorrow.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps42.jpg) 

3.3.6 图书归还页面（return.jsp）

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps43.jpg) 

![img](file:///C:\Users\14754\AppData\Local\Temp\ksohtml16676\wps44.jpg)