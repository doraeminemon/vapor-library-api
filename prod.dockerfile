FROM swift:4.1
WORKDIR /app
COPY . .
RUN swift package clean && \
    swift package resolve
CMD ["swift", "run", "--env", "production"]