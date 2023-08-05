import logging
from dotenv import load_dotenv 
from pathlib import Path
import os
import requests
import json
from flask import Flask, request, url_for, abort
import subprocess

app = Flask(__name__)
logging.getLogger().setLevel(logging.INFO)
load_dotenv('config/environment.env')  # load enviornment
# DEV_PORT = os.getenv('DEV_PORT')
# logging.info(f"User is {userName} and is password is {password}")


@app.route("/")
def index():
    main()
    return "Yes"


def main():
    print("LETS START")
    print(subprocess.run(["./scripts/downloadOpenAlex.sh"], shell=True))
    logging.info("HEY")
    
    # openAlexObj = os.getenv('OpenAlexBase')
    # DOIBase = os.getenv('DOIBase')
    
    # if(openAlexObj and DOIBase):
    #     url = f'{openAlexObj}{DOIBase}'
    #     open_alex_response = requests.get(url)

    #     content = json.loads(open_alex_response.content.decode('utf-8'))
    #     print(content['doi'])
    # else:
    #     logging.error("Missing environment variables!")


if __name__ == "__main__":
    host = "localhost"
    # x = threading.Thread(target=thread_function, args=(1,))
    # x.start()
    app.run(host=host, port=8081, debug=True)
