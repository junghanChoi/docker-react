# multi layer container.
# Build Phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# Run Pahse
FROM nginx
# 이전 build Phase에 생성된 어떤 것도 상관 없이, app/build만 사용하겠다. dependencies file 다 필요없음. 빌드 결과만 사용하기 때문에 용량이 적음
COPY --from=builder /app/build /usr/share/nginx/html
