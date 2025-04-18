""""""

import pathlib

from bootstrap import shell

def install() -> None:
    """"""
    dotfiles_dir = pathlib.Path(__file__).parent.absolute()
    home_dir = pathlib.Path.home()

    dotfile_dirs = [
        d
        for d in dotfiles_dir.iterdir()
        if d.is_dir()
        and not d.name.startswith("_")
    ]

    for dir in dotfile_dirs:
        shell.stow(dir, dotfiles_dir, home_dir)
