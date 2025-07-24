import os
from flask import Flask, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def get_time():
    # Get the current time and format it
    now = datetime.utcnow()
    current_time = now.strftime("%Y-%m-%d %H:%M:%S UTC")
    
    # Return the data in JSON format
    return jsonify(
        server_time=current_time,
        message="Hello from the Simple Time API!"
    )
