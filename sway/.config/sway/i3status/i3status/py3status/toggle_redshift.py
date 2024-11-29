import os
import re
import subprocess


def hello() -> bool:
    return "a"


class Py3status:
    def __init__(self):
        self.text = "hello man"
        self.redshift_is_on = False

        self._check_redshift_is_active()

    def _check_redshift_is_active(self):
        xrandr_output = subprocess.run(
            ["xrandr", "--verbose"], capture_output=True, text=True
        )
        gammas = re.findall(
            r"\tGamma:\s+\d.\d:\d.\d:\d.\d",
            xrandr_output.stdout,
        )
        gammas = [gamma.split(" ")[-1].split(":") for gamma in gammas]
        is_on = any(float(val) > 1.0 for gamma in gammas for val in gamma)
        return "" if is_on else ""

    def redshift_toggle(self):
        lightbulb = self._check_redshift_is_active()
        return {"full_text": lightbulb, "cached_until": self.py3.time_in(seconds=60)}

    def on_click(self, event):
        # is_redshift_enabled = os.getenv("REDHSHIFT_ENABLED", "")
        if not self.redshift_is_on:
            subprocess.run(["redshift", "-O", "3480"], capture_output=True)
            # os.environ["REDSHIFT_ENABLED"] = "true"
            # self.redshift_is_on = True
            self.redshift_is_on = True
            return {"full_text": "", "cached_until": self.py3.time_in(seconds=60)}
        else:
            subprocess.run(["redshift", "-x"], capture_output=True)
            subprocess.run(["redshift", "-O", "4000"], capture_output=True)
            # os.environ["REDSHIFT_ENABLED"] = "false"
            self.redshift_is_on = False
            return {"full_text": "", "cached_until": self.py3.time_in(seconds=60)}
