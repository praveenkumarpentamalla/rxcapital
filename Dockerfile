# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies including netcat for the entrypoint script
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libssl-dev build-essential netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python -m pip install --upgrade pip
# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint script to be executed
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Set gunicorn as the default command to run via the entrypoint script
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "rxcapital.wsgi:application"]
