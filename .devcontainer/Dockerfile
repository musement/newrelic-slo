FROM node:12.0.0

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV PATH=${PATH}:/usr/local/share/npm-global/bin

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog ca-certificates 2>&1 \
    #
    #
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Remove outdated yarn from /opt and install via package 
    # so it can be easily updated via apt-get upgrade yarn
    && rm -rf /opt/yarn-* \
    && rm -f /usr/local/bin/yarn \
    && rm -f /usr/local/bin/yarnpkg \
    && apt-get install -y curl apt-transport-https lsb-release \
    && curl -sS https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/pubkey.gpg | apt-key add - 2>/dev/null \
    && echo "deb https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends yarn \
    #
    # Set alternate global install location that both users have rights to access
    && mkdir -p /usr/local/share/npm-global \
    && chown ${USERNAME}:root /usr/local/share/npm-global \
    && npm config -g set prefix /usr/local/share/npm-global \
    && sudo -u ${USERNAME} npm config -g set prefix /usr/local/share/npm-global \
    #
    # Tactically remove imagemagick due to https://security-tracker.debian.org/tracker/CVE-2019-10131
    # Can leave in image once the CVE is resolved upstream or the node images move to "buster".
    && apt-get purge -y imagemagick imagemagick-6-common \
    #
    # Install Newrelic CLI
    && curl -s https://cli.nr-ext.net/installer.sh | bash \
    && nr1 --version \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

USER node

WORKDIR /opt/quality-assurance-newrelic-slo
