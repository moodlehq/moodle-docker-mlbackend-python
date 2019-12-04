FROM python:3.7.4-slim-stretch

COPY . /app
WORKDIR /app

RUN pip install --no-cache-dir -e .
RUN mkdir -p /opt/mlbackenddata/moodle

ENV MOODLE_MLBACKEND_PYTHON_DIR=/opt/mlbackenddata
ENV MOODLE_MLBACKEND_PYTHON_USERS=default:sshhhh

ENTRYPOINT ["python"]
CMD ["webapp.py"]
