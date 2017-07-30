FROM cosmintitei/node-glue-sass:7.9

EXPOSE 3000

## cache package.json and node_modules to speed up builds
#ADD package.json package.json
ADD . /app

WORKDIR '/app'
RUN npm install -g node-gyp
RUN npm install
RUN npm rebuild node-sass
CMD ["npm","start"]
#ENTRYPOINT "bash"