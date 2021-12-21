FROM danysk/docker-manjaro-texlive-base:32.20211212.1219
RUN yay-install ruby
RUN yay-install rubygems
ENV GEM_HOME=/rubygems/bin
ENV PATH="$GEM_HOME:$PATH"
CMD /bin/bash
