FROM python:3.6-stretch

RUN apt-get update \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

COPY ./dist /opt

WORKDIR /opt

RUN pip3 install -r requirements.txt \
	&& python setup.py develop \
	&& ln -s /opt/bin/gdc_filtration_tools /bin/gdc_filtration_tools

ENTRYPOINT ["/bin/gdc_filtration_tools"]

CMD ["--help"]
