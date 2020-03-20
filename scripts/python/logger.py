import copy
import logging
import os

import colorama

import env


# specify colors for different logging levels
LOG_COLORS = {
    logging.DEBUG: colorama.Fore.LIGHTGREEN_EX,
    logging.INFO: colorama.Fore.CYAN,
    logging.WARNING: colorama.Fore.YELLOW,
    logging.ERROR: colorama.Fore.RED,
    logging.FATAL: colorama.Fore.RED
}


class ColorFormatter(logging.Formatter):
    "FROM http://uran198.github.io/en/python/2016/07/12/colorful-python-logging.html"

    def format(self, record, *args, **kwargs):
        # If the corresponding logger has children, they may receive modified.
        # Record, so we want to keep it intact.
        new_record = copy.copy(record)
        if new_record.levelno in LOG_COLORS:
            # We want levelname to be in different color, so let's modify it.
            new_record.levelname = "{color_begin}{level}{color_end}".format(
                level=new_record.levelname,
                color_begin=LOG_COLORS[new_record.levelno],
                color_end=colorama.Style.RESET_ALL,
            )
        # Now we can let standart formatting take care of the rest.
        return super(ColorFormatter, self).format(new_record, *args, **kwargs)


class Logger():
    def getLogger(self, name):
        logger = logging.getLogger(name)
        logger.setLevel(env.LOG_LVL)
        logger_handler = logging.StreamHandler()
        logger.addHandler(logger_handler)
        use_col = env.COL_LOGS
        if use_col:
            formatter = ColorFormatter("%(asctime)s.%(msecs)03d : %(levelname)s : %(name)s : %(message)s", "%Y/%m/%d: %H-%M-%S")
        else:
            formatter = logging.Formatter('%(asctime)s.%(msecs)03d : %(levelname)s : %(name)s : %(message)s', "%Y/%m/%d: %H-%M-%S")
        logger_handler.setFormatter(formatter)
        return logger
