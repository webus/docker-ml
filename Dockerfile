FROM python:3.5-onbuild

RUN apt-get -y update && apt-get install -y --no-install-recommends libblas-dev liblapack-dev libatlas-base-dev gfortran && apt-get autoremove -y && apt-get autoclean -y
RUN pip install -U pip
RUN pip install -U numpy scipy
RUN pip install -U sympy
RUN pip install -U pandas
RUN pip install -U scikit-learn
RUN pip install -U nltk
RUN pip install -U pymorphy2
RUN pip install -U pymorphy2-dicts-ru
RUN pip install -U chainer keras theano h5py

ENV TF_BINARY_URL https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0rc2-cp35-cp35m-linux_x86_64.whl
RUN pip install --upgrade $TF_BINARY_URL

RUN pip install -U matplotlib beautifulsoup4 lxml pymongo
RUN pip install -U statsmodels seaborn

# https://github.com/ipython/ipython/issues/7062
# CMD ["jupyter","notebook","--port=8888","--no-browser","--ip=0.0.0.0"]
CMD ["./run.sh"]

EXPOSE 8888

