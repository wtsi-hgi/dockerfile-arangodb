dockerfile-arangodb
===================

    $ ID=$(docker run -d -p 127.0.0.1::8529 -v $(pwd):/docker/arangodb webwurst/arangodb)
    $ xdg-open http://$(docker port $ID 8529)