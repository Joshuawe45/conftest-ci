FROM nginx:latest
USER root 
RUN curl https://github.com/we45/xml-files/blob/master/setup-kube.sh
COPY ./index.html /usr/share/nginx/html/index.html