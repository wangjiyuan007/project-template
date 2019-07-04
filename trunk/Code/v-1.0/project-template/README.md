替换项目名称
  把project-template替换成自己的项目名称
  把pom文件中groupId替换成自己项目的groupId


讲解以下2个流程
1.配置热部署流程
2.项目打包流程

一：配置热部署流程
    注意：1和2 两个步骤已经完成
          idea工具只需完成3和5步骤
          eclipse工具只需完成4和5步骤    
    1.添加依赖包
      <dependency>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-devtools</artifactId>
          <optional>true</optional>
      </dependency>  
    2.添加插件（主要在eclipse中起作用，idea不需要加此配置）
       <build>
            <plugins>
                <plugin>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-maven-plugin</artifactId>
                    <configuration>
                        <fork>true</fork>
                    </configuration>
                </plugin>
            </plugins>
       </build>
    3.idea设置
      (1)、点击： File --> Settings --> Build ,Execution,Deplment --> Complier
         找到Build project automatically选择，勾选中，然后Apply --> OK     
      (2)、按组合键：Shift+ALT+Ctrl+/  选择“Registry” 回车
         找到“complier.automake.allow.when.app.running” 勾选中，然后Apply --> OK     
    4.eclipse设置
      eclipse –> Project –> Build Automatically 要选中，不选中的话不起作用  
    5.禁止浏览器缓存(chrome为例)
      按F12 --> Network --> Disable cache 勾选中
    
二：项目打包流程
    1.找到项目跟目录
    2.按顺序执行以下maven命令
      2.1 mvn clean                                         清理之前编译文件
      2.2 mvn install -P [dev/test/pro] -DskipTests       安装依赖、发布到本地仓库、打包target目录下
      备注：[dev/test/pro]根据环境选择不同参数, -DskipTests跳过测试代码
      eg：测试环境：mvn install -P test -DskipTests
    3.本地开发无需输入[dev/test/pro]，直接用开发工具运行代码，默认dev
      
     