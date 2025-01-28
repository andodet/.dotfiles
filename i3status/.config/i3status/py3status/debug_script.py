from toggle_redshift import Py3status

if __name__ == "__main__":
    click_data = {
        "y": 13,
        "x": 1737,
        "button": 1,
        "name": "example",
        "instance": "first",
    }
    button = Py3status(debug=True)

    button.on_click(event=click_data)
    button.on_click(event=click_data)
