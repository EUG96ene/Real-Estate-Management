FROM node:18-alpine AS build

RUN apk --no-cache add build-base python3

WORKDIR /usr/app

COPY services/common services/common
COPY services/authenticator services/authenticator
COPY package.json .
COPY .yarnrc.yml .
COPY .yarn .yarn
COPY yarn.lock .

RUN corepack enable && \
    corepack prepare yarn@stable --activate

RUN yarn workspaces focus @microrealestate/authenticator

FROM node:18-alpine
WORKDIR /usr/app
COPY --from=build /usr/app ./
CMD ["yarn", "workspace", "@microrealestate/authenticator", "run", "dev"]