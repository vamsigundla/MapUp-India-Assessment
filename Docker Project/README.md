docker build -t valhalla-server .
docker run -d -p 8002:8002 --name valhalla-container valhalla-server
Access the Valhalla server running inside the container by sending requests to http://localhost:8002 or the appropriate address if it's hosted on a remote machine.
