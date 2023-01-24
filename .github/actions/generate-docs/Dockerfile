FROM condaforge/mambaforge

COPY entrypoint.sh /entrypoint.sh
RUN mamba create -n sphinx_env

SHELL ["conda", "run", "--no-capture-output", "-n", "sphinx_env", "/bin/bash", "-c"]
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "sphinx_env", "/entrypoint.sh"]
