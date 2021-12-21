FROM danysk/docker-manjaro-texlive-base:31.20211128.0717
RUN yay-install ruby
RUN yay-install rubygems
ENV GEM_HOME=/rubygems/bin
ENV PATH="$GEM_HOME:$PATH"
CMD /bin/bash
