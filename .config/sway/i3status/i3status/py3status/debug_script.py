from toggle_redshift import Py3status

if __name__ == "__main__":
    click_data = {
        "y": 13,
        "x": 1737,
        "button": 1,
        "name": "example",
        "instance": "first",
    }
    but = Py3status()

    Py3status.on_click(click_data)
