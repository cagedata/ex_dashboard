FROM zorbash/kitto

WORKDIR /dashboard

RUN apt-get update && apt-get -yqq install build-essential python \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY package.json /dashboard/
COPY webpack.config.js /dashboard/
COPY .babelrc /dashboard/
COPY mix.* /dashboard/


ENV MIX_ENV prod
RUN mix deps.get

RUN npm install

COPY . /dashboard/

RUN npm run build
RUN mix compile

CMD ["mix", "kitto.server"]
