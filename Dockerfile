# everything from this FROM command and everything beneath the image build phase/stage will be called builder
FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# FROM statement starts the 2nd phase

FROM nginx
# saying I want to copy something over from the builder phase - copying /app/build folder TO /usr/share/nginx/html (from nginx image docker hub)
COPY --from=builder /app/build /usr/share/nginx/html






