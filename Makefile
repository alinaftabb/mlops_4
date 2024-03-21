IMAGE_NAME = my-flask-app

.PHONY: build run clean

build:
    docker build -t $(IMAGE_NAME) .

run:
    docker run -d -p 5000:5000 $(IMAGE_NAME)

clean:
    docker image rm $(IMAGE_NAME)
