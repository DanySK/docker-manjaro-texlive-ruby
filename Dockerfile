FROM danysk/docker-manjaro-texlive-base:96.20221106.1539
RUN yay-install ruby rubygems ruby-bundler
RUN mkdir -p /rubygems
RUN chmod 777 /rubygems
ENV GEM_HOME=/rubygems
ENV GEM_PATH=/rubygems
RUN mkdir -p "$(ruby -e 'puts Gem.user_dir')"
RUN rm -rf "$(ruby -e 'puts Gem.user_dir')"
RUN ln -s "$GEM_HOME" "$(ruby -e 'puts Gem.user_dir')"
ENV PATH="$GEM_HOME/bin:$PATH"
RUN gem install bundler
# The following tests that installed gems are in PATH
RUN bundle help
CMD /bin/bash
