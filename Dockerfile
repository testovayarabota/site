FROM tiangolo/uwsgi-nginx-flask:python3.8
COPY ./app /app
WORKDIR /app
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -y && apt-get upgrade -y && apt-get install virtualenv -y &&  virtualenv env && source env/bin/activate
RUN /usr/local/bin/python -m pip install --upgrade pip &&  pip install -r /app/requirements.txt && export FLASK_APP=run.py
EXPOSE 5000
CMD flask run --host=0.0.0.0 --port=5000
