FROM minidocks/perl
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=2018

ENV PATH="$PATH:/usr/local/texlive/bin/x86_64-linuxmusl"

RUN wget -O /tmp/install-tl-unx.tar.gz "ftp://tug.org/historic/systems/texlive/${version}/install-tl-unx.tar.gz" \
    && tar -xvzf /tmp/install-tl-unx.tar.gz -C /tmp \
    && printf "selected_scheme scheme-basic\n\
TEXDIR /usr/local/texlive\n\
TEXMFCONFIG ~/.texlive/texmf-config\n\
TEXMFHOME ~/texmf\n\
TEXMFLOCAL /usr/local/texlive/texmf-local\n\
TEXMFSYSCONFIG /usr/local/texlive/texmf-config\n\
TEXMFSYSVAR /usr/local/texlive/texmf-var\n\
TEXMFVAR ~/.texlive/texmf-var\n\
binary_x86_64-linuxmusl 1\n\
instopt_adjustpath 0\n\
instopt_adjustrepo 1\n\
instopt_letter 0\n\
instopt_portable 0\n\
instopt_write18_restricted 1\n\
tlpdbopt_autobackup 0\n\
tlpdbopt_create_formats 1\n\
tlpdbopt_desktop_integration 0\n\
tlpdbopt_file_assocs 1\n\
tlpdbopt_generate_updmap 0\n\
tlpdbopt_install_docfiles 0\n\
tlpdbopt_install_srcfiles 0\n\
tlpdbopt_post_code 1\n\
" > /tmp/texlive.profile \
    && /tmp/*/install-tl --profile=/tmp/texlive.profile \
    && clean

RUN tlmgr install pdfpages ms pdfjam pdfcrop pdfbook2
