FROM haophanitrvn/selenium-ubuntu
USER root
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip python3-setuptools libpq-dev python3-psycopg2 python-is-python3 make python3-tk
COPY . /btcy-qa-tool-auto_fwk
HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=3 CMD [ "starting" ]
RUN chmod -R 777 /btcy-qa-tool-auto_fwk
WORKDIR /btcy-qa-tool-auto_fwk
RUN python3 -m pip install -r ./requirements_raw
