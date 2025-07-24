# Start with a slim, official Python base image
FROM python:3.9-slim

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the requirements file first to leverage Docker's layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Tell Docker that the container will listen on port 8080
EXPOSE 8080

# The command to run when the container starts, using our production server
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
