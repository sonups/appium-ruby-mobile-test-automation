FROM ruby:2.4.2
# Install Ruby.
RUN apt-get update && apt-get install -y \
	ruby \
	curl \
    software-properties-common \
	libnss3 \
  libgconf-2-4 \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libgtk-3-0 \
  libx11-xcb1 \
  libxss1 \
  lsb-release \
  xdg-utils \
  libgbm1 \
  wget \
  vim \
  libxcomposite1 -y

RUN apt-get install dos2unix  


RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py --force-reinstall
RUN pip install ruamel.yaml
RUN curl -L -o google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome.deb
RUN sed -i 's|HERE/chrome\"|HERE/chrome\" --disable-setuid-sandbox|g' /opt/google/chrome/google-chrome
RUN rm google-chrome.deb
RUN mkdir /usr/src/app
RUN mkdir /usr/src/app/output
WORKDIR /usr/src/app
ADD . .
RUN cp /usr/src/app/android_capabilities.yml /usr/src/app/features/support/properties/capabilities/android_capabilities.yml
RUN bundle install
CMD ["cucumber", "--profile", "all-tags"]
