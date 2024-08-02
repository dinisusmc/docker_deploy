# This is a simple example web app that is meant to illustrate the basics.
from flask import Flask, render_template, redirect, g, request, url_for
import requests

#ip = requests.get('https://checkip.amazonaws.com').text.strip()+":5001"

app = Flask(__name__)

ip = "192.168.1.169:5001"

@app.route("/")
def show_list():
      resp = requests.get(f"http://{ip}/api/items")
      resp = resp.json()
      
      return render_template('index.html', todolist=resp, host=ip)

if __name__ == "__main__":
    app.run("0.0.0.0", 5002)