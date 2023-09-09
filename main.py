import logging
from dotenv import load_dotenv 
from pathlib import Path
import os
import requests
import json
from flask import Flask, request, url_for, abort, jsonify
import subprocess
import threading
from utils.utils import exectueScript

app = Flask(__name__)
logging.getLogger().setLevel(logging.INFO)
load_dotenv('config/environment.env')  # load enviornment
# DEV_PORT = os.getenv('DEV_PORT')
# logging.info(f"User is {userName} and is password is {password}")


@app.route("/")
def index():
    return "App is up" , 200


@app.route("/downloadOpenAlex")
def downloadOpenAlex():
    try:
        status = exectueScript(
            start_log="Download openAlex data",
            script_path="./scripts/downloadOpenAlex.sh"
        )
        if (status):
            status = exectueScript(
                start_log="Create BigQuery dataset and tables",
                script_path="./scripts/createBqDataSet.sh"
            )
            if (status):
                return 200, 'ok'
        
        return 500, 'fail'
    
    except Exception as ex:
        logging.error("Falied at /downloadOpenAlex rourte. data will not be update!!! Exception: " + str(ex))
        return 500, 'fail'


def runInitiateScripts():
    try:

        # download google CLI
        status = exectueScript(
            start_log="     ----------------------Install Google CLI----------------------",
            script_path="./scripts/installGoogleCLI.sh"
        )
        if (status):
            # download openAlex data
            status = exectueScript(
                start_log="     ----------------------Download openAlex data----------------------",
                script_path="./scripts/downloadOpenAlex.sh"
            )
            # create BigQuery dataset and tables and load openAlex data into them
            if (status):
                status = exectueScript(
                    start_log="     ----------------------Create BigQuery dataset and tables----------------------",
                    script_path="./scripts/createBqDataSet.sh"
                )
                if (status):
                    return True
                else: 
                    logging.error("Failed to create BigQuery assets")
            else:
                logging.error("Failed to download openAlex data")
        else:
            logging.error("Failed to download google CLI")

        return False

        
    except Exception as ex:
        logging.error("Erro occur on main function. Exception: "+ str(ex))


    
    # openAlexObj = os.getenv('OpenAlexBase')
    # DOIBase = os.getenv('DOIBase')
    
    # if(openAlexObj and DOIBase):
    #     url = f'{openAlexObj}{DOIBase}'
    #     open_alex_response = requests.get(url)

    #     content = json.loads(open_alex_response.content.decode('utf-8'))
    #     print(content['doi'])
    # else:
    #     logging.error("Missing environment variables!")

if __name__ == "main":
    print("Start process .... ")
    runInitiateScripts()

#     # download_openAlex_data_therad = threading.Thread(target=main, args=(), daemon=True)
#     # download_openAlex_data_therad.start()
    
#     app.run(host="localhost", port=8081, debug=False)
