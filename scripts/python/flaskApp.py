from flask import (Flask, copy_current_request_context, jsonify,
                   render_template, request, send_file)
import json
import os
import requests

import env 

from logger import Logger
logger = Logger().getLogger("Client")

APP = Flask(__name__, static_url_path='/static')


@APP.route('/index', methods=['GET'])
def index():
    logger.info("/index request received")
    return "Hello World!"


def main():
    """Start the script"""
    logger.info("Starting Flask App")
    APP.run(host="0.0.0.0", port=os.getenv('PORT', '80'))


if __name__ == '__main__':
    main()