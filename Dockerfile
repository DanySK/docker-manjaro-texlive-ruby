FROM danysk/manjaro-texlive:256.20241102.2145
USER build
RUN paru -S\
    gcc\
    make\
    ruby\
    ruby-bundler\
    rubygems\
    --noconfirm
RUN paru -Scc --noconfirm
USER root
RUN paccache -rk 0
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
