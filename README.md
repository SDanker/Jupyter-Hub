# Jupyter-Hub
Docker with JupyterHub to allow multiple users.
Provides kernels for Python, R and Julia.

Python has the libraries pre-installed:

- geopandas
- numpy
- seaborn
- pandas
- tensorflow
- scipy
- matplotlib
- keras
- scikit-learn
- scrapy3
- opencv-python
- openpyxl
- Theano
- beautifulsoup4
- peewee
- Pillow

Julia includes the IJulia kernel pre-installed for running Julia notebooks.

An admin user named `pipa` is configured by default. After registering this user and generating an API token you can manage new users from the JupyterHub interface.

## Running JupyterHub with Docker Compose

To run the JupyterHub container using Docker Compose, follow these steps:

1. Ensure you have Docker and Docker Compose installed on your system.
2. Clone this repository to your local machine.
3. Navigate to the directory containing the `docker-compose.yml` file.
4. Run the following command to start the JupyterHub container:

   ```sh
   docker-compose up
   ```

This will build the Docker image and start the JupyterHub container.

## Accessing the JupyterHub Interface

Once the JupyterHub container is running, you can access the JupyterHub interface by opening a web browser and navigating to the following URL:

```
http://localhost:8000
```

You should see the JupyterHub login page. Use the credentials you have set up to log in and start using JupyterHub.

## Adding Additional Languages

This image provides kernels for Python, R, and Julia. JupyterHub can run many other languages by installing the appropriate kernels. Common examples include:

- **C/C++**: install the `xeus-cling` kernel.
- **SQL**: install a SQL kernel such as `ipython-sql`.
- **C#**: install the `.NET Interactive` kernel.

Add the installation steps to the `Dockerfile` and rebuild the image with `docker-compose build` to enable these languages.

