FROM node:18-alpine

ENV NODE_ENV=production

WORKDIR /app

RUN apk add --upgrade --no-cache python3 make g++

RUN corepack enable && corepack prepare pnpm@10.18.3 --activate

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile --prod

COPY . .

EXPOSE 8080

CMD ["node", "src/index.js"]