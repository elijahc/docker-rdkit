# Docker file that installs docker container with rdkit, ipython notebook and matplotlib
#
# rename this file to "Dockerfile"
# build with: "sudo docker build -t rdkit ."
# run with: "sudo docker run -p 127.0.0.1:8889:8888 rdkit "
# NOTE that here port 8888 gets mapped to 8889.
# point your browser to http://127.0.0.1:8889/
 
FROM  saltstack/ubuntu-13.10 
# Add universe repository
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy universe " >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
 
RUN apt-get install -y language-pack-en
 
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
 
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
 
# Install rdkit, ipython notebook, matplotlib
RUN apt-get install -y python-rdkit librdkit1 rdkit-data
RUN apt-get install -y ipython-notebook
RUN apt-get install -y python-matplotlib
RUN apt-get install -y python-imaging python-cairo python-pandas
 
# Exposes default ipython notebook port
EXPOSE 8888
 
# What to run
CMD ipython notebook --pylab=inline --ip=*
