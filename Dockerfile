FROM python:3.9

RUN apt-get update && apt-get install -y wget unzip

WORKDIR /app

RUN wget https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip && \
    unzip vosk-model-small-en-us-0.15.zip && \
    mv vosk-model-small-en-us-0.15 model

# Create virtual environment and install dependencies
RUN python -m venv venv
RUN . venv/bin/activate && pip install -r requirements.txt

COPY . .

CMD ["venv/bin/python", "asr_server.py"]

EXPOSE 2700
