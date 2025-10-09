# https://github.com/flipflop133/weather-script

"""Small script to generate weather data."""
import json
import os
import time

import requests


class Weather:
    """Weather data is managed here."""

    error_time = 0
    data = {}
    script_path = ''

    def __init__(self):
        self.script_path = os.path.dirname(os.path.realpath(__file__))
        self.get_weather()

    def get_weather(self):
        """Retrieve current weather from weatherapi.com."""
        try:
            # retrieve data from json file
            with open(
                    f"{self.script_path}/weather_settings.json",
                    "r",
                    encoding="UTF-8") as read_file:
                self.data = json.load(read_file)
            url = "api.weatherapi.com/v1/current.json"
            key = self.data['key']
            unit = "°C" if self.data['unit'] == "Celsius" else "°F"
            parameters = self.data['parameters']
            only_icon = self.only_icon()
            icon_pos = self.icon_position()

            # retrieve weather from weatherapi.com
            request = f"http://{url}?key={key}&q={parameters}"
            response = requests.get(request)
            self.data = json.loads(response.content)
            temp = self.data['current']['temp_c'] if unit == "°C" \
                else self.data['current']['temp_f']

            # determine the icon
            icon = self.get_icon()

            fmt_temp =  f"{int(round(temp))}{unit}"
            text = f"{icon} {fmt_temp}"

            if icon_pos == "right":
                text = f"{fmt_temp} {icon}"

            weather = {"text": text, "tooltip": text}

            if only_icon:
                weather["text"] = icon

            print(json.dumps(weather))
        except requests.ConnectionError:
            self.error_handling()
        except json.JSONDecodeError:
            print("error in weather_settings.json file")

    def error_handling(self):
        """Handle errors."""
        time.sleep(self.error_time)
        self.error_time += 10
        self.get_weather()

    def get_icon(self):
        """Determine weather icon in function of the current\
        weather conditions and hour."""
        # retrieve data from json file
        with open(f"{self.script_path}/weather_icons.json",
                  "r",
                  encoding="UTF-8") as read_file:
            data = json.load(read_file)
        # get icon
        icon = ''
        for item in data:
            if self.data['current']['condition']['text'] in (item["night"],
                                                             item["day"]):
                if self.data['current']['is_day'] == 1:
                    icon = item["icon"]
                else:
                    icon = item["icon-night"]
        return icon

    def only_icon(self):
        """Determine if should display only the icon """
        if "only-icon" in self.data:
            return self.data["only-icon"]
        return false

    def icon_position(self):
        """Determine icon position."""
        if "icon-position" in self.data:
            return self.data["icon-position"]
        return "right"


Weather()
