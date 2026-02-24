mkdir muhim-fayllar && cd muhim-fayllar
touch file{1...10}.log
tar -cvf production-loglari.tar muhim-fayllar
tar -xvf production-loglari.tar
