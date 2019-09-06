FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["webapp.csproj", ""]
RUN dotnet restore "webapp.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "webapp.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "webapp.csproj" -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim
WORKDIR /usr/app
EXPOSE 80
EXPOSE 443
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "webapp.dll"]
