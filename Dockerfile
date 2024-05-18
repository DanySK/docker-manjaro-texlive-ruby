FROM danysk/docker-manjaro-texlive-base:202.20240515.1108
RUN pamac update --no-confirm
RUN pamac upgrade --no-confirm
RUN pamac install --no-confirm ruby rubygems ruby-bundler make gcc
RUN paccache -rk 0
RUN pamac clean -b
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
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "latexmk" ]
