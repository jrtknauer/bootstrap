"""Install/uninstall the Python package manager `uv`.

https://docs.astral.sh/uv/getting-started/installation/
"""

from bootstrap import shell
import shutil
import pathlib


def install() -> None:
    """"""
    # cmd_curl = [
    #     "curl",
    #     "--location",
    #     "--show-error",
    #     "--fail",
    #     "--silent",
    #     "https://astral.sh/uv/install.sh",
    # ]
    #
    # process_curl = shell.run(cmd_curl, silent=True)
    # cmd_shell = ["sh"]
    #
    # process_shell = shell.run(cmd_shell, input=process_curl.stdout)

    uv = _UV()
    uv.check_health()


def update() -> None:
    """"""
    uv = _UV()
    uv.update()


def uninstall() -> None:
    """"""
    pass


def check_health() -> None:
    """"""
    pass


class _UV:
    """"""

    def __init__(self) -> None:
        """"""
        pass

    def check_health(self) -> None:
        """"""
        cmd = [
            "uv",
            "--version",
        ]
        process = shell.run(cmd)
        assert process.returncode == 0

    def update(self) -> None:
        """"""
        cmd = [
            "uv",
            "self",
            "update",
        ]
        process = shell.run(cmd)

    def clean_cache(self) -> None:
        """"""
        cmd = [
            "uv",
            "cache",
            "clean",
        ]
        process = shell.run(cmd)

    @property
    def python_dir(self) -> str:
        """"""
        cmd = [
            "uv",
            "python",
            "dir",
        ]
        process = shell.run(cmd)
        return process.stdout.strip()

    @property
    def tool_dir(self) -> str:
        """"""
        cmd = [
            "uv",
            "tool",
            "dir",
        ]
        process = shell.run(cmd)
        return process.stdout.strip()


def _cleanup_stored_data() -> None:
    """"""
    _uv_clean_cache()


def _uv_clean_cache() -> None:
    """"""
    cmd = [
        "uv",
        "cache",
        "clean",
    ]
    process = shell.run(cmd)


def _uv_python_dir() -> str:
    """"""
    cmd = [
        "uv",
        "python",
        "dir",
    ]
    process = shell.run(cmd)
    return process.stdout.strip()


def _uv_tool_dir() -> str:
    """"""
    cmd = [
        "uv",
        "tool",
        "dir",
    ]
    process = shell.run(cmd)
    return process.stdout.strip()
