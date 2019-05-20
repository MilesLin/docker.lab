FROM mcr.microsoft.com/dotnet/core-nightly/sdk:2.2 AS Builder
WORKDIR /app
COPY . .
RUN dotnet publish -o=dist --configuration=Release

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
COPY --from=Builder ./app/dist ./app
WORKDIR /app
ENTRYPOINT ["dotnet", "docker.lab.dll"]