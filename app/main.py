import logging
from dotenv import load_dotenv
from pathlib import Path
import os
from dotenv import dotenv_values
import requests
import json
logging.getLogger().setLevel(logging.INFO)
load_dotenv('config/environment.env')  # load enviornment
# DEV_PORT = os.getenv('DEV_PORT')
# logging.info(f"User is {userName} and is password is {password}")


def main():
    openAlexObj = os.getenv('OpenAlexBase')
    DOIBase = os.getenv('DOIBase')

    url = f'{openAlexObj}{DOIBase}'
    open_alex_response = requests.get(url)

    content = json.loads(open_alex_response.content.decode('utf-8'))
    print(content['doi'])


if __name__ == "__main__":
    main()
