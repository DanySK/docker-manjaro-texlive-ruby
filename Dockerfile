FROM danysk/docker-manjaro-texlive-base:33.20211219.1101
RUN yay-install ruby
RUN yay-install rubygems
ENV GEM_HOME=/rubygems/bin
ENV GEM_PATH=/rubygems/bin
ENV PATH="$GEM_HOME:$PATH"
CMD /bin/bash
