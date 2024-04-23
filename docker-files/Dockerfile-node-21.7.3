FROM node:21.7.3-alpine3.18 AS base
WORKDIR /app

COPY package.json /app
COPY yarn.lock /app
COPY .yarnrc.yml /app
RUN yarn install --immutable

FROM base AS runner
WORKDIR /app

COPY --from=base /app/node_modules /app/node_modules
COPY . /app/

CMD node index.js
