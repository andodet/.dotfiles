import re
import subprocess


class Py3status:
    cache_timeout = 60
    k = 3480

    def __init__(self):
        self.night_light_is_on = False
        self._check_redshift_is_active()

        if subprocess.run(["xrandr", "--verbose"], capture_output=True, shell=True).returncode == 0:
            self.cmd_on = ["redshift", "-O", "3480"]
            self.cmd_off = ["redshift", "-x"]
        else:
            self.cmd = ["gammastep"]

    def _check_redshift_is_active(self):
        xrandr_output = subprocess.run(["xrandr", "--verbose"], capture_output=True, text=True)
        gammas = re.findall(
            r"\tGamma:\s+\d.\d:\d.\d:\d.\d",
            xrandr_output.stdout,
        )
        gammas = [gamma.split(" ")[-1].split(":") for gamma in gammas]
        is_on = any(float(val) > 1.0 for gamma in gammas for val in gamma)
        return "" if is_on else ""

    def redshift_toggle(self):
        lightbulb = self._check_redshift_is_active()
        return {
            "full_text": lightbulb,
            "cached_until": self.py3.time_in(seconds=self.cache_timeout),
        }

    def on_click(self, event):
        if not self.night_light_is_on:
            subprocess.run(self.cmd_on, capture_output=True)
            self.night_light_is_on = True
            return {
                "full_text": "",
                "cached_until": self.py3.time_in(seconds=self.cache_timeout),
            }
        else:
            subprocess.run(self.cmd_off, capture_output=True)
            self.night_light_is_on = False
            return {
                "full_text": "",
                "cached_until": self.py3.time_in(seconds=self.cache_timeout),
            }
