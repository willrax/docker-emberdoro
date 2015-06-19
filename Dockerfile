FROM nginx

RUN apt-get install git

RUN git clone https://github.com/willrax/emberdoro.git

WORKDIR /emberdoro
RUN npm install && bower install
RUN ember build --environment production

WORKDIR /
RUN mv /emberdoro/build /app

ADD ./default.conf /etc/nginx/conf.d/default.conf
