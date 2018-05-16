-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-03-18 23:14:42
-- 服务器版本： 5.6.17
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fish`
--

-- --------------------------------------------------------

--
-- 表的结构 `fh_album`
--

CREATE TABLE `fh_album` (
  `al_id` int(11) NOT NULL COMMENT '主键',
  `al_name` varchar(64) NOT NULL COMMENT '相册名',
  `al_img` varchar(64) NOT NULL COMMENT '相册封面',
  `al_content` varchar(128) NOT NULL COMMENT '相册描述',
  `al_show` int(11) NOT NULL COMMENT '0为显示1为不显',
  `al_time` int(11) NOT NULL COMMENT '添加相册时间',
  `al_root` varchar(64) NOT NULL COMMENT '添加人',
  `al_system` varchar(16) NOT NULL COMMENT '设备系统',
  `al_ip` varchar(16) NOT NULL COMMENT 'IP地址',
  `al_hit` int(11) NOT NULL DEFAULT '0' COMMENT '点击量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_album`
--

INSERT INTO `fh_album` (`al_id`, `al_name`, `al_img`, `al_content`, `al_show`, `al_time`, `al_root`, `al_system`, `al_ip`, `al_hit`) VALUES
(1, '大头娃娃机', '/Uploads/image/20171111/1510394212102084.png', '大头娃娃机上线了...', 0, 1510545453, 'admin', 'Win 7', '127.0.0.1', 21),
(2, '隔空抓娃娃', '/Uploads/image/20171113/1510541523420549.png', '隔空抓娃娃上线了...', 0, 1510541538, 'admin', 'Win 7', '127.0.0.1', 0),
(3, '天天抓娃娃', '/Uploads/image/20171115/1510736912854180.png', '在天天抓娃娃抓到的', 0, 1510736933, 'admin', 'Win 7', '127.0.0.1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fh_article`
--

CREATE TABLE `fh_article` (
  `a_id` int(11) NOT NULL COMMENT '主键',
  `pid` int(11) NOT NULL COMMENT '栏目',
  `a_content` text NOT NULL COMMENT '内容',
  `a_desc` varchar(256) NOT NULL COMMENT '描述',
  `a_keyword` varchar(64) NOT NULL COMMENT '标签',
  `a_img` varchar(128) NOT NULL COMMENT '图片',
  `a_show` int(11) NOT NULL COMMENT '公开度:1是0不是',
  `a_original` int(11) NOT NULL COMMENT '原创:1是0不是',
  `a_time` int(11) NOT NULL COMMENT '发布时间',
  `a_root` varchar(64) NOT NULL COMMENT '发表人',
  `a_hit` int(11) DEFAULT '0' COMMENT '点击量',
  `a_system` varchar(32) NOT NULL COMMENT '系统',
  `a_ip` varchar(16) NOT NULL COMMENT 'IP',
  `a_num` int(11) DEFAULT '0' COMMENT '评论数',
  `a_name` varchar(64) NOT NULL COMMENT '标题'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_article`
--

INSERT INTO `fh_article` (`a_id`, `pid`, `a_content`, `a_desc`, `a_keyword`, `a_img`, `a_show`, `a_original`, `a_time`, `a_root`, `a_hit`, `a_system`, `a_ip`, `a_num`, `a_name`) VALUES
(8, 3, 'hello world', '曾经梦想仗剑走天涯，可谁曾想，一入IT深似海，曾经梦想赴沧海。总是有写不完的程序，改不完的bug，扯不完的皮。产品一筹莫展的时候最喜欢拉着俺们程序员开会了，乱七八糟的需求理不清的思路，拉着我们扯一会儿皮，问题就迎刃而解啦', '个人博客', '/public/static/artImg/05a0a26d1094e74e5e382078a0be23ed.png', 1, 1, 1512097777, 'admin', 79, 'Win 7', '127.0.0.1', 2, '曾梦想仗剑走天涯，后来因为bug太多就没去'),
(11, 3, 'hello world', '通信时代，无论是初次相见还是老友重逢，交换联系方式，常常是彼此交换名片，然后郑重或是出于礼貌用手机记下对方的电话号码。在快节奏的生活里，我们不知不觉中就成为住在别人手机里的朋友。又因某些意外，变成了别人手机里匆忙的过客，这种快餐式的友谊 ...', '个人博客', '/public/static/artImg/336aa84df5caa643863eab69520067c0.png', 1, 1, 1510805486, 'admin', 9, 'Win 7', '127.0.0.1', 2, '住在手机里的朋友'),
(12, 3, 'hello world', '初次相识的喜悦，让你觉得似乎找到了知音。于是，对于投缘的人，开始了较频繁的交往。渐渐地，初识的喜悦退尽，接下来就是仅仅保持着联系，平淡到偶尔在节假曰发短信互致问候...;', '个人博客', '/public/static/artImg/688795baf905133dfe60dd5080a18825.png', 1, 1, 1510805602, 'admin', 0, 'Win 7', '127.0.0.1', 0, '教你怎样用欠费手机拨打电话'),
(13, 4, 'hello world', 'sss', '个人博客', '/public/static/artImg/793c1c39dc842ffd43b702e046e0fd4c.png', 1, 1, 1510805697, 'admin', 3, 'Win 7', '127.0.0.1', 0, '原来以为，一个人的勇敢是，删掉他的手机号码...'),
(14, 1, 'hello world', 'isset： 判断变量是否定义或者是否为空，（1） 变量存在返回ture，否则返回false。（2）变量定义不赋值返回false。（3） unset一个变量，返回false。（4） 变量赋值为    null，返回false', 'php', '/public/static/artImg/2d0e76c2a9dd58c0677f6c88652d87df.png', 1, 1, 1512097825, 'admin', 8, 'Win 7', '127.0.0.1', 0, 'php常见的面试题'),
(15, 1, '<p>hello world</p>', '虽说我们很多时候前端很少有机会接触到算法。但是面试的时候总会面一些算法的问题,实际上这些算法也是最基础的算法，在这里就简单列出一些面试常见的问题，帮助大家巩固一些知识。', 'js', '/public/static/artImg/dc9e895933d234c28bfd5ed8db1122fe.png', 1, 1, 1501557115, 'admin', 7, 'Win 7', '127.0.0.1', 0, '面试时常见的javascript试题'),
(17, 1, 'hello world', 'Vue的实例是Vue框架的入口，其实也就是前端的ViewModel，它包含了页面中的业务逻辑处理、数据模型等，当然它也有自己的一系列的生命周期的事件钩子，辅助我们进行对整个Vue实例生成、编译、挂着、销毁等过程进行js控制。', 'vue,mvvm', '/public/static/artImg/8b29fa8088defa81ac12352f43aecf1f.png', 1, 1, 1511421196, 'admin', 15, 'Win 7', '127.0.0.1', 0, 'Vue2.0实例和生命周期'),
(18, 1, 'hello world', ' 相比于主流的angular和react前端框架，vue在近年来也变得非常火热。他吸取了前两者的优点，同时社区也异常的火爆，在这里，就给大家介绍vue-cli脚手架的搭建，以免刚刚入手vue框架的学习者走更多的弯路。', 'vue,vue-cli', '/public/static/artImg/58648d192bb2dcddc34cf1451a573456.png', 1, 1, 1511420970, 'admin', 7, 'Win 7', '127.0.0.1', 1, 'vue-cli脚手架的搭建'),
(19, 3, 'hello world', '1、每一次程序出了BUG的时候，就独自看一看大海，越看越想跳下去。2、走到今天真不容易，我要感谢两个人，一个是威利斯·凯利发明了空调，另一个是后裔，射落了九个太阳。3、很多程序员是单身狗，不是找不到对象，只是觉得恋爱真的太复杂了，还是敲代码比较简单。', 'bug', '/public/static/artImg/ed1a5b134d636ca5d378cc117d7d91a8.png', 1, 1, 1511424911, 'admin', 7, 'Win 7', '127.0.0.1', 0, '曾梦想仗剑走天涯，后来程序出了BUG，不去了'),
(20, 1, '<p><strong style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">Vue实例初始化的对象详解</strong></p><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">Vue的实例是Vue框架的入口，其实也就是前端的ViewModel，它包含了页面中的业务逻辑处理、数据模型等，当然它也有自己的一系列的生命周期的事件钩子，辅助我们进行对整个Vue实例生成、编译、挂着、销毁等过程进行js控制。</span></p><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">﻿Vue实例的data对象：官网介绍Vue的实例的数据对象data，数据绑定离不开data里面的数据，也是Vue的核心属性。它是Vue绑定数据到HTML标签的数据源泉，另外Vue框架会自动监视data里面的数据变化，自动更新数据到HTML标签上去。本质原理是：Vue会自动将data里面的数据进行递归抓换成getter和setter，然后就可以自动更新HTML标签了，当然用getter和setter所以老的浏览器Vue支持的不够好</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\0d0bfd9ff0bae0f0e90f43aaeab049fe.png\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">Vue实例的computed：Vue的计算属性（computed)的属性会自动混入Vue的实例中。所有 getter 和 setter 的 this 上下文自动地绑定为 Vue 实例。再计算属性中定义的函数里面可以直接使用指向了vue实例的this，这就非常方便了啊</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\03d701622f8bfab26ac94bf614b6a752.png\"></p><p><br></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">Vue实例的methods：methods 将被混入到 Vue 实例中。可以直接通过 VM 实例访问这些方法，或者在指令表达式中使用。方法中的 this 自动绑定为 Vue 实例</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\8d8bfee7b0053b80f6f583813b67451a.png\"></p><p><br></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">Vue实例的watch：一个对象，键是需要观察的表达式，值是对应回调函数。值也可以是方法名，或者包含选项的对象。Vue 实例将会在实例化时调用 $watch()，遍历 watch 对象的每一个属性</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\5c43be3202d8d73e85232e0b2b544157.png\"></p><p><br></p><p><strong style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">Vue实例生命周期</strong></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">Vue实例有一个完整的生命周期，也就是从开始创建、初始化数据、编译模板、挂载Dom、渲染→更新→渲染、卸载等一系列过程，这就是Vue的生命周期。通俗说就是Vue实例从创建到销毁的过程，就是周期。</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\2db7883b63b41356ee3075a26a22a0ef.png\"></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">beforeCreate：在实例初始化之后，数据观测(data observer，开始监控Data对象数据变化)和初始化事件(init event，Vue内部初始化事件)之前被调用。</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">created：在实例已经创建完成之后被调用。实例已完成以下的配置：数据观测(data observer)，属性和方法的运算，event事件回调。挂载阶段尚未开始，$el 属性不可见。</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">beforeMount：在挂载开始之前被调用。相关的render函数首次被调用。实例已完成以下的配置：编译模板，把data里面的数据和模板生成html。注意此时还没有挂载html到页面上</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">mounted：在el 被新创建的 vm.$el 替换，并挂载到实例上去之后调用。实例已完成以下的配置：用上面编译好的html内容替换el属性指向的DOM对象。此时模板中的html渲染到了html页面中，此时一般可以做一些Ajax操作。注意mounted只会执行一次</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">beforeUpdate：在数据更新之前调用，发生在虚拟DOM重新渲染和打补丁之前。可以在该钩子中进一步地更改状态，不会触发附加的重渲染过程。</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">updated：在由于数据更改导致的虚拟DOM重新渲染和打补丁之后调用。调用时，组件DOM已经更新，所以可以执行依赖于DOM的操作。然而在大多数情况下，应该避免在此期间更改状态，因为这可能会导致更新无限循环。该钩子在服务器端渲染期间不被调用</span></p><p><br></p><p><span style=\"color: rgb(85, 85, 85);\">beforeDestroy：在实例销毁之前调用。实例仍然完全可用。</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">destroyed：在实例销毁之后调用。调用后，所有的事件监听器会被移除，所有的子实例也会被销毁。该钩子在服务器端渲染期间不被调用</span></p><p><br></p>', 'Vue的实例是Vue框架的入口，其实也就是前端的ViewModel，它包含了页面中的业务逻辑处理、数据模型等，当然它也有自己的一系列的生命周期的事件钩子，辅助我们进行对整个Vue实例生成、编译、挂着、销毁等过程进行js控制。', 'js', '/public/static/artImg/a698fbc3a3cbca1330fe6099220fd316.png', 1, 1, 1489036209, 'admin', 6, 'Win 7', '127.0.0.1', 0, 'Vue2.0实例和生命周期'),
(33, 1, '<p><span style=\"background-color: rgb(255, 255, 255); color: rgb(69, 69, 69);\">相比于主流的angular和react前端框架，vue在近年来也变得非常火热。他吸取了前两者的优点，同时社区也异常的火爆，在这里，就给大家介绍vue-cli脚手架的搭建，以免刚刚入手vue框架的学习者走更多的弯路。废话不多说，现在就开撸吧~</span></p><p><strong style=\"color: rgb(69, 69, 69);\">﻿（1）检查node版本</strong></p><p><span style=\"color: rgb(69, 69, 69);\">﻿</span><span style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">首先检查node的安装，没有安装的同学可就要去官网download一下了，附上官网网址:</span><a href=\"https://nodejs.org/en/download/\" target=\"_blank\" style=\"color: rgb(0, 102, 153); background-color: rgb(255, 255, 255);\">https://nodejs.org/en/download/</a><span style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">（傻瓜式安装就好，非常方便）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(69, 69, 69);\">﻿安装成功后在命令行查看node版本，看是否安装成功。可以使用自带的终端cmd命令行工具；windows下推荐安装git bash，可以使用linux命令</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\5d85de040e38093b1d35ddfd3438de8a.png\"></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\6012092ff82e9ea8fbe5684742a4e03a.png\"></p><p><br></p><p><strong style=\"color: rgb(69, 69, 69);\">（2）安装vue-cli脚手架</strong></p><p><span style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">先全局安装</span><strong style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">vue-cli</strong><span style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">，使用指令：</span><strong style=\"color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);\">npm install -g vue-cli</strong><span style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">，安装的过程中如果出现一只卡着不动，可以安装ctrl c</span></p><p><span style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">取消,然后再重新执行,也可以使用淘宝cnpm镜像(推荐使用淘宝cnpm镜像)</span></p><p><span style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">﻿安装淘宝cnpm镜像,使用指令：</span><span style=\"color: rgb(47, 47, 47); background-color: rgb(255, 255, 255);\">npm install -g cnpm --registry=</span><a href=\"https://registry.npm.taobao.org/\" target=\"_blank\" style=\"color: rgb(49, 148, 208); background-color: rgb(255, 255, 255);\">https://registry.npm.taobao.org</a></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\223bd7c6d28a69d1c739a6fa0bd67bf8.png\"></p><p><br></p><p><strong style=\"color: rgb(69, 69, 69);\">（3）使用vue-cli初始化webpack项目</strong></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(69, 69, 69);\">使用指令:vue init webpack app(app是项目名称),之后会在你当前磁盘下生成一个名称为app的文件夹</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\39e6630b24f14502bf9c9dcf1c98d868.png\"></p><p><br></p><p><strong style=\"color: rgb(69, 69, 69);\">（4）安装相关依赖</strong></p><p><span style=\"color: rgb(69, 69, 69);\">﻿</span><span style=\"color: rgb(69, 69, 69); background-color: rgb(255, 255, 255);\">进入app文件夹，安装相关依赖，使用指令: npm install （如果有安装淘宝cnpm镜像，可以使用：cnpm install）</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\cf9b66d1e5b844869b105f1927ca29c6.png\"></p><p><br></p><p><strong style=\"color: rgb(69, 69, 69);\">（5）启动项目</strong></p><p>使用命令: npm run dev</p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\8c698c6671da8e708d605bc17dc24d0b.png\"></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\b42990ac1239983344aa102090bfc151.png\"></p><p><br></p><p><strong style=\"color: rgb(69, 69, 69);\">（5）项目打包</strong></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(69, 69, 69);\">使用指令:npm run build,这样会在你app里生成一个dist文件夹，里面有一个index.html和static文件夹,如果双击打开index.html出现空白页面，需要修改index.html,把static前面的 \'/\'去掉</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\fb6e0c470d339072bd0fca5a5787e27b.png\"></p>', '相比于主流的angular和react前端框架，vue在近年来也变得非常火热。他吸取了前两者的优点，同时社区也异常的火爆，在这里，就给大家介绍vue-cli脚手架的搭建，以免刚刚入手vue框架的学习者走更多的弯路。', 'das', '/public/static/artImg/10b6b0062e38c29990267a3d8c660ff7.png', 1, 1, 1509358034, 'admin', 1, 'Win 7', '127.0.0.1', 0, 'vue-cli脚手架的搭建'),
(34, 1, '<p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">在平常app项目中，通常会有分享页，通过分享页扩散以达到对app的下载，而在分享页中，我们最常见的就是判断用户是使用什么手机来打开分享页的，所以这里就介绍下navigator.userAgent来判断用于手机的类型。</span></p><p><br></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">var ua=navigator.userAgent;</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">var isWindowsPhone=/(?:Windows Phone)/.test(ua);//微软手机操作系统</span></p><p>var isSymbian=/(?:SymbianOS)/.test(ua) || isWindowsPhone;//塞班</p><p>var isAndroid=/(?:Android)/.test(ua);//android</p><p>var isiOS=/(?:iOS|iPhone|iPod|iPad)/.test(ua);//ios</p><p>var isFireFox=/(?:Firefox)/.test(ua);//火狐</p><p>var isChrome=/(?:Chrome|CriOS)/.test(ua);//谷歌</p><p>var isMQQBrowser=/(?:MQQBrowser)/.test(ua);//QQ浏览器</p><p>var isWeiXin=/(?:MicroMessenger)/.test(ua);//微信内置浏览器</p><p>var isWeiBo=/(?:Weibo)/.test(ua);//微博</p><p><br></p>', '在平常app项目中，通常会有分享页，通过分享页扩散以达到对app的下载，而在分享页中，我们最常见的就是判断用户是使用什么手机来打开分享页的，所以这里就介绍下navigator.userAgent来判断用于手机的类型。', 'navigator,userAgent', '/public/static/artImg/4585e4386d7d6f0582a86fc8b19b4e76.png', 1, 1, 1498818825, 'admin', 0, 'Win 7', '127.0.0.1', 0, 'navigator.userAgent的使用'),
(35, 3, '<p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">BUG虐我千百遍，我待BUG如初恋</span></p><p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">﻿爱情真的是让每一个程序员渴望又感到烦恼</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\333bc13cc7c1b302eb984c9194b9ed53.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(25, 25, 25);\">1、每一次程序出了BUG的时候，就独自看一看大海，越看越想跳下去。</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\a2f33dd597a1b28abb3a689f6c8fe611.gif\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(25, 25, 25);\">2、走到今天真不容易，我要感谢两个人，一个是威利斯·凯利发明了空调，另一个是后裔，射落了九个太阳</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\fb092dbae61036c92aa5bae7827ac827.jpeg\"></p><p><br></p><p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">3、很多程序员是单身狗，不是找不到对象，只是觉得恋爱真的太复杂了，还是敲代码比较简单。</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\484a660fd91a703b2b6672c1d08490cf.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(25, 25, 25);\">4、你以为程序员的日子很好过？有时候想一醉解千愁，却发现连买酒的钱也没有</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\08d999efefaef82f713ae892335e38d6.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(25, 25, 25);\">5、敲代码和做人一样，一定要谦虚，一定要多听听他人的意见，然后认真的记下来对你有意见的都是谁，怼死他！</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\931146e80aa72bcd957715d25c8fcc35.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(25, 25, 25);\">6、我活到现在这个年纪，拿得起放得下的恐怕只有筷子了吧！</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(25, 25, 25);\">7、公司电脑被偷了，问技术部同事怎么办，同事说：你先重启一下。</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\6bcee17bf4b113f884208a42d7b6bbe3.jpeg\"></p><p><br></p><p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">8、请记住我是一个高冷的程序员，不要被我时常神经病迷惑</span></p><p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">9、总会有突如其来的BUG，让你瞬间爆炸，去特么的程序员</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\63d27a72b0e18c4dd5eb906c8930ed28.jpeg\"></p><p><br></p><p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">10、不要和甲方争论需求，就和不要去劝一个执意吃屎的人，他不会感谢你，还会以为你要和他抢着吃。</span></p><p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">11、你为什么总是一个人在加班，我怕半个人吓到你</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\1b1789e88ac8ccad7c8f76e7d62098d2.jpeg\"></p><p><br></p><p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">12、其实程序员过日子吧，平淡朴素就很好了，那种豪华奢侈的生活，哇塞，那肯定更好啊！</span></p><p><span style=\"color: rgb(25, 25, 25); background-color: rgb(255, 255, 255);\">﻿13、从今天起，只要你们遇到不会写的代码就和我吱一声，我可以给你们讲述一下，我不会的时候是怎么在老板的手底下苟且偷生的</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\1da1d6f78d6e1b84e709d150f50b2ab9.jpeg\"></p>', '1、每一次程序出了BUG的时候，就独自看一看大海，越看越想跳下去。2、走到今天真不容易，我要感谢两个人，一个是威利斯·凯利发明了空调，另一个是后裔，射落了九个太阳。3、很多程序员是单身狗，不是找不到对象，只是觉得恋爱真的太复杂了，还是敲代码比较简单。', '程序员', '/public/static/artImg/e061e7d2ae848103b1e913d198e2965b.png', 1, 1, 1514684147, 'admin', 5, 'Win 7', '127.0.0.1', 1, '曾梦想仗剑走天涯，后来程序出了BUG，不去了'),
(41, 1, '<h3>CSS3有哪些新特性</h3><p>1.CSS3实现圆角（border-radius），阴影（box-shadow）</p><p>2.对文字加特效（text-shadow），线性渐变（gradient），旋转（transform）</p><p>3.增加了更多的CSS选择器多背景rgba</p><p>4.在CSS3中唯一引入的伪元素是selection</p><p>5.媒体查询，多栏布局</p><p><br></p><h3>html5有哪些新特性、移除了那些元素？</h3><p>新特性：</p><p>1.拖拽释放(Draganddrop)API</p><p>2.语义化更好的内容标签（header,nav,footer,aside,article,section）</p><p>3.音频、视频API(audio,video)</p><p>4.画布(Canvas)API</p><p>5.地理(Geolocation)API</p><p>6.本地离线存储localStorage长期存储数据，浏览器关闭后数据不丢失</p><p>7.sessionStorage的数据在浏览器关闭后自动删除</p><p>8.表单控件，calendar、date、time、email、url、search</p><p>9.新的技术webworker,websocket,Geolocation</p><p><br></p><p>移除的元素：</p><p>1.纯表现的元素：basefont，big，center，font,s，strike，tt，u；</p><p>2.对可用性产生负面影响的元素：frame，frameset，noframes；</p><p><br></p><h3>简要说一下CSS的元素分类?</h3><p>块级元素：div,p,h1,form,ul,li;</p><p>行内元素：span,a,label,input,img,strong,em;</p><p><br></p><h3>CSS隐藏元素的几种方法（至少说出三种）</h3><p>Opacity:元素本身依然占据它自己的位置并对网页的布局起作用。它也将响应用户交互;</p><p>Visibility:与opacity唯一不同的是它不会响应任何用户交互。此外，元素在读屏软件中也会被隐藏;</p><p>Display:display设为none任何对该元素直接打用户交互操作都不可能生效。此外，读屏软件也不会读到元素的内容。这种方式产生的效果就像元素完全不存在;</p><p>Position:不会影响布局，能让元素保持可以操作;</p><p>Clip-path:clip-path属性还没有在IE或者Edge下被完全支持。如果要在你的clip-path中使用外部的SVG文件，浏览器支持度还要低;</p><p><br></p><h2><strong style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">CSS清楚浮动的几种方法（至少两种）</strong></h2><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">使用带clear属性的空元素</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">使用CSS的overflow属性</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">使用CSS的:after伪元素</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">使用邻接元素处理</span></p><p><br></p><h2><strong style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">页面导入样式时，使用link和@import有什么区别</strong></h2><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">link属于XHTML标签，除了加载CSS外,还能用于定义RSS,定义rel连接属性等作用；而@import是CSS提供的，只能用于加载CSS;</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">页面被加载的,link会同时被加载而@import引用的CSS会等到页面被加载完再加载</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(62, 62, 62);\">import是CSS2.1提出的,只在IE5以上才能被识,而link是XHTML标,无兼容问题</span></p><p><br></p><h2><strong style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">本地存储（Local Storage）和cookies（储存在用户本地终端上的数据）之间的区别是什么？</strong></h2><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">Cookies:服务器和客户端都可以访问；大小只有4KB左右；有有效期，过期后将会删除；</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">本地存储：只有本地浏览器端可访问数据，服务器不能访问本地存储直到故意通过POST或者GET的通道发送到服务器；每个域5MB；没有过期数据，它将保留知道用户从浏览器清除或者使用Javascript代码移除</span></p><p><br></p><h2><strong style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">如何实现浏览器内多个标签页之间的通信</strong></h2><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">调用localstorge、cookies等本地存储方式</span></p><p><br></p><h2><strong style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">你如何对网站的文件和资源进行优化</strong></h2><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">﻿文件合并、文件最小化/文件压缩、使用CDN托管、缓存的使用</span></p><p><br></p><h2><strong style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">你能描述一下渐进增强和优雅降级之间的不同吗</strong></h2><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">渐进增强progressive enhancement：针对低版本浏览器进行构建页面，保证最基本的功能，然后再针对高级浏览器进行效果、交互等改进和追加功能达到更好的用户体验</span></p><p>优雅降级graceful degradation：一开始就构建完整的功能，然后再针对低版本浏览器进行兼容。</p><p><br></p><p><br></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">区别：优雅降级是从复杂的现状开始，并试图减少用户体验的供给，而渐进增强则是从一个非常基础的，能够起作用的版本开始，并不断扩充，以适应未来环境的需要。降级（功能衰减）意味着往回看；而渐进增强则意味着朝前看，同时保证其根基处于安全地带。</span></p><p><br></p><h2><strong style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">为什么利用多个域名来存储网站资源会更有效</strong></h2><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">CDN缓存更方便、突破浏览器并发限制、节约cookie带宽、节约主域名的连接数，优化页面响应速、防止不必要的安全问题</span></p>', '最近总结了一些有关于html5和css3的一些常见面试题，希望对正在找工作的你有所帮助。css3有哪些新特性?1. CSS3实现圆角（border-radius），阴影（box-shadow）。2. 对文字加特效（text-shadow、），线性渐变（gradient），旋转（transform）', '测试', '/public/static/artImg/0b9456eb141b8340ed26517590193e0d.png', 1, 1, 1517370913, 'admin', 13, 'Win 7', '127.0.0.1', 1, 'html5和css3的一些常见面试题'),
(42, 3, '<h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">冒泡排序</strong></h3><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\edc9e3a627e1a206b28ba1eb3f26f9a6.png\"></p><p><br></p><h3><strong>统计字符串中次数最多字母</strong></h3><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\2aca79f724bd2b7a29bb136a74c8544d.png\"></p><p><br></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">数组去重</strong></h3><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\274927a41d2954052da1946d27c98b63.png\"></p><p><br></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">数组中最大值与最小值的差</strong></h3><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\729e2b509a833ac53a5e9b14f7c180c2.png\"></p><p><br></p><h3><strong style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">阶乘</strong></h3><p><img src=\"http://www.myblog.com/public/uploadImg/article/20180311\\46fbbf5c7706e705ace8df82aac4a113.png\"></p>', '虽说我们很多时候前端很少有机会接触到算法。但是面试的时候总会面一些算法的问题,实际上这些算法也是最基础的算法，在这里就简单列出一些面试常见的问题，帮助大家巩固一些知识。', '面试,js', '/public/static/artImg/f009d77411c614886e119b601f6083f2.png', 1, 1, 1501215371, 'admin', 5, 'Win 7', '127.0.0.1', 0, '面试时常见的javascript试题'),
(43, 3, '<h3><strong>前端调试的工具：</strong></h3><h4><strong> </strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">Firefox的firebug、Chrome的开发工具、Emmet</span></h4><p><br></p><h3><strong style=\"color: rgb(85, 85, 85);\">简单描述mysql中，索引，主键，唯一索引，联合索引的区别，对数据库的性能有什么影响（从读写两方面）</strong></h3><p><span style=\"color: rgb(85, 85, 85); background-color: rgb(255, 255, 255);\">索引是一种特殊的文件(InnoDB数据表上的索引是表空间的一个组成部分)，它们包含着对数据表里所有记录的引用指针。</span></p><p><span style=\"color: rgb(85, 85, 85); background-color: rgb(255, 255, 255);\">﻿普通索引(由关键字KEY或INDEX定义的索引)的唯一任务是加快对数据的访问速度。</span></p><p><span style=\"color: rgb(85, 85, 85); background-color: rgb(255, 255, 255);\">普通索引允许被索引的数据列包含重复的值。如果能确定某个数据列将只包含彼此各不相同的值，在为这个数据列创建索引的时候就应该用关键字UNIQUE把它定义为一个唯一索引。也就是说，唯一索引可以保证数据记录的唯一性。</span></p><p><span style=\"color: rgb(85, 85, 85); background-color: rgb(255, 255, 255);\">主键，是一种特殊的唯一索引，在一张表中只能定义一个主键索引，主键用于唯一标识一条记录，使用关键字 PRIMARY KEY 来创建。</span></p><p><span style=\"color: rgb(85, 85, 85); background-color: rgb(255, 255, 255);\">索引可以覆盖多个数据列，如像INDEX(columnA, columnB)索引，这就是联合索引。</span></p><p><span style=\"color: rgb(85, 85, 85); background-color: rgb(255, 255, 255);\">﻿索引可以极大的提高数据的查询速度，但是会降低插入、删除、更新表的速度，因为在执行这些写操作时，还要操作索引文件。</span></p><p><br></p><h3><strong>数据库中的事务是什么?</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。ACID 四大特性,原子性、隔离性、一致性、持久性。</span></p><p><br></p><h3><strong>了解XSS攻击吗？如何防止？</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">XSS是跨站脚本攻击，首先是利用跨站脚本漏洞以一个特权模式去执行攻击者构造的脚本，然后利用不安全的Activex控件执行恶意的行为。使用htmlspecialchars()函数对提交的内容进行过滤，使字符串里面的特殊符号实体化。</span></p><p><br></p><h3><strong>SQL注入漏洞产生的原因？如何防止？</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">SQL注入产生的原因：程序开发过程中不注意规范书写sql语句和对特殊字符进行过滤，导致客户端可以通过全局变量POST和GET提交一些sql语句正常执行。</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">防止SQL注入的方式：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">1.开启配置文件中的magic_quotes_gpc 和 magic_quotes_runtime设置</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">2.执行sql语句时使用addslashes进行sql语句转换</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">3.sql语句书写尽量不要省略双引号和单引号。</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">4.过滤掉sql语句中的一些关键词：update、insert、delete、select、 * 。</span></p><p>5.<span style=\"color: rgb(85, 85, 85);\">提高数据库表和字段的命名技巧，对一些重要的字段根据程序的特点命名，取不易被猜到的</span></p><p><span style=\"color: rgb(85, 85, 85);\">6.</span>Php配置文件中设置register_globals为off,关闭全局变量注册</p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">7.</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">控制错误信息，不要在浏览器上输出错误信息，将错误信息写到日志文件中</span></p><p><br></p><h3><strong style=\"color: rgb(85, 85, 85);\">PHP网站的主要攻击方式有哪些？</strong></h3><p>命令注入(Command Injection)</p><p>eval 注入(Eval Injection)</p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\"> 客户端脚本攻击(Script Insertion)</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\"> 跨网站脚本攻击(Cross Site Scripting, XSS)</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\"> SQL 注入攻击(SQL injection)</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\"> 跨网站请求伪造攻击(Cross Site Request Forgeries, CSRF)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">Session 会话劫持(Session Hijacking)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">Session 固定攻击(Session Fixation)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">HTTP 响应拆分攻击(HTTP Response Splitting)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">文件上传漏洞(File Upload Attack)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">目录穿越漏洞(Directory Traversal)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">远程文件包含攻击(Remote Inclusion)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">动态函数注入攻击(Dynamic Variable Evaluation)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">URL 攻击(URL attack)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">表单提交欺骗攻击(Spoofed Form Submissions)</span></p><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">﻿HTTP 请求欺骗攻击(Spoofed HTTP Requests)</span></p><p><br></p><h3><strong>框架中什么是单一入口和多入口 ， 单一入口的优缺点？</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">多口就是通过访问不同的文件来完成用户请求。单一入口只 web 程序所有的请求都指向一个脚本文件的。</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">单一入口更容易控制权限，方便对 http 请求可以进行安全性检查。缺点就是URL 看起来不那么美观，特别是对搜索引擎来说不友好。</span></p><p><br></p><h3><strong>关系型数据库，索引的目的是什么？</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">快速访问数据表中的特定信息，提高检索速度</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">创建唯一性索引，保证数据库表中每一行数据的唯一性</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">加速表和表之间的连接</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">使用分组和排序子句进行数据检索时，可以显著减少查询中分组和排序的时间</span></p><p><br></p><h3><strong style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">简述在MySQL数据库中MyISAM和InnoDB的区别?</strong></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">InnoDB</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">存储引擎</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">:主要面向OLTP(Online Transaction Processing，在线事务处理)方面的应用，是第一个完整支持ACID事务的存储引擎(BDB第一个支持事务的存储引擎，已经停止开发)。</span></p><p><br></p><h3><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">特点:</span></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">行锁设计、支持外键；</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">支持类似于Oracle风格的一致性非锁定读(即：默认情况下读取操作不会产生锁)；</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">InnoDB将数据放在一个逻辑的表空间中，由InnoDB自身进行管理。从MySQL4.1版本开始，可以将每个InnoDB存储引擎的表单独存放到一个独立的ibd文件中；</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">﻿InnoDB通过使用MVCC(多版本并发控制：读不会阻塞写，写也不会阻塞读)来获得高并发性，并且实现了SQL标准的4种隔离级别(默认为REPEATABLE级别)；</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">InnoDB还提供了插入缓冲(insert buffer)、二次写(double write)、自适应哈希索引(adaptive hash index)、预读(read ahead)等高性能和高可用的功能；</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">InnoDB采用了聚集(clustered)的方式来存储表中的数据，每张标的存储都按主键的顺序存放(如果没有显式的在建表时指定主键，InnoDB会为每一行生成一个6字节的ROWID，并以此作为主键)；</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">InnoDB表会有三个隐藏字段：除了上面提到了6字节的DB_ROW_ID外，还有6字节的DB_TX_ID(事务ID)和7字节的DB_ROLL_PTR(指向对应回滚段的地址)。这个可以通过innodb monitor看到；</span></p><p><br></p><h3><br></h3><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">myisam</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">存储引擎</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">是MySQL官方提供的存储引擎，主要面向OLAP(Online Analytical Processing,在线分析处理)方面的应用。</span></p><p><br></p><h3><span style=\"background-color: rgb(255, 255, 255); color: rgb(85, 85, 85);\">特点:</span></h3><p><span style=\"color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">不支持事务，支持表所和全文索引。操作速度快；</span></p><p><span style=\"color: rgb(85, 85, 85); background-color: rgb(255, 255, 255);\">﻿MyISAM存储引擎表由MYD和MYI组成，MYD用来存放数据文件，MYI用来存放索引文件。MySQL数据库只缓存其索引文件，数据文件的缓存交给操作系统本身来完成；</span></p><h3><br></h3>', 'isset： 判断变量是否定义或者是否为空，（1） 变量存在返回ture，否则返回false。（2）变量定义不赋值返回false。（3） unset一个变量，返回false。（4） 变量赋值为 null，返回false', '面试、php', '/public/static/artImg/c75e9668d17c0bf82a3f61ad80aa6c7a.png', 1, 1, 1490668769, 'admin', 25, 'Win 7', '127.0.0.1', 1, 'php常见的面试题'),
(44, 3, '<p><span style=\"background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);\">    曾经梦想仗剑走天涯，可谁曾想，一入IT深似海，曾经梦想赴沧海。总是有写不完的程序，改不完的bug，扯不完的皮。产品一筹莫展的时候最喜欢拉着俺们程序员开会了，乱七八糟的需求理不清的思路，拉着我们扯一会儿皮，问题就迎刃而解啦。</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/20180305\\9c59f65408cb3c53c945ec674819d0cd.jpg\"></p><p><br></p><p>别看我大程序员总是不善言辞，木讷呆板，论讲程序逻辑，总是有说不完的话。巴拉巴拉从最初原型讲到了数据库设计，从数据库设计讲到了各个部门联调的每个点，从业务设计讲到了数据架构，一直讲到产品听不懂才肯罢休。每一次调研，每一次开会，每一次沟通，都离不开程序员强大的逻辑思维。</p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/20180305\\8f92ebe4e01ce0e63cb8d707cf912f41.jpg\"></p><p><br></p><p>可是这些有什么卵用，bug一只一只的从眼前跳过，心里总是有说不出的苦楚。不要问我节假日为啥不出去看世界，对不起，我大把的时间都是用来修复线上的Bug。谁得热点评论那么多，谁得粉丝多得崩了库。谁的文章发不了，谁的动态没了影。电话响个不停，一直催促着bug，bug，快点改。每到夜深人静的时候，我就翻开儿时写得那个小本本，本子上记录着长大了我要浪迹天涯。可是长大了，身边唯一陪伴得一只只bug，看世界的机会就留给我的代码去看吧，我的心中只有代码。</p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/20180305\\7ce1e7ff0911a3994103868fc805446a.jpg\"></p>', '曾经梦想仗剑走天涯，可谁曾想，一入IT深似海，曾经梦想赴沧海。总是有写不完的程序，改不完的bug，扯不完的皮。产品一筹莫展的时候最喜欢拉着俺们程序员开会了，乱七八糟的需求理不清的思路，拉着我们扯一会儿皮，问题就迎刃而解啦。', '闲聊', '/public/static/artImg/aec9c26fa31e4210b16a3699900e8921.png', 1, 0, 1512104214, 'admin', 57, 'Win 7', '127.0.0.1', 1, '曾梦想仗剑走天涯，后来因为bug太多就没去');

-- --------------------------------------------------------

--
-- 表的结构 `fh_article_c`
--

CREATE TABLE `fh_article_c` (
  `ac_id` int(11) NOT NULL COMMENT '主键',
  `ac_pid` int(11) NOT NULL COMMENT '评论id',
  `ac_name` varchar(64) NOT NULL COMMENT '评论用户',
  `ac_img` varchar(128) NOT NULL COMMENT '用户头像',
  `ac_content` text NOT NULL COMMENT '评论内容',
  `ac_time` int(11) NOT NULL COMMENT '评论时间',
  `ac_system` varchar(32) NOT NULL COMMENT '设备系统',
  `ac_ip` varchar(16) NOT NULL COMMENT '用户IP',
  `ac_rename` varchar(64) DEFAULT NULL COMMENT '回复人',
  `ac_reimg` varchar(128) DEFAULT NULL COMMENT '回复人头像',
  `ac_recontent` text COMMENT '回复内容',
  `ac_retime` int(11) DEFAULT NULL COMMENT '回复时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_article_c`
--

INSERT INTO `fh_article_c` (`ac_id`, `ac_pid`, `ac_name`, `ac_img`, `ac_content`, `ac_time`, `ac_system`, `ac_ip`, `ac_rename`, `ac_reimg`, `ac_recontent`, `ac_retime`) VALUES
(1, 9, '游客', '/public/static/default/default.png', '其实我也是个假的程序员[mr:/2]', 1509682051, 'Win 7', '127.0.0.1', 'admin', '/Uploads/comment/1509689535.png', '其实我也是[em_11]', 1509689535),
(2, 8, '游客', '/public/static/default/default.png', '博主好厉害[em_2]', 1509694759, 'Win 7', '127.0.0.1', 'admin', '/Uploads/comment/1510044814.png', '谢谢夸奖，你也可以的[em_11]', 1510044814),
(3, 8, '游客', '/public/static/default/default.png', '文笔非常好[em_63]', 1511253682, 'Win 7', '127.0.0.1', 'admin', '/public/static/userImg/3c394791072f51289f24233ba42ee2e6.jpg', '谢谢:blush:', 1519712068),
(4, 18, '游客', '/public/static/default/default.png', '按着博主的步骤终于搭建成功了，谢谢[em_13]', 1511505640, 'Win 7', '127.0.0.1', NULL, NULL, NULL, NULL),
(5, 11, '游客', '/public/static/default/default.png', '我又来了', 1512355242, 'iPhone', '127.0.0.1', NULL, NULL, NULL, NULL),
(6, 11, '游客', '/public/static/default/default.png', '我又来了', 1512355245, 'iPhone', '127.0.0.1', NULL, NULL, NULL, NULL),
(7, 16, '游客', '/public/static/default/default.png', '刚刚看了，对面试非常有用', 1512370251, 'iPhone', '127.0.0.1', NULL, NULL, NULL, NULL),
(8, 43, '游客', '/public/static/default/default.png', ':smile:', 1520666457, 'win 7', '127.0.0.1', NULL, NULL, NULL, NULL),
(9, 44, '游客', '/public/static/default/default.png', ':smiling_imp:', 1520671260, 'win 7', '127.0.0.1', NULL, NULL, NULL, NULL),
(10, 41, '游客', '/public/static/default/default.png', '谢谢博主分享:smile:', 1520778670, 'win 7', '127.0.0.1', NULL, NULL, NULL, NULL),
(11, 35, '游客', '/public/static/default/default.png', '说多都是泪:sweat:', 1520778745, 'win 7', '127.0.0.1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fh_board`
--

CREATE TABLE `fh_board` (
  `b_id` int(11) NOT NULL COMMENT '主键',
  `b_name` varchar(64) NOT NULL COMMENT '用户名',
  `b_img` varchar(64) NOT NULL COMMENT '用户头像',
  `b_content` text NOT NULL COMMENT '留言内容',
  `b_time` int(11) NOT NULL COMMENT '留言时间',
  `b_ip` varchar(16) NOT NULL COMMENT 'ip地址',
  `b_system` varchar(16) NOT NULL COMMENT '系统',
  `b_rename` varchar(64) DEFAULT NULL COMMENT '回复人',
  `b_reimg` varchar(64) DEFAULT NULL COMMENT '回复人头像',
  `b_retime` int(11) DEFAULT NULL COMMENT '回复时间',
  `b_recontent` text COMMENT '回复内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_board`
--

INSERT INTO `fh_board` (`b_id`, `b_name`, `b_img`, `b_content`, `b_time`, `b_ip`, `b_system`, `b_rename`, `b_reimg`, `b_retime`, `b_recontent`) VALUES
(1, '游客', '/public/static/default/default.png', '博主能教教我吗', 1510213126, '127.0.0.1', 'Win 7', 'admin', '/public/static/userImg/3c394791072f51289f24233ba42ee2e6.jpg', 1510215485, '好的:no_mouth:'),
(2, '游客', '/public/static/default/default.png', '你好啊,博主[em_13]', 1511163870, '127.0.0.1', 'Win 7', 'admin', '/public/static/userImg/3c394791072f51289f24233ba42ee2e6.jpg', 1513910002, '你好:smile:'),
(3, '游客', '/public/static/default/default.png', '不错不错,可以借鉴一下', 1512123851, '127.0.0.1', 'iPhone', NULL, NULL, NULL, NULL),
(4, '游客', '/public/static/default/default.png', '你好啊', 1512370332, '127.0.0.1', 'iPhone', 'admin', '/public/static/userImg/3c394791072f51289f24233ba42ee2e6.jpg', 1513913199, '你好:smirk:'),
(5, '游客', '/public/static/default/default.png', '请问你的博客用到什么技术:kissing_heart:', 1520066353, '127.0.0.1', 'win7', NULL, NULL, NULL, NULL),
(6, '游客', '/public/static/default/default.png', '博主，这是你2.0版本的博主吗', 1520066592, '127.0.0.1', 'win7', NULL, NULL, NULL, NULL),
(7, '游客', '/public/static/default/38.png', '请问你的博客是用什么框架写的', 1521378478, '127.0.0.1', 'win7', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fh_cat`
--

CREATE TABLE `fh_cat` (
  `c_id` int(11) NOT NULL COMMENT '主键',
  `c_name` varchar(64) NOT NULL COMMENT '栏目名',
  `c_rename` varchar(64) DEFAULT NULL COMMENT '栏目别名',
  `c_keyword` varchar(32) NOT NULL COMMENT '关键字',
  `c_desc` varchar(64) NOT NULL COMMENT '描述',
  `c_time` int(11) NOT NULL COMMENT '发布时间',
  `c_root` varchar(64) NOT NULL COMMENT '添加人',
  `c_show` int(11) NOT NULL COMMENT '显示:0为显示1为不显',
  `c_system` varchar(32) NOT NULL COMMENT '系统',
  `c_ip` varchar(16) NOT NULL COMMENT 'IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_cat`
--

INSERT INTO `fh_cat` (`c_id`, `c_name`, `c_rename`, `c_keyword`, `c_desc`, `c_time`, `c_root`, `c_show`, `c_system`, `c_ip`) VALUES
(1, '学习笔记', '学习笔记', '学习,笔记', '自己学习上的一些笔记总结和经验分享', 1509001450, 'admin', 1, 'iPhone', '127.0.0.1'),
(3, '闲言碎语', '闲言碎语', '闲言,碎语', '在生活中的感悟和偶尔的牢骚', 1509006803, 'admin', 1, 'Win 7', '127.0.0.1'),
(4, '热点分享', '热点分享', '热点', '转载和整理一些互联网上的最新的资讯在博客上和大家分享', 1509006860, 'admin', 1, 'Win 7', '127.0.0.1'),
(5, '小鱼头条', 'Head rod of small fish', '头条,小鱼', '如果传播是一种情感，那么就是爱', 1517454130, 'admin', 1, 'Win7', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `fh_log`
--

CREATE TABLE `fh_log` (
  `l_id` int(11) NOT NULL COMMENT '主键',
  `l_name` varchar(128) NOT NULL COMMENT '标题',
  `l_img` varchar(128) NOT NULL COMMENT '标题图片',
  `l_desc` text NOT NULL COMMENT '描述',
  `l_content` text NOT NULL COMMENT '内容',
  `l_show` int(11) NOT NULL COMMENT '公开度:1为显示0为不显',
  `l_time` int(11) NOT NULL COMMENT '发布时间',
  `l_system` varchar(32) NOT NULL COMMENT '系统',
  `l_ip` varchar(16) NOT NULL COMMENT 'ip地址',
  `l_root` varchar(64) NOT NULL COMMENT '发布人',
  `l_hit` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `l_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `l_original` int(11) NOT NULL COMMENT '是否原创:1是0不是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_log`
--

INSERT INTO `fh_log` (`l_id`, `l_name`, `l_img`, `l_desc`, `l_content`, `l_show`, `l_time`, `l_system`, `l_ip`, `l_root`, `l_hit`, `l_num`, `l_original`) VALUES
(1, '正儿八经得思考有点怪', '/public/static/logImg/7a5bf360d5db7a4b72ba0b11862aa79f.jpg', '小时候，家贫，总是喜欢同学戴得那个毛茸茸的帽子，镶嵌着蓝色的蝴蝶，在我心里分外美丽。我总是和老妈说，我也想要一顶那样的帽子，也就十来块钱，为啥不给我买。每当我特别迷恋一件东西时，我就忘记家贫这个事实。我总是吵着闹着说了好几次，可是我的老妈总是在计算着下一个月的米面钱。那个时候的我，特别羡慕我得那个同学，凭什么他可以穿着漂亮的衣服，而我就没有呢？我一直在寻求解释和追问，始终找不到答案。', '&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 28px; text-indent: 2em; color: rgb(93, 93, 93); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 14px; white-space: normal; background-color: rgb(255, 251, 240);&quot;&gt;博客更新的断断续续，126邮箱也收到很多网友的来信，很感谢大家对叶子博客的关注。其实，入行五年了，我觉得自己进步不是那么大。偶尔看看书，也是静不下心来。有的人说了，或许年龄越大，功利性太强了，走着走着似乎忘记了自己的初心了。我最初的理想，就是当个自由自在的写手，写尽人生的喜怒哀乐，悲欢离合。可是后来，我发现我好像不太适合做写手，我理解不了太多事，我自以为是，我相信自己眼睛看到的，我无法揣摩面具背后的真实面孔。后来看开了就想清楚了，其实没有那么复杂，每个人心中都是一团火，大家看到得却是烟。&lt;/p&gt;&lt;p style=&quot;text-align:center;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 28px; text-indent: 2em; color: rgb(93, 93, 93); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 14px; white-space: normal; background-color: rgb(255, 251, 240);&quot;&gt;&lt;img src=&quot;/Uploads/image/20171027/1509074546768504.jpg&quot; alt=&quot;1509074546768504.jpg&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; display: block; width: 384px; height: 646px;&quot; width=&quot;384&quot; height=&quot;646&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 28px; text-indent: 2em; color: rgb(93, 93, 93); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 14px; white-space: normal; background-color: rgb(255, 251, 240);&quot;&gt;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 28px; text-indent: 2em; color: rgb(93, 93, 93); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 14px; white-space: normal; background-color: rgb(255, 251, 240);&quot;&gt;所幸，与代码结缘，我觉得我还是适合写代码，最起码程序是真实的，只会有不同的写法，但是不会像人一样有多种面孔。可是，什么事都是有利有弊的。写代码久了，好像习惯和机器打交道，特别较真，特别认死理，错了就是错了，对了就是对了。可是在工作中，这样一点儿也不好，典型的吃力不讨好。我不会润色语言去赞美某个leader，我觉得不好我就努力提出来，我忘记了人的面孔是多变的，人心是难测的，会说话也是软实力。所以大家在学习技术的路上，不要忘记学习说话之道。我这个人平时喜欢开玩笑，今天突然正儿八经的讲人生大道理，好像有点怪。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, 1511231978, 'Win 7', '127.0.0.1', 'admin', 14, 1, 1),
(2, '广州游记', '/public/static/logImg/e4b691266c849a2e5d521b60eba02700.jpg', '之前去过好几次广州塔了，这次在500px上看到广州塔有一个角度拍得很好，查地图推算是在猎德大桥取景的，于是就专门挑了一天专门走了一下这个地方。 下午两点多从黄庄出发，搭公交到京溪南方医院D入口换乘地铁，进地铁之后就直接去了林和西换成APM线，如果要感受一下无人驾驶列车的神奇，一定要走到最里面的那一节车厢，那里是往广州塔方向的车头。我看到很多人看到列车从里面那个方向开过来之后立马冲到“车头”去坐，殊不知列车一会是倒过来反方向开的……周末或者寒暑假的话就车头基本就不要想了，一大堆家长带着孩子霸占了车头的黄金位置，哈哈~~', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">之前去过好几次</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10088.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgb(77, 77, 77);\">广州</a><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">塔了，这次在500px上看到</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10088.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgb(77, 77, 77);\">广州</a><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">塔有一个角度拍得很好，查地图推算是在猎德大桥取景的，于是就专门挑了一天专门走了一下这个地方。</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">下午两点多从黄庄出发，搭公交到京溪南方医院D入口换乘地铁，进地铁之后就直接去了林和西换成APM线，如果要感受一下无人驾驶列车的神奇，一定要走到最里面的那一节车厢，那里是往</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10088.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgb(77, 77, 77);\">广州</a><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">塔方向的车头。我看到很多人看到列车从里面那个方向开过来之后立马冲到“车头”去坐，殊不知列车一会是倒过来反方向开的……周末或者寒暑假的话就车头基本就不要想了，一大堆家长带着孩子霸占了车头的黄金位置，哈哈~~</span></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\75768e49c69249c27f69ef4a6c6ab473.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">APM（旅客自动捷运系统）的轨道是单轨的，行驶起来晃动比较厉害，加上隧道内光线条件比较一般，快门速度不快（ISO1250，f3.5，0.6s），所以手持拍摄是个大挑战……</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">城市中轴线上的中信广场，正面面对小蛮腰，无比佩服</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10088.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgb(77, 77, 77);\">广州</a><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">的城市设计师，寸土寸金的CBD中信，还有那么大一个花城广场，中轴线上数公里内无高大建筑物遮挡~！双塔左右护法~！</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">感觉没什么好拍了，几盆花的颜色比较鲜艳，吸引了我一阵，长焦举起，shot！</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">对面的</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/14674.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgb(77, 77, 77);\">广东</a><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">省博物馆是我的下一站~这两天就要去…和图书馆相比，外部造型更加有东方神韵！中西结合，相得映彰。</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">海心沙岛上的亚运展馆局部，吸引我的就是这柔中带刚的线条感，大写的赞...</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">当然了，说到建筑的线条，小蛮腰这柔中带刚的特质应该是国际首屈一指的建筑大作了！</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\878b1ef2dd79f92ea4cd1f1d61c22811.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">这里是不是还能看到客机飞过，这次看到一架飞得很低，然后还绕着</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10088.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgb(77, 77, 77);\">广州</a><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">塔拐了个弯是个什么情况？机师没时间下来逛，转个弯看下就走了？</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\3b11674fad808b91392c0556ea341f92.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">在长堤边的夜游港口没有开放，封起来了</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">是这个地方了，但是我去的时候是下午了，背光比较严重，后期调整出来的。如果是上午的话就非常好了，而且最好是晴天少云的时候，再加上电车经过效果就更好了。</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\8a6d3b13d8fd10031159189640c83556.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">有轨电车速度不快，大概在40-50km左右，这段线路是珠江边的无敌江景线路，对面就是著名的天河CBD商圈，高楼大厦尽收眼底。</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">有轨电车在没有通行的时候是可以走专用的</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/18875.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgb(77, 77, 77);\">通道</a><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">横穿的，交叉路口位置有一个红色的按钮，要通过的时候按下红色按钮信号灯会转成红色提示电车注意避让。</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">这个地方也吸引了很多市民在这里跑步健身。确实，慢跑在长堤上，珠江两侧美景尽收眼底，好不惬意。</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\1d63a32876e8322e3b18578f2d1ab016.jpeg\"></p><p><br></p><p><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">主角，</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10088.html\" target=\"_blank\" style=\"color: rgb(77, 77, 77); background-color: rgb(255, 255, 255);\">广州</a><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">地铁有轨电车，海上</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/141880.html\" target=\"_blank\" style=\"color: rgb(77, 77, 77); background-color: rgb(255, 255, 255);\">丝绸之路</a><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">专列。还有各种主题的列车，这里就没有一一去拍摄了，还有很多路要走…</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\f210c7e423154384f53cc22674da1678.jpeg\"></p><p><br></p><p><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">车身通体是</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10088.html\" target=\"_blank\" style=\"color: rgb(77, 77, 77); background-color: rgb(255, 255, 255);\">广州</a><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">的宣传画，结合这绿草如茵的车行道和两面的红花，别提多浪漫了。应该叫浪漫专列才对……</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\19edb06929c3b0c62334b2bed87dcfbf.jpeg\"></p><p><br></p><p><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">“车辆进站，请小心列车与站台之间的空隙……”</span></p><p><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">“请上了车的乘客，往车厢中部走，下一站，……”</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\5f7cce0434a7297b19cf71cfcb044788.jpeg\"></p><p><br></p><p><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">可以在站台自动售票机买票，上车后读取二维码，也可以刷羊城通岭</span><a href=\"http://www.mafengwo.cn/travel-scenic-spot/mafengwo/11558.html\" target=\"_blank\" style=\"color: rgb(77, 77, 77); background-color: rgb(255, 255, 255);\">南通</a><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">乘车。</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\0cb2c52f8534d91f14053e9db8e4b7d6.jpeg\"></p><p><br></p><p><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">有轨电车共设11站，每一站都有可玩的地方，这次主要去第三站，猎德大桥南</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\3fa3fc6831bb4960a369b94510781792.jpeg\"></p><p><br></p><p><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">这应该是绿化程度最高的一条公交线路了吧……连车站都是花花绿绿的……</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\51858a77350a59aa4b909d7fe41e905a.jpeg\"></p>', 1, 1509960550, 'Win 7', '127.0.0.1', 'admin', 3, 0, 1),
(3, '在广州做个文艺控，去这几个地方就够了！', '/public/static/logImg/5b8cf50bcd387e6a2fed2498a20f9a0f.jpg', '提起广州，你会想起什么？是小蛮腰、珠江夜景，还是让人垂涎欲滴的各种小吃美食？然而...广州绝不止如此，广州有很多种美，其中有一种美，叫做“文艺”。广州文艺的地方有很多，那最文艺的地方在哪里？这不，情人节快到了，我们为你精心准备了一个特别清单，快快收藏起来，带着心爱的TA一起去逛逛吧！', '<p><span style=\"background-color: rgb(250, 251, 253); color: rgb(71, 71, 71);\">提起广州，你会想起什么？是小蛮腰、珠江夜景，还是让人垂涎欲滴的各种小吃美食？然而...广州绝不止如此，广州有很多种美，其中有一种美，叫做“文艺”。广州文艺的地方有很多，那最文艺的地方在哪里？这不，情人节快到了，我们为你精心准备了一个特别清单，快快收藏起来，带着心爱的TA一起去逛逛吧！</span></p><p><br></p><h3><strong>沙面|崭新的欧陆风情</strong></h3><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\8564e3efb77ccd738aee6bff8182e1b3.jpeg\"></p><p><span style=\"background-color: rgb(250, 251, 253); color: rgb(71, 71, 71);\">沙面，旧称“拾翠洲”。单是看它的名字，就知道它有多小清新了。全长九百米的沙面小街是全广州最有异国情调的建筑群，也是本地著名的外事游览区和历史文物保护区。漫步在这条小街上，你能看到许许多多独具欧洲风情的洋行、教堂和住宅，榕树下的小庭院，街灯下的长凳，优雅的小椅子，还有别具一格的咖啡馆、餐厅和酒吧。每一个角落，都流淌着欧洲的气息，每一个瞬间都让你倍感浪漫与清新，每一秒都忍不住拿起相机，捕捉眼前的一切美丽。某个风和日丽的午后，来到这里，看着光透过树梢打在建筑上折射出斑驳的光影，你会感到岁月时光的缓缓流淌，感受到与众不同的老广魅力。</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\01a29996ad8002258b4e1846e7f3929d.jpeg\"></p><p><span style=\"color: rgb(71, 71, 71); background-color: rgb(250, 251, 253);\">沙面不可错过的拍摄地点：极具欧陆风情建筑的沙面北街、最有历史感的角落的台湾银行旧址、拥有落叶小街景的沙面南街、最绿意盎然的沙面中部绿道和最受欢迎的露德圣母堂。</span></p><p><br></p><h3><strong>红专厂|广州的“798”</strong></h3><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\7d0f35f28932cc0c9035ae927ff6ca95.jpeg\"></p><p><span style=\"color: rgb(71, 71, 71); background-color: rgb(250, 251, 253);\">由1956年中国最大的罐头厂——广州罐头厂改造而成的红砖厂创意园，算得上是广州第一家非地产包装、比较有名气的创意园区。整个园区的感觉很像798。在这里，你能看到墙上斑驳的岁月痕迹和上世纪的口号标语，也能看到各种在艺术家手下重新焕发“生机”的的红砖厂房和老街道，感受到广州最有Bigger的创意与文艺。在这里，随便摆几个pose，无需单反，也可以拍出“时尚大片”里有过的清新和自在。如果你是不折不扣的文艺控，那么，请一定要去这里。</span></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\c8999ca5516043450732abfa53871a39.jpeg\"></p><p><br></p><p><span style=\"color: rgb(71, 71, 71); background-color: rgb(250, 251, 253);\">广州实乃文艺胜地，类似的创意园有很多，除了比较有名的红砖厂之外，还特别推荐几个相对小众一点的，比如：T.I.T.客村创意园、西村原创元素创意园、罗冲围唐人文化码头创意园、1850创意园、羊城创意园、289文艺Park、东方红创意园，非常的文艺小清新。</span></p><p><br></p><h3><strong style=\"color: rgb(71, 71, 71); background-color: rgb(250, 251, 253);\">太古仓|白鹅潭畔的“城市客厅”</strong></h3><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\3c96dd73af0d3e9c5b8710e7135de683.jpeg\"></p><p><br></p><p><span style=\"color: rgb(71, 71, 71); background-color: rgb(250, 251, 253);\">位于广州市海珠区的西侧，与著名的白鹅潭和芳村隔江相望的太古仓，在上个世纪是广州非常重要的仓储和码头。近百年来，经过了历史的洗涤，它虽已卸下了作为码头所承担的一切“重担”，但如今经过一系列的规划设计，它又被赋予了“城市客厅”这一新的使命。在江边码头漫步，吹着舒适的微风，头顶蓝天白云，看着温柔的阳光洒在落地窗上，一边是充满着历史气息的红砖旧瓦，一边是牵手相伴心爱的TA，心情是前所未有的明朗。</span></p><p><br></p><h3><strong>石围塘火车站|怀旧文艺风</strong></h3><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\89aaa45312aee2d78849127f881ea497.jpeg\"></p><p><span style=\"background-color: rgb(250, 251, 253); color: rgb(71, 71, 71);\">作为广州现存最古老的火车站，石围塘火车站是广州如今现存最老的火车站，目前是广茂铁路线上的一座二等站，仍然在运行。很难想象，在广州这座城市的边上，还有这么一个犄角旮旯地，带着几分清冷，又带着说不清的落寞，充满了满满的文艺复古气息。在这里，你能看到锈迹斑斑的铁轨，感受到岁月的流淌和历史的变迁，置身其中，仿佛也同这火车站一起经历并见证了这些沧海桑田。不过最美的还是夕阳西下，整条铁轨被夕阳的“金色茶汤”所笼罩，美出一种境界。</span></p><p><br></p><h3><strong>东山口|一代老广的日常缩影</strong></h3><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\159bf29ba32cd9740efd13700419bd77.jpeg\"></p><p><span style=\"background-color: rgb(250, 251, 253); color: rgb(71, 71, 71);\">东山口作为广州最有历史的老城区之一，可以说是本地人日常生活的缩影，充满着浓浓的市井味和生活气息。然而不仅如此，这里还是文艺控来到广州必打卡的文艺小清新胜地。漫步在东山口，你会晃神，错以为一不小心乘坐了哆啦A梦的时光机，迈入了一条“时光隧道”。在这里，你可以踩过古树绿荫下的斑驳光影，驻足在独具岭南特色的小洋楼前，走走停停，或是在某一个小资的咖啡馆喝一杯坐上一下午，尽情地享受这人生中难得的片刻惬意。</span></p><p><br></p><h3><strong>小洲村|广式“鼓浪屿”</strong></h3><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\649342eb454c8f4fcd07b773d604ffc8.jpeg\"></p><p><span style=\"background-color: rgb(250, 251, 253); color: rgb(71, 71, 71);\">在广州，有这样一个“敞开”的世外桃园，一砖一瓦砌成了岭南水乡文化，石板路铺成了这座城市的历史长廊，这就是一个名叫“小洲村”的地方。始建于元末明初的小洲村，至今仍保留着岭南水乡风韵的美感。走进这里，你首先会看到清凌凌的河水，枕河而居的旧式民居，顶上的琉璃瓦片辉映着波光粼粼的河面，迈着慵懒的步伐转过下一个拐角，朴实淡雅的古老庙宇在一片绿树婆娑的掩映下，闯入你的眼帘，让你突然间错以为时光交错，岁月凝固。</span></p><p><br></p><p><br></p><p><br></p><p><br></p>', 1, 1511235654, 'Win 7', '127.0.0.1', 'admin', 10, 0, 1),
(4, '广州必体验', '/public/static/logImg/2045413ba228f1e3fb267443fda41a56.jpg', '广州塔是广州的地标性景点，坐落在珠江沿岸，与广州商业中心“珠江新城”隔江相望。广州塔自2010年落成以来便以600米的绝对高度摘下了中国第一高塔的桂冠。在这样一座高耸的观光塔顶部有着多项吉尼斯世界纪录项目。其中包括423米的世界最高旋转餐厅；488米的世界最高户外观景平台；454米的世界最高摩天轮及485米的世界最高跳楼机（自由落体距离30米）。无数精彩的观光、娱乐项目给来广州塔游玩的游客带来了精彩纷呈的高空体验，让游客感受一把“触及”天际的非凡之旅。', '<p><strong style=\"color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">广州塔上挑战众多“世界之最”</strong></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\278776fd16707197edf472937bc1dfdd.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(34, 34, 34);\">广州塔是广州的地标性景点，坐落在珠江沿岸，与广州商业中心“珠江新城”隔江相望。广州塔自2010年落成以来便以600米的绝对高度摘下了中国第一高塔的桂冠。在这样一座高耸的观光塔顶部有着多项吉尼斯世界纪录项目。其中包括423米的世界最高旋转餐厅；488米的世界最高户外观景平台；454米的世界最高摩天轮及485米的世界最高跳楼机（自由落体距离30米）。无数精彩的观光、娱乐项目给来广州塔游玩的游客带来了精彩纷呈的高空体验，让游客感受一把“触及”天际的非凡之旅。</span></p><p><br></p><p><strong style=\"background-color: rgb(255, 255, 255); color: rgb(34, 34, 34);\">品味广州的“饮茶”文化</strong></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\e4f8e419f14421f0fad54196b2737f75.jpeg\"></p><p><br></p><p><span style=\"color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\">广州人悠闲的生活习惯也孕育出了喜爱“饮茶”的传统风俗，早上称为“早茶”，午后则为“下午茶”。通常广州人在饮茶时还要再配上一些小食，随着时代的变迁，茶水已经渐渐成为了“饮茶”文化中的配角，各式各样的广式小吃才是人们品味的重点。游客不妨起个大早去广州各大早点铺子里品味一次广式早茶，或是在闲暇的午后挑上一个老字号茶楼，吃上几味粤式小吃。彻底放松心情，体验一把纯正的广州“茶文化”。</span></p><p><br></p><p><strong style=\"color: rgb(34, 34, 34);\">感受沙面岛上的欧式情怀</strong></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\9b4d2d14ed8238cd8881bd1f8ee8f557.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(34, 34, 34);\">百年前帝国主义国家在广州划分的租界，如今却成为了广州最富有欧式情怀的街区。沙面岛的面积虽不大，但却拥有十多处超百年的欧式古建。哥特风格的露德天主教圣母堂、巴洛克风格的广东外事博物馆、基督教文化浓郁的沙面基督堂以及沙面岛上唯一一座历史厂房英国雪厂都是这里最好的历史见证。无论是在日光下拂过一座座独特的欧式古建，感受浓郁的欧洲风情。还是在月圆夜来珠江沿岸漫步散心，欣赏霓虹下静谧的历史街区，都是沙面独一无二的惬意体验。</span></p><p><br></p><p><strong style=\"color: rgb(34, 34, 34);\">乘船夜游醉人珠江</strong></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\ebc237f8290209062399c0f63366e6ae.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(34, 34, 34);\">珠江是广州的母亲河，千百年来一直哺育着这座城市成长。珠江沿线也形成了众多商业中心，每当夜幕降临后绚烂的霓虹都会将珠江照亮。游览珠江最好的方式便是在华灯初上时跳上一艘游船，数座跨江大桥临头而过；欧式古建群沙面清晰可见；色彩缤纷的广州塔直冲云霄；繁华的珠江新城一片喧闹。全程1小时左右的航行会带你领略珠江沿线的众多广州重要景点，让你沉浸在这片醉人的珠江夜色中。</span></p><p><br></p><p><strong style=\"color: rgb(34, 34, 34);\">在长隆旅游度假区中尽享欢乐</strong></p><p><br></p><p><img src=\"http://www.myblog.com/public/uploadImg/log/20180311\\0eeee12af90c0e56dc5d26fa71da60a8.jpeg\"></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(34, 34, 34);\">广州长隆旅游度假区是我国最完善的旅游度假区之一，整体位于广州南部，地铁直达。度假区中包含了欢乐世界、野生动物世界、水上乐园、国际大马戏及广州鳄鱼公园5座大型主题公园。每一座公园都经过精心的设计与运营，让游客在家门口就能感受到世界级的乐园体验。玩累了，还可以就近下榻度假区的三家酒店，第二天继续体验其他的精彩园区。</span></p>', 1, 1519895927, 'win 7', '127.0.0.1', 'admin', 14, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fh_log_c`
--

CREATE TABLE `fh_log_c` (
  `lc_id` int(11) NOT NULL COMMENT '主键',
  `lc_pid` int(11) NOT NULL COMMENT '评论日志id',
  `lc_name` varchar(64) NOT NULL COMMENT '用户名',
  `lc_img` varchar(128) NOT NULL COMMENT '用户头像',
  `lc_content` text NOT NULL COMMENT '评论内容',
  `lc_time` int(11) NOT NULL COMMENT '评论时间',
  `lc_system` varchar(32) NOT NULL COMMENT '系统设备',
  `lc_ip` varchar(16) NOT NULL COMMENT 'ip地址',
  `lc_rename` varchar(64) DEFAULT NULL COMMENT '回复人',
  `lc_reimg` varchar(128) DEFAULT NULL COMMENT '回复人头像',
  `lc_recontent` text COMMENT '回复内容',
  `lc_retime` int(11) DEFAULT NULL COMMENT '回复时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_log_c`
--

INSERT INTO `fh_log_c` (`lc_id`, `lc_pid`, `lc_name`, `lc_img`, `lc_content`, `lc_time`, `lc_system`, `lc_ip`, `lc_rename`, `lc_reimg`, `lc_recontent`, `lc_retime`) VALUES
(1, 1, '游客', '/Public/Home/img/default.png', '文章写的非常好', 1510044655, 'Android', '192.168.1.112', 'admin', '/public/static/userImg/3c394791072f51289f24233ba42ee2e6.jpg', '谢谢:gift_heart:', 1510048590),
(2, 3, '游客', '/Public/Home/img/default.png', '说的好', 1512369867, 'iPhone', '192.168.1.112', NULL, NULL, NULL, NULL),
(3, 3, '游客', '/Public/Home/img/default.png', '你好啊', 1512370287, 'iPhone', '61.140.24.76', NULL, NULL, NULL, NULL),
(4, 3, '游客', '/Public/Home/img/default.png', '文章写的很好', 1512371573, 'iPhone', '61.140.24.76', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fh_picture`
--

CREATE TABLE `fh_picture` (
  `p_id` int(11) NOT NULL COMMENT '主键',
  `p_name` varchar(64) NOT NULL COMMENT '图片名称',
  `pid` int(11) NOT NULL COMMENT '相册名',
  `p_img` varchar(254) NOT NULL COMMENT '图片',
  `p_desc` varchar(128) NOT NULL COMMENT '描述',
  `p_time` int(11) NOT NULL COMMENT '时间',
  `p_system` varchar(16) NOT NULL COMMENT '系统',
  `p_ip` varchar(16) NOT NULL COMMENT '系统ip',
  `p_root` varchar(16) NOT NULL COMMENT '添加人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_picture`
--

INSERT INTO `fh_picture` (`p_id`, `p_name`, `pid`, `p_img`, `p_desc`, `p_time`, `p_system`, `p_ip`, `p_root`) VALUES
(1, '大头娃娃机', 1, '/Uploads/image/20171115/1510728548641775.png', '刚刚抓到的娃娃', 1510728562, 'Win 7', '127.0.0.1', 'admin'),
(2, '隔空抓娃娃', 2, '/Uploads/image/20171115/1510730425818292.png,/Uploads/image/20171115/1510730425103577.png,/Uploads/image/20171115/1510730425737564.png,/Uploads/image/20171115/1510730425445809.png', '一下子抓到四个娃娃', 1510730442, 'Win 7', '127.0.0.1', 'admin'),
(3, '天天抓娃娃', 1, '/Uploads/image/20171115/1510737079104270.png,/Uploads/image/20171115/1510737079104640.png,/Uploads/image/20171115/1510737079685883.png', '在天天抓娃娃抓到的...', 1510737096, 'Win 7', '127.0.0.1', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `fh_say`
--

CREATE TABLE `fh_say` (
  `s_id` int(11) NOT NULL COMMENT '主键',
  `s_content` text NOT NULL COMMENT '说说内容',
  `s_img` varchar(256) DEFAULT NULL COMMENT '说说图片',
  `s_show` int(11) NOT NULL COMMENT '公开度:1是0不是',
  `s_time` int(11) NOT NULL COMMENT '发布时间',
  `s_system` varchar(32) NOT NULL COMMENT '系统',
  `s_root` varchar(64) NOT NULL COMMENT '发布人',
  `s_ip` varchar(16) NOT NULL COMMENT 'IP',
  `s_hit` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `s_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_say`
--

INSERT INTO `fh_say` (`s_id`, `s_content`, `s_img`, `s_show`, `s_time`, `s_system`, `s_root`, `s_ip`, `s_hit`, `s_num`) VALUES
(4, '今天就这样过去了...:new_moon_with_face:', '/public/static/sayImg/0c7ef04dcc2ab6e6f812236775efbea2.jpg', 1, 1463813591, 'Win 7', 'admin', '127.0.0.1', 44, 0),
(5, '背黑锅我来....', '/public/static/sayImg/602f59e47a57467748f7dc5e1dfbd9d4.jpg', 1, 1469264335, 'Win 7', 'admin', '127.0.0.1', 4, 0),
(6, '坚持一个星期更新一篇文章', '/public/static/sayImg/3b8cdf551016d766b1e0978db0fca43e.jpg', 1, 1472357473, 'Win 7', 'admin', '127.0.0.1', 9, 0),
(10, '今天天气好冷啊', '/public/static/sayImg/8270b77bfdb9c8dc7e2e1eab438eea34.jpg', 1, 1478421028, 'Win 7', 'admin', '127.0.0.1', 1, 0),
(11, '今天天气很好，公司氛围很压抑', '/public/static/sayImg/133272d8820f7a56395796ac4470e03a.jpg', 1, 1499331153, 'Win 7', 'admin', '127.0.0.1', 0, 0),
(12, '就这样吧....:smiling_imp:', '/public/static/sayImg/f430287110786a0993575b7ddac99dbc.jpg', 1, 1502009645, 'Win 7', 'admin', '127.0.0.1', 0, 0),
(13, '漂亮吧:smirk:', '/public/static/sayImg/f3df69280f81af859dc5feafd591f3ba.jpg', 1, 1506156858, 'Win 7', 'admin', '127.0.0.1', 1, 0),
(14, '上班的乐趣之一:blush:', '/public/static/sayImg/d541fc6bf0169e0c3a172985dac95932.jpg', 1, 1509094801, 'Win 7', 'admin', '127.0.0.1', 1, 0),
(15, '生日快乐你今晚又多个名字叫黑猪噢:gift:', '/public/static/sayImg/2def5e608d37b163a9e88bffd486dd26.jpg', 1, 1511773443, 'Win 7', 'admin', '127.0.0.1', 1, 0),
(16, '做自己喜欢的事，追求最适合自己的东西，就是追求的意义', '/public/static/sayImg/0cb6c2ee67dd1145f03c39fc56bf1a39.jpg', 1, 1515056917, 'Win 7', 'admin', '127.0.0.1', 1, 0),
(17, '开工大吉', '/public/static/sayImg/fd5bbf2377e821ca5b4682fd102c1b10.jpg', 1, 1519637169, 'Win 7', 'admin', '127.0.0.1', 4, 1),
(18, '小鱼博客2.0版本即将完成，准备上线:v:', '/public/static/sayImg/dc13a786ee99b3ef0fa8d0d4013e97d6.jpg', 1, 1520054443, 'Win 7', 'admin', '127.0.0.1', 40, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fh_say_c`
--

CREATE TABLE `fh_say_c` (
  `sc_id` int(11) NOT NULL COMMENT '主键',
  `sc_pid` int(11) NOT NULL COMMENT '评论说说id',
  `sc_name` varchar(64) NOT NULL COMMENT '用户名',
  `sc_img` varchar(128) NOT NULL COMMENT '用户头像',
  `sc_content` text NOT NULL COMMENT '评论内容',
  `sc_ip` varchar(16) NOT NULL COMMENT 'ip地址',
  `sc_system` varchar(32) NOT NULL COMMENT '系统设备',
  `sc_time` int(11) NOT NULL COMMENT '评论时间',
  `sc_rename` varchar(64) DEFAULT NULL COMMENT '回复人',
  `sc_reimg` varchar(128) DEFAULT NULL COMMENT '回复人头像',
  `sc_recontent` text COMMENT '回复文本',
  `sc_retime` int(11) DEFAULT NULL COMMENT '回复时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_say_c`
--

INSERT INTO `fh_say_c` (`sc_id`, `sc_pid`, `sc_name`, `sc_img`, `sc_content`, `sc_ip`, `sc_system`, `sc_time`, `sc_rename`, `sc_reimg`, `sc_recontent`, `sc_retime`) VALUES
(1, 4, '游客', '/public/static/default/default.png', '公仔好漂亮啊[em_2][em_2]', '127.0.0.1', 'Unknown', 1509594712, NULL, NULL, NULL, NULL),
(2, 4, '游客', '/public/static/default/default.png', '公仔哪里买的呀[mr:/18]', '127.0.0.1', 'Unknown', 1509594804, NULL, NULL, NULL, NULL),
(3, 4, '游客', '/public/static/default/default.png', '小兔兔好漂亮[em_5]', '127.0.0.1', 'Win 7', 1509594865, NULL, NULL, NULL, NULL),
(4, 4, '游客', '/public/static/default/default.png', '抓到的公仔好漂亮[em_2]', '127.0.0.1', 'Win 7', 1509604590, 'admin', '/Uploads/comment/1509613213.png', '[em_10]', 1509613213),
(6, 4, '游客', '/public/static/default/default.png', '你想说什么[em_10]', '127.0.0.1', 'Unknown', 1509614023, NULL, NULL, NULL, NULL),
(7, 4, '游客', '/public/static/default/default.png', 'hello,小明[em_33]', '127.0.0.1', 'Unknown', 1509614106, 'admin', '/Uploads/comment/1511516685.png', '', 1511516685),
(8, 4, '游客', '/public/static/default/default.png', '红色的小兔公仔[em_2]', '127.0.0.1', 'Win 7', 1509681577, NULL, NULL, NULL, NULL),
(9, 4, '游客', '/public/static/default/default.png', '是呀，广州这两天降温', '127.0.0.1', 'Win 7', 1511251859, 'admin', '/Uploads/comment/1511516730.png', '要多穿点衣服哦[mr:/2]', 1511516730),
(10, 4, '游客', '/public/static/default/default.png', '是呀，广州这两天降温', '127.0.0.1', 'Win 7', 1511251945, 'admin', '/Uploads/comment/1513910246.png', '多穿点衣服[mr:/2]', 1513910246),
(11, 6, '游客', '/public/static/default/default.png', '楼主加油[em_28]', '127.0.0.1', 'Win 7', 1513910488, 'admin', '/public/static/userImg/3c394791072f51289f24233ba42ee2e6.jpg', '好的:blush:', 1513910532),
(12, 18, '游客', '/public/static/default/default.png', '期待中....:smirk:', '127.0.0.1', 'win 7', 1520062033, 'admin', '/public/static/userImg/3c394791072f51289f24233ba42ee2e6.jpg', '赶工中....:smile:', 1520062521),
(13, 17, '游客', '/public/static/default/199.png', ':heart_eyes::heart_eyes:', '127.0.0.1', 'win 7', 1521378665, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fh_system`
--

CREATE TABLE `fh_system` (
  `id` int(11) NOT NULL COMMENT '主键',
  `title` varchar(64) DEFAULT NULL COMMENT '网站标题',
  `title2` varchar(64) DEFAULT NULL COMMENT '二级标题',
  `keyword` varchar(128) DEFAULT NULL COMMENT '关键词',
  `createtime` varchar(11) NOT NULL COMMENT '注册时间',
  `desc` varchar(256) DEFAULT NULL COMMENT '站点描述',
  `username` varchar(64) DEFAULT NULL COMMENT '站长',
  `qq` varchar(16) DEFAULT NULL COMMENT 'QQ号码',
  `profession` varchar(32) DEFAULT NULL COMMENT '职业',
  `hobby` varchar(64) DEFAULT NULL COMMENT '爱好',
  `motto` varchar(64) DEFAULT NULL COMMENT '格言',
  `netname` varchar(64) DEFAULT NULL COMMENT '网名',
  `img` varchar(64) DEFAULT NULL COMMENT '图片',
  `explain` text COMMENT '个人说明',
  `program` text COMMENT '关于程序',
  `service` varchar(32) DEFAULT NULL COMMENT '域名',
  `statement` varchar(256) DEFAULT NULL COMMENT '声明',
  `hit` int(11) DEFAULT '0' COMMENT '浏览器',
  `saying` varchar(128) DEFAULT NULL COMMENT '每日一言'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_system`
--

INSERT INTO `fh_system` (`id`, `title`, `title2`, `keyword`, `createtime`, `desc`, `username`, `qq`, `profession`, `hobby`, `motto`, `netname`, `img`, `explain`, `program`, `service`, `statement`, `hit`, `saying`) VALUES
(2, '小鱼博客', NULL, '青空,情感聊吧,study,青青唠叨', '1517970171', '青春因为爱情而美丽，青春就要有青春的活力', '许勇', '1149250421', '前端工程师,php工程师', '旅游,睡觉,玩游戏', NULL, '江湖之养马人', '/public/static/systemImg/f1fa10bc914a080dc4b08fe9bbea5bea.jpg', '许勇森，男，一个90后草帽小子！15年3月入行，从业已经将近2年了。从搬砖一样的生活方式换成了现在有“单”而居的日子。跟我的职业相比,告别了朝九晚五，躲过了风吹日晒，虽然不再有阶梯式的工资，但是偶尔可以给自己放放假，一起轻装旅行。 人生就是一个得与失的过程，而我却是一个幸运者，得到的永远比失去的多。虽然刚开始入行时很辛苦，但是我仍然很享受那些熬得只剩下黑眼圈的日子，因为我在学习使用html、css、js、PHP、Java...中激发了兴趣，然后越走越远....从业到现在总是坚持的原则，喜欢一句话“冥冥中该来则来，无处可逃”。。。~W_W~', '许多人会在意别人对自己的看法,希望得到所有人的认可,结果平添出很多的烦恼。我们不可能让所有的人都对着自己唱赞歌,总会有那么一些不入耳的声音,千万不要因此而坏了每天好心情,学如逆水行舟,不进则退', NULL, NULL, 0, NULL),
(3, '小鱼博客', NULL, '青空,情感聊吧,study,青青唠叨', '1517970813', '青春因为爱情而美丽，青春就要有青春的活力', '许勇', '1149250421', '前端工程师,php工程师', '旅游,睡觉,玩游戏', NULL, '江湖之养马人', '/public/static/systemImg/9dd56649c5d42706254781376accebd4.jpg', '许勇森，男，一个90后草帽小子！15年3月入行，从业已经将近2年了。从搬砖一样的生活方式换成了现在有“单”而居的日子。跟我的职业相比,告别了朝九晚五，躲过了风吹日晒，虽然不再有阶梯式的工资，但是偶尔可以给自己放放假，一起轻装旅行。 人生就是一个得与失的过程，而我却是一个幸运者，得到的永远比失去的多。虽然刚开始入行时很辛苦，但是我仍然很享受那些熬得只剩下黑眼圈的日子，因为我在学习使用html、css、js、PHP、Java...中激发了兴趣，然后越走越远....从业到现在总是坚持的原则，喜欢一句话“冥冥中该来则来，无处可逃”。。。~W_W~', '许多人会在意别人对自己的看法,希望得到所有人的认可,结果平添出很多的烦恼。我们不可能让所有的人都对着自己唱赞歌,总会有那么一些不入耳的声音,千万不要因此而坏了每天好心情,学如逆水行舟,不进则退', NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fh_user`
--

CREATE TABLE `fh_user` (
  `u_id` int(11) NOT NULL COMMENT '主键',
  `u_name` varchar(64) NOT NULL COMMENT '用户名',
  `u_password` varchar(32) NOT NULL COMMENT '密码',
  `u_logo` varchar(256) DEFAULT NULL COMMENT '用户头像',
  `u_class` int(11) NOT NULL COMMENT '权限1为最高,2为编辑,3为游客',
  `u_email` varchar(64) DEFAULT NULL COMMENT '管理员邮箱',
  `u_createtime` int(11) NOT NULL COMMENT '创建时间',
  `u_logintime` int(11) DEFAULT NULL COMMENT '登录时间',
  `u_ip` varchar(16) NOT NULL COMMENT '登录ip',
  `u_num` int(11) DEFAULT '0' COMMENT '登录次数',
  `u_root` varchar(64) NOT NULL COMMENT '姓名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fh_user`
--

INSERT INTO `fh_user` (`u_id`, `u_name`, `u_password`, `u_logo`, `u_class`, `u_email`, `u_createtime`, `u_logintime`, `u_ip`, `u_num`, `u_root`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '/public/static/userImg/3c394791072f51289f24233ba42ee2e6.jpg', 1, '1149250421@qq.com', 1495956763, 1513909817, '127.0.0.1', 31, ''),
(2, 'admin12', '25f9e794323b453885f5181f1b624d0b', '/public/static/userImg/177b6f6690bc8b9b9a8b3dc1871f8955.jpg', 2, 'admin@qq.com', 1509156763, 1509163586, '127.0.0.1', 0, 'admin'),
(3, 'xiaoxiao', 'a66abb5684c45962d887564f08346e8d', '/public/static/userImg/10fe6a690b0bff3028a342e9d56183cd.png', 3, 'xiaoxiao@qq.com', 1509094446, 1509094446, '127.0.0.1', 0, '晓晓'),
(5, '李小波', 'e10adc3949ba59abbe56e057f20f883e', '/public/static/userImg/adde5cb43032d2ede70cad6838b39f9c.png', 3, '114925041@qq.com', 1517627710, NULL, '127.0.0.1', 0, 'admin'),
(7, '游振雨', 'e10adc3949ba59abbe56e057f20f883e', '/public/static/userImg/c76eaedb79b02c79fca500fd2506496a.jpg', 3, '11492504@qq.com', 1518056643, NULL, '127.0.0.1', 0, '自动创建');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fh_album`
--
ALTER TABLE `fh_album`
  ADD PRIMARY KEY (`al_id`);

--
-- Indexes for table `fh_article`
--
ALTER TABLE `fh_article`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `fh_article_c`
--
ALTER TABLE `fh_article_c`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indexes for table `fh_board`
--
ALTER TABLE `fh_board`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `fh_cat`
--
ALTER TABLE `fh_cat`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `fh_log`
--
ALTER TABLE `fh_log`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `fh_log_c`
--
ALTER TABLE `fh_log_c`
  ADD PRIMARY KEY (`lc_id`);

--
-- Indexes for table `fh_picture`
--
ALTER TABLE `fh_picture`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `fh_say`
--
ALTER TABLE `fh_say`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `fh_say_c`
--
ALTER TABLE `fh_say_c`
  ADD PRIMARY KEY (`sc_id`);

--
-- Indexes for table `fh_system`
--
ALTER TABLE `fh_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fh_user`
--
ALTER TABLE `fh_user`
  ADD PRIMARY KEY (`u_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `fh_album`
--
ALTER TABLE `fh_album`
  MODIFY `al_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `fh_article`
--
ALTER TABLE `fh_article`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=45;

--
-- 使用表AUTO_INCREMENT `fh_article_c`
--
ALTER TABLE `fh_article_c`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `fh_board`
--
ALTER TABLE `fh_board`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `fh_cat`
--
ALTER TABLE `fh_cat`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `fh_log`
--
ALTER TABLE `fh_log`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `fh_log_c`
--
ALTER TABLE `fh_log_c`
  MODIFY `lc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `fh_picture`
--
ALTER TABLE `fh_picture`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `fh_say`
--
ALTER TABLE `fh_say`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `fh_say_c`
--
ALTER TABLE `fh_say_c`
  MODIFY `sc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `fh_system`
--
ALTER TABLE `fh_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `fh_user`
--
ALTER TABLE `fh_user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
