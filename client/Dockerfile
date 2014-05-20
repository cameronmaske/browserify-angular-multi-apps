FROM rouge8/node-phantomjs

RUN npm install -g browserify > /dev/null 2>&1
RUN npm install -g coffee-script coffeeify > /dev/null 2>&1
RUN npm install -g napa > /dev/null 2>&1
RUN npm install -g watchify > /dev/null 2>&1
RUN npm install -g karma karma-cli > /dev/null 2>&1
RUN npm install -g gulp > /dev/null 2>&1

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

WORKDIR /code/client
EXPOSE 35729

CMD ["/usr/local/bin/run"]
