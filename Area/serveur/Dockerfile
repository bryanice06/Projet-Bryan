FROM node:10.16.3

WORKDIR /serveur

COPY package.json package-lock.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]