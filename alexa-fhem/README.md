# alexa-fhem docker image
custom docker image for the alexa fhem integration made by justme1968.

## build

* download alexa-fhem-0.1.8.tgz from https://forum.fhem.de/index.php/topic,60244.msg540117.html#msg540117

run:
```
docker build -t alexa-fhem .
```

## run

```
docker run -p 3000:3000 -i --name alexa -t alexa
```

## configure

read these ressources to get alexa-fhem integration running:
* https://wiki.fhem.de/wiki/Alexa-Fhem
* https://forum.fhem.de/index.php/topic,60244.0.html
