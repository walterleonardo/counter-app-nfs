FROM bash:5.2.15
COPY ./script.sh .
RUN mkdir app/
RUN chmod +x ./script.sh
CMD ["bash", "./script.sh"]
