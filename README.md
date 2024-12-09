# BaseData
本应用是iOS开发的底层模板,拥有OC版本和swift版本
BaseToolClass为swift版本,BaseToolSystem为OC版本,newDemo为2024年12月最新OC模板
项目包含的主要代码结构为MVC
项目主要文件类型说明：
AppDelegate(代理)：这个文件夹主要是放置项目自动生成的代理文件，也就是项目运行的启动项。

Modules(主模块)：这个文件夹里一般放置登录模块和主要内容模块，每个模块下的标配结构为【Controller】、【Model】、【Resource】三个文件夹。【Controller】放置主要代码，【Model】放置数据模型，【Resource】放置模块图片。

Base(基类)：这个文件夹放置一些底层建模，如TabBar（底部标签栏），Navigation（顶部导航栏），VC（控制视图），View（视图）等，底层的方法都可以这这里面设计，然后作为父类让项目文件继承。同时这个文件夹里可以放一些公共页面，如EnlargeImageBrowser（图片放大），scan(二维码扫描)，DateChoose（时间弹窗）等，可以在调用时方便一些。这里也放置了Resource(公共图片资源)的文件夹，用来放置一些使用频繁的图片，一些页面的背景图及logo图标。

Category(类别)：这个文件夹放置一些数据类型的公共方法，主要包含的类型有：String，Botton，ImageView，Label，TextField，TextView，View，Image，以后有需要会陆续添加。

Define(宏)：这个文件夹放置一些宏定义的文件：SystemDefine主要放置一些基础类的宏定义，如ScreenW（屏幕宽），ScreenH（屏幕高），StatusHight（状态栏高），NavHight（导航栏高）等，用到时可以直接调用。URLDefine主要放置接口的宏定义，方便直接调用接口。
附：OC版本会多一个Prefix_pch文件，这是预编译头文件，可以将一些文件导入其中，可以更容易调用。
