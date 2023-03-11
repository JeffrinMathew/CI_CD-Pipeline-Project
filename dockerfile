FROM Maven as Build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk
WORKDIR /app
COPY --from=Build /app/target/Uber.jar /app/
EXPOSE 9090
CMD ["Java","-jar","Uber.jar"]