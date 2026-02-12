# Getting the python 3.9 image
# Optimization: can consider using a smaller more restricted image
FROM python:3.13.12-alpine3.23

# Copying my app to the image
ENV APP_HOME=/app
WORKDIR $APP_HOME
COPY . ./

# Install production dependencies form the requirements.txt file
RUN pip install -r requirements.txt

# Startup command to serve our app
CMD exec gunicorn --bind :80 --workers 1 --threads 8 main:app
