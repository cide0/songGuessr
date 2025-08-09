FROM php:8.3-cli-alpine
RUN apk add --no-cache tzdata
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apk add icu-dev
RUN docker-php-ext-install -j$(nproc) \
pdo pdo_mysql intl
COPY --from=composer:2.5.8 /usr/bin/composer /usr/local/bin/composer