# cover 

-----

## cover 是什么？
cover是erlang官方提供的覆盖率分析和统计各个方法被执行的次数的工具。可以用来分析确认测试相关工作，确定所有的代码都被执行，也有利于发现服务器瓶颈所在。
## 基本原理
1. 创建一条进程（cover_server）专门统计和处理函数调用相关的信息，该进程会把接收到的信息放入到他启动的几个ets表里面；
2. cover模式编译（cover combile），专属于cover功能的编译模式，该模式编译会再相关的abs code上添加相对应的汇报信息的接口，即函数、行数被执行时上报给步骤1启动的进程；
3. 通过前面的两步已经把相关的信息给收集起来，接下来的动作就是对这些信息做筛选操作，筛选对自己有用的信息。

## 基本使用
1. 启动进程： cover:start/0, cover:start/1，该功能同样支持分布式环境使用，即在“主节点“启动功能，各个节点的信息都会上报到“主节点”；
2. cover模式编译：对需要进行覆盖率分析的模块(目录)执行cover:compile/1（cover:compile_directory/1）进行编译，除了支持都源码直接编译外还支持对beam文件进行cover编译，当然这里有一些额外的条件，这里不做讲述；
3. 前面两个步骤实施以后（不分先后），相关的信息都被汇总ets里面，通过接口cover:analyse/{1,2}，cover:analyse_to_file/{1,2}可以获取相关信息。

## DEMO使用
1. 编译 ./rebar co
2. 执行脚本coverctl即可启动cover compile, cover_server，cover_test app；
3. 在控制台进行cover:analyse/{1,2},即可输出观察效果，同样也可以输出到文件进行观察。

## 相关资料
1. [erlang官方资料](http://erlang.org/doc/man/cover.html)
2. [yufeng关于cover实现的想法延伸](http://mryufeng.iteye.com/blog/482204)