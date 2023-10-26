FROM node:21-alpine3.17
COPY index.js .
EXPOSE 3000
CMD ["node", "index.js"]

