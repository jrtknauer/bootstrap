"""Install/uninstall the Python package manager `uv`."""

from bootstrap import shell


def install() -> None:
    """"""
    cmd_curl = [
        "curl",
        "--location",
        "--show-error",
        "--fail",
        "--silent",
        "https://astral.sh/uv/install.sh",
    ]

    process_curl = shell.run(cmd_curl, silent=True)
    process_sh = shell.run(["sh"], input=process_curl.stdout)


def uninstall() -> None:
    """"""
    pass


class _UV:
    """"""

    def __init__(self) -> None:
        """"""
        pass


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
