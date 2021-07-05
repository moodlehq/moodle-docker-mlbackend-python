FROM python:3.7.5-slim-stretch

ADD setup/ /tmp/setup
ENV MOODLE_MLBACKEND_PYTHON_VERSION 3.0.1
RUN /tmp/setup/download-mlbackend-python.sh

WORKDIR /app

RUN pip install --no-cache-dir -e .
RUN mkdir -p /opt/mlbackenddata/moodle

ENV MOODLE_MLBACKEND_PYTHON_DIR=/opt/mlbackenddata
ENV MOODLE_MLBACKEND_PYTHON_USERS=default:sshhhh

ENTRYPOINT ["python"]
CMD ["webapp.py"]
