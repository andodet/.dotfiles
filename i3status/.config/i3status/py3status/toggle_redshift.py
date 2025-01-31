import os
import subprocess
from typing import Any


def get_gamma_cmds(session_type: str, gamma: int = 4000) -> tuple[list[str], list[str]]:
    """
    Find the right command to apply gamma to the monitor
    """
    if session_type == "x11":
        cmd_on = ["redshift", "-O", str(gamma)]
        cmd_off = ["redshift", "-x"]
    elif session_type == "wayland":
        cmd_on = ["gammastep", "-P", "-O", str(gamma)]
        cmd_off = ["killall", "gammastep"]
    else:
        cmd_on = ["redshift", "-O", str(gamma)]
        cmd_off = ["redshift", "-x"]
        print("Could not infer session type, defaulting to redshif")

    return cmd_on, cmd_off


class Py3status:
    cache_timeout = 5
    k = 3480

    def __init__(self, debug: bool = False):
        self.debug = debug
        self.night_light_is_on = False
        self._check_redshift_is_active()

        self.session_type = os.getenv("XDG_SESSION_TYPE", "")
        self.cmd_on, self.cmd_off = get_gamma_cmds(self.session_type, 3400)

        if debug:
            self._print_class_attributes()  # A debug print

    def _check_redshift_is_active(self):
        # xrandr_output = subprocess.run(["xrandr", "--verbose"], capture_output=True, text=True)
        # gammas = re.findall(
        #     r"\tGamma:\s+\d.\d:\d.\d:\d.\d",
        #     xrandr_output.stdout,
        # )
        # gammas = [gamma.split(" ")[-1].split(":") for gamma in gammas]
        # is_on = any(float(val) > 1.0 for gamma in gammas for val in gamma)
        # check if gammastep is currently running
        out = subprocess.run(["pgrep", "gammastep"], capture_output=True).stdout
        is_on = True if out.decode() != "" else False
        return "🌙" if is_on else "☀️"

    def redshift_toggle(self) -> dict[str, Any]:
        """
        Toggles the redshift command to apply gamma to the monitor
        """
        lightbulb = self._check_redshift_is_active()
        return {
            "full_text": lightbulb,
            "cached_until": self.py3.time_in(seconds=self.cache_timeout),
        }

    def on_click(self, event) -> dict[str, Any]:
        """
        Handle on-click event
        """
        if not self.night_light_is_on:
            self._print_class_attributes()
            # output = self.py3.command_output(self.cmd_on, shell=False)
            subprocess.Popen(self.cmd_on)
            self.night_light_is_on = True
            return {
                "full_text": "dio",
                "cached_until": self.py3.time_in(seconds=self.cache_timeout),
            }
        else:
            subprocess.run(self.cmd_off)
            self.night_light_is_on = False
            return {
                "full_text": "porco",
                "cached_until": self.py3.time_in(seconds=self.cache_timeout),
            }

    def _print_class_attributes(self):
        """Print all class attributes for debugging purposes"""
        for key, value in self.__dict__.items():
            print(f"{key}: {value}")


if __name__ == "__main__":
    from py3status.module_test import module_test

    module_test(Py3status)
