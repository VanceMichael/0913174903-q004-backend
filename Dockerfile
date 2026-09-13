FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY . .
CMD ["sh", "-c", "echo 请先完成服务实现"]
