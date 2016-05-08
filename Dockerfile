FROM python:2-onbuild
EXPOSE 8123
ADD ss.json /etc/ss.json
CMD ssserver -c /etc/ss.json
