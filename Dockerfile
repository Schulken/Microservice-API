FROM python:3.7.3-stretch

MAINTAINER Andre Schulke <andre.schulke@bertelsmann.de>

## Step 1:
# Create a Working Directory
WORKDIR /msapi

## Step 2:
# Copy source code to working directory
COPY . app.py /msapi/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80
# EXPOSE 8000
# EXPOSE 8080

## Step 5:
# Run app.py at container launch
# RUN app.py
CMD ["python", "app.py"]
