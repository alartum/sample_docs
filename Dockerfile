FROM condaforge/mambaforge

ADD environment.yaml .
RUN mamba env update --name base --file environment.yaml

EXPOSE 9000
VOLUME ["/home"]

CMD jupyter lab --notebook-dir /home --allow-root --port=9000 --no-browser --ip=0.0.0.0
