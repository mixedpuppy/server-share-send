import logging

logger = logging.getLogger('oid')
fh = logging.FileHandler('/tmp/oid.log')
fh.setLevel(logging.DEBUG)
logger.addHandler(fh)
logger.setLevel(logging.DEBUG)
logger.debug('starting')
