import sys


def main() -> None:
    try:
        from .app import run
    except ModuleNotFoundError as exc:
        if exc.name == "PySide6":
            sys.stderr.write(
                "Missing dependency: PySide6.\n"
                "Use a Python interpreter with PySide6 installed, for example:\n"
                "  /Library/Developer/CommandLineTools/usr/bin/python3 -m lc103_modern_cal.main\n"
            )
            raise SystemExit(1)
        raise
    run()


if __name__ == "__main__":
    main()
