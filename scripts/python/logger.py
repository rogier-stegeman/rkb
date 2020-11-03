"""Custom logging class with severity level based colouring and custom formatting."""
import copy
import logging
import os

import colorama

import env


# Specify colors for different logging levels
LOG_COLORS = {
    logging.DEBUG: colorama.Fore.LIGHTGREEN_EX,
    logging.INFO: colorama.Fore.CYAN,
    logging.WARNING: colorama.Fore.YELLOW,
    35: colorama.Fore.MAGENTA,
    logging.ERROR: colorama.Fore.RED,
    logging.FATAL: colorama.Fore.RED
}


class ColorFormatter(logging.Formatter):
    "FROM http://uran198.github.io/en/python/2016/07/12/colorful-python-logging.html"
    def format(self, record, *args, **kwargs):
        # If the corresponding logger has children, they may receive modified.
        # Record, so we want to keep it intact.
        new_record = copy.copy(record)
        level = new_record.levelname
        if new_record.levelno in LOG_COLORS:
            # We want levelname to be in different color, so let's modify it.
            new_record.levelname = "{color_begin}{bold}{level}{color_end}".format(
                bold='\033[1m!' if level == 'NOTICE' else '',
                level=f'{level}{"!" if level == "NOTICE" else ""}',
                color_begin=LOG_COLORS[new_record.levelno],
                color_end=colorama.Style.RESET_ALL,
            )
        # Now we can let standard formatting take care of the rest.
        return super(ColorFormatter, self).format(new_record, *args, **kwargs)


class Logger():
    """Custom logger class with severity level based colouring, custom formatting and a new 'notice' level."""
    def getLogger(self, name):
        """Creates a new logger.

        Args:
            name (str): Name of the new logger.

        Returns:
            logger: A logger object.
        """
        logging.addLevelName(35, 'NOTICE')
        logger = logging.getLogger(name)
        logger.setLevel(env.LOG_LVL)
        logger_handler = logging.StreamHandler()
        logger.addHandler(logger_handler)
        use_col = env.COL_LOGS
        if use_col:
            formatter = ColorFormatter("%(asctime)s.%(msecs)03d : %(levelname)s : %(name)s : %(message)s", "%Y/%m/%d: %H-%M-%S")
        else:
            formatter = logging.Formatter('%(asctime)s.%(msecs)03d : %(levelname)s : %(name)s : %(message)s', '%Y/%m/%d: %H-%M-%S')
        logger_handler.setFormatter(formatter)

        logging.NOTICE = 35
        logging.addLevelName(logging.NOTICE, 'NOTICE')
        setattr(logger, 'notice', lambda message, *args: logger._log(logging.NOTICE, message, args))
        return logger


class SimpleLogger():
    """Simple custom logger class with custom formatting."""
    def getLogger(self, name):
        """Creates a new logger.

        Args:
            name (str): Name of the new logger.

        Returns:
            logger: A logger object.
        """
        logger = logging.getLogger(name)
        logger.setLevel(env.LOG_LVL)
        logger_handler = logging.StreamHandler()
        logger.addHandler(logger_handler)
        formatter = logging.Formatter('%(levelname)s: %(asctime)s.%(msecs)03d: %(message)s', '%Y/%m/%d: %H-%M-%S')
        logger_handler.setFormatter(formatter)
        return logger
