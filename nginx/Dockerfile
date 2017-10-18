FROM nginx
 
# establish where Nginx should look for files
ENV RAILS_ROOT /thermostat
 
# Set our working directory inside the image
WORKDIR $RAILS_ROOT
 
# Copy Nginx config template
COPY config/nginx.conf /tmp/docker_example.nginx
 
# substitute variable references in the Nginx config template for real values from the environment
# put the final config in its place
RUN envsubst '$RAILS_ROOT' < /tmp/docker_example.nginx > /etc/nginx/conf.d/default.conf

EXPOSE 80

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
