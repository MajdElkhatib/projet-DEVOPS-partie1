FROM alpine:3.6

ENV ODOO_URL= ""
ENV PGADMIN_URL= ""


# Install python and pip
RUN apk add --no-cache --update python3 py3-pip bash
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt

# Add our code
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp


EXPOSE 8080		

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

CMD python app.py