# Docker Buckets
A docker container that runs Budget w/ Bucket with access from the web

# How to Build Docker Image
`docker build -t docker-buckets .`

# Run
`docker run --rm -p 5800:5800 -p 5900:5900 -v /path/to/save/budgets:/config docker-buckets`

Access at [http://localhost:5800](http://localhost:5800)
