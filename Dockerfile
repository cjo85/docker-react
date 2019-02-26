FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# /app/build <--- The stuff that we care about afterwards

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html