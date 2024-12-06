FROM rastasheep/ubuntu-sshd

RUN useradd -m user -s /bin/bash
RUN echo "user:userpass" | chpasswd

RUN echo 'SEI DIVENTATO UN HACKER, questa è la flag :)' > /home/user/flag.txt

RUN echo alias cat=/bin/true >> /home/user/.bashrc
RUN echo alias less=/bin/true >> /home/user/.bashrc
RUN echo alias more=/bin/true >> /home/user/.bashrc
RUN echo alias find=/bin/true >> /home/user/.bashrc
RUN echo alias grep=/bin/true >> /home/user/.bashrc
RUN echo alias egrep=/bin/true >> /home/user/.bashrc
RUN echo alias vi=/bin/true >> /home/user/.bashrc
RUN echo alias vim=/bin/true >> /home/user/.bashrc
RUN echo alias fgrep=/bin/true >> /home/user/.bashrc
RUN echo alias python=/bin/true >> /home/user/.bashrc

WORKDIR /home/user/