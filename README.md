# What is LiveCode Server

LiveCode is a scripting language maintained by LiveCode Ltd.  See <http://www.livecode.com/> for more info...

## What is in this image

This image contains LiveCode Community Server running as a CGI handler within an Apache web server environment.

## Tags available

This image currently is available with the following tags:  `latest` `8.0.0dp7` `8.0.0dp6` `7.1.1rc1` `7.1.0` `7.0.6`

## How to use this image

##### Run a single LiveCode site 

The quickest way to use this image for local development work is to run it from the directory that you wish to expose as your website root directory with the following:

```bash
docker run -it --rm -P --name livecode -v "$PWD":/var/www/html/ techstrategies/livecode
```

##### Create your own docker image

To bundle this into your own project's docker image, create your Dockerfile:

```bash
FROM techstrategies/livecode:7.1.0
COPY src/ /var/www/html/
```

Where src/ is the directory containing all your php code. Then, run the commands to build and run the Docker image:

```bash
docker build -t my-livecode-app .
docker run -it --rm -P --name my-running-app my-livecode-app
```
