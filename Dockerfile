FROM python:3.11-bullseye
USER root

# Install custom linux packages
# RUN apt-get update -y && apt-get install sudo -y && apt-get install vim -y
RUN apt update -y
RUN apt install sudo -y
RUN apt install vim -y


# Create a virtualenv for dependencies. This isolates these packages from
# system-level packages.
RUN pip3 install virtualenv
RUN virtualenv /env -p python3

# Setting these environment variables are the same as running
# source /env/bin/activate.
ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

# Add the application source code and install all dependencies into the virtualenv
ADD . /human-cancer-project

# configure bashrc file
RUN cat /human-cancer-project/scripts/bashrc >> /root/.bashrc
CMD source /root/.bashrc
RUN pip3 install -r /human-cancer-project/requirements.txt

# Make execute a script
RUN chmod +x /human-cancer-project/scripts/createBqDataSet.sh
RUN mkdir /root/googleCli

# Run a WSGI server to serve the application.
EXPOSE 8080

# gunicorn must be declared as a dependency in requirements.txt.
WORKDIR /human-cancer-project
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app --timeout 0 --preload && \
    python3 manage.py makemigrations && \
    python3 manage.py migrate
