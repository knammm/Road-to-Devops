# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]

# This tells Docker to:
# 1. Build an image starting with the Python 3.7 image.
# 2. Set the working directory to /code.
# 3. Set environment variables used by the flask command.
# 4. Install gcc and other dependencies
# 5. Copy requirements.txt and install the Python dependencies.
# 6. Add metadata to the image to describe that the container is listening on port 5000
# 7. Copy the current directory . in the project to the workdir . in the image.
# 8. Set the default command for the container to flask run.
