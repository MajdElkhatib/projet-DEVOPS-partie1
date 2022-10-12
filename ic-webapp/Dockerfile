FROM alpine:3.6

ENV ODOO_URL=""
ENV PGADMIN_URL=""

# Install python and pip
RUN apk add --no-cache --update python3 py3-pip bash && \
        # Install dependencies
        pip3 install Flask && \
        # Add a Group and user icwebapp
        addgroup -S icwebapp && \
        adduser -S icwebapp -G icwebapp

# Add our code
COPY --chown=icwebapp:icwebapp ic-webapp /opt/ic-webapp/

USER icwebapp
WORKDIR /opt/ic-webapp

EXPOSE 8080

CMD [ "python3", "app.py" ]
