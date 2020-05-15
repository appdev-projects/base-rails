FROM gitpod/workspace-full
# 28c7f7902d71:working

USER root

RUN sudo apt-get update

RUN sudo apt-get install -y unzip xvfb libxi6 libgconf-2-4
RUN sudo apt-get install default-jdk -y

# COPY .irbrc ~/.irbrc
WORKDIR /base-rails

RUN sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN sudo echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN sudo apt-get -y update

RUN sudo apt-get -y install google-chrome-stable

RUN wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip

RUN sudo mv chromedriver /usr/bin/chromedriver
RUN sudo chown root:root /usr/bin/chromedriver
RUN sudo chmod +x /usr/bin/chromedriver

RUN wget https://selenium-release.storage.googleapis.com/3.13/selenium-server-standalone-3.13.0.jar
RUN wget http://www.java2s.com/Code/JarDownload/testng/testng-6.8.7.jar.zip
RUN unzip testng-6.8.7.jar.zip

USER gitpod
WORKDIR /base-rails
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.6.6"
RUN /bin/bash -l -c "curl https://cli-assets.heroku.com/install.sh | sh"

COPY Gemfile /base-rails/Gemfile
COPY Gemfile.lock /base-rails/Gemfile.lock

RUN /bin/bash -l -c "rvm use --default 2.6.6"

RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "bundle install"

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
RUN /bin/bash -l -c "gem install htmlbeautifier"
RUN /bin/bash -l -c "gem install solargraph"
