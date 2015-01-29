docker build -t cobjet/worker .


echo "docker run --privileged -t -i -p 8888:8888 -p 4430:4430 cobjet/worker /bin/bash"
