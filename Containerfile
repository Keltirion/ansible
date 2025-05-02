FROM ubuntu:24.10

RUN apt-get update && \
		apt-get upgrade -y && \
		apt-get install -y \
		python3.13 \
		python3.13-venv \
		python3-pip

RUN python3.13 -m venv /opt/ansible-venv/ && \
		/opt/ansible-venv/bin/pip install --upgrade pip && \
		/opt/ansible-venv/bin/pip install ansible

COPY scripts/entrypoint.sh /opt/entrypoint.sh
COPY ansible /opt/ansible

RUN useradd -ms /bin/bash ansible && \
		chown -R ansible:ansible /opt/ansible-venv && \
		chown -R ansible:ansible /opt/ansible && \
		chown ansible:ansible /opt/entrypoint.sh && \
		chmod +x /opt/entrypoint.sh

USER ansible

WORKDIR /opt/ansible

ENTRYPOINT [ "/opt/entrypoint.sh" ]

CMD ["/bin/bash"]
		
