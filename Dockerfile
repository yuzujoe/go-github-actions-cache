FROM golang:1.17 as dev

WORKDIR /go/src/app

COPY go.mod go.sum ./
RUN go mod download

COPY . /go/src/app

RUN CGO_ENABLED=0 go build -o app -a -tags netgo -installsuffix netgo ./app
