""""""

from bootstrap import shell

def install() -> None:
    """"""
    _install_stow()

def _install_stow() -> None:
    """"""
    apt_get = shell.AptGet()
    apt_get.update()
    apt_get.upgrade()
    apt_get.install("stow")
