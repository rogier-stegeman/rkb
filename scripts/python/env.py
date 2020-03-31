"""Load the env variables from the os"""
import os
import logging
from dotenv import load_dotenv

load_dotenv()

# Logging
LOG_LVL = os.getenv("LOG_LVL", "INFO")
COL_LOGS = os.getenv("COL_LOGS") == "true"
