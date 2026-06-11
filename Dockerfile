# 1. Imagen base de Nginx
FROM nginx:alpine

# 2. Cambiar el puerto de escucha de Nginx a 8080 (Obligatorio para Cloud Run)
RUN sed -i 's/listen[: ]*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# 3. Definir la carpeta de trabajo de Nginx
WORKDIR /usr/share/nginx/html

# 4. Copiar los archivos de la raíz de tu proyecto al contenedor
# (Esto copiará tu index.html y archivos principales)
COPY . .

# 5. Informar el puerto correcto
EXPOSE 8080

# 6. Arrancar Nginx
CMD ["nginx", "-g", "daemon off;"]
