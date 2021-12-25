FROM danysk/docker-manjaro-texlive-base:33.20211219.1101
RUN yay-install ruby rubygems ruby-bundler
RUN mkdir -p /rubygems/bin
RUN chmod 777 /rubygems/bin
ENV GEM_HOME=/rubygems/bin
ENV GEM_PATH=/rubygems/bin
RUN mkdir -p "$(ruby -e 'puts Gem.user_dir')"
COPY .gemrc /root/.gemrc
RUN ln -sf "$GEM_HOME" "$(ruby -e 'puts Gem.user_dir')/bin"
RUN ls -ahl "$(ruby -e 'puts Gem.user_dir')/bin"
ENV PATH="$GEM_HOME:$PATH"
RUN echo "$PATH"
RUN gem install bundler
RUN bundle help
CMD /bin/bash
