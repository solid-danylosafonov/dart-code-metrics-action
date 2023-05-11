FROM dart:stable

COPY action_app/ /action_app/

RUN cd /action_app \
    && dart pub get

ENV PATH /flutter/bin:$PATH

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends unzip \
    && rm -rf /var/lib/apt/lists/*

# Installing Flutter
RUN git clone -b stable --depth 1 https://github.com/flutter/flutter.git /stable \
    && flutter --version

ENTRYPOINT ["dart", "run", "/action_app/bin/main.dart"]
