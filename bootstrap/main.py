""""""

import sys

from bootstrap import shell, log
from bootstrap.install import bootstrap, uv
from bootstrap.dotfiles import dotfiles

import logging

LOGGER = logging.getLogger(__name__)

def main() -> shell.ExitCode:
    log.config_logging()
    # bootstrap.install()
    # dotfiles.install()
    uv.install()
    return shell.ExitCode.SUCCESS

if __name__ == "__main__":
    sys.exit(main())
