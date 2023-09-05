FROM python:3.10-slim-buster

WORKDIR /workspace

COPY requirements.txt requirements.txt

# Install the build-essential package (which includes gcc) and any other dependencies
RUN apt-get update && apt-get install -y build-essential

RUN pip3 install -r requirements.txt && rm -rf /root/.cache/pip

COPY . .

RUN pip install -e .


CMD [ "python3", "titanium/train.py" ]
# CMD ["sh", "-c", "python3 titanium/train.py && python3 titanium/eval.py"]