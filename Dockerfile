FROM ruby:3.1

ENV LC_ALL ja_JP.UTF-8

ENV TZ Asia/Tokyo
ENV LANG=ja_JP.UTF-8

RUN apt-get update && apt install -y tzdata && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y locales \
    && sed -i -e 's/# \(ja_JP.UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=ja_JP.UTF-8

RUN mkdir /pai-music
WORKDIR /pai-music
COPY Gemfile /pai-music/Gemfile
COPY Gemfile.lock /pai-music/Gemfile.lock
RUN bundle install
COPY . /pai-music

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
