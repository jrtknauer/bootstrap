""""""

import enum
from typing import List, Union, Optional, Dict
import pathlib
import subprocess
import shlex


def run(
    cmd: List[str],
    input: Optional[Union[str, bytes]] = None,
    env: Dict[str, str],
    silent: bool = False,
    ) -> subprocess.CompletedProcess:
    """"""
    cmd_out = shlex.join(cmd)
    print(cmd_out, flush=True)

    process = subprocess.run(
            cmd,
            input=input,
            text=True,
            capture_output=True,
        )

    if not silent:
        print(process.stdout)
        print(process.stderr)

    return process


def stow(package: pathlib.Path, dir: pathlib.Path, target: pathlib.Path) -> None:
    """"""
    cmd = [
        "stow",
        "--restow",
        "--dir", str(dir),
        "--target", str(target),
        "--verbose",
        package.name
    ]

    run(cmd)


class AptGet:
    """"""

    def __init__(self) -> None:
        """"""
        pass

    def update(self) -> None:
        """"""
        cmd = [
            "sudo",
            "apt-get",
            "update"
        ]

        run(cmd)

    def upgrade(self) -> None:
        """"""
        cmd = [
            "sudo",
            "apt-get",
            "--yes",
            "upgrade"
        ]

        run(cmd)

    def install(self, packages: Union[str, List[str]]) -> None:
        """"""
        if isinstance(packages, str):
            packages = [packages]

        cmd = [
            "sudo",
            "apt-get",
            "--yes",
            "install",
        ] + packages

        run(cmd)




class ExitCode(enum.IntEnum):
    """"""

    SUCCESS = 0
    FAILURE = 1
