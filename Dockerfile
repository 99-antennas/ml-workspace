ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

# Install Additional Packages
RUN pip install --quiet --no-cache-dir \
    'tslearn==0.5.0.*' \
    'pytest-mock==3.5.*' \
    'pylint==2.7.*' \
    'pytest==6.2.2' \
    'coverage==5.5.*' \
    'google-cloud-bigquery==2.11.*' \
    'google-cloud-storage==1.36.*' \
    'google-cloud-logging==2.2.*' \
    'google-api-python-client==2.0.*' \
    'google-cloud-secret-manager==2.3.*' \
    'boto3==1.17.*'
    
# Add NLTK for nlp tasks
# RUN pip install nltk
# RUN python -m nltk.downloader popular

RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN conda install -c plotly plotly=4.14.3
RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"


