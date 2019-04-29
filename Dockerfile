#基础镜像为centos
 
FROM centos
 
RUN cd /tmp && \
 
#安装wget
 
yum -y install wget && \
 
#下载安装包
 
wget http://goodrain-pkg.oss-cn-shanghai.aliyuncs.com/apps/openoffice/Apache_OpenOffice_4.1.5_Linux_x86-64_install-rpm_zh-CN.tar.gz -O Apache_OpenOffice_4.1.6_Linux_x86-64_install-rpm_zh-CN.tar.gz && \
 
#解压缩
 
tar -xvf Apache_OpenOffice*.tar.gz && \
 
#安装OpenOffice
 
yum install -y zh-CN/RPMS/*.rpm && \
 
#安装JDK
 
yum install -y java-1.8.0-openjdk.x86_64 && \
 
#清除yum缓存
 
yum clean all && \
 
#删除压缩包
 
rm -f Apache_OpenOffice_4.1.6_Linux_x86-64_install-rpm_zh-CN.tar.gz&& \
 
#删除解压缩的文件
 
rm -Rf zh-CN
 
#暴露接口
EXPOSE 8100
 
#启动服务，占用8100端口
CMD /opt/openoffice4/program/soffice -headless -nofirststartwizard  -accept="socket,host=0.0.0.0,port=8100;urp;"
