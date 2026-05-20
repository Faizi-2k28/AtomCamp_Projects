# 1. Does this website have a robots.txt? Yes — checked at https://open-meteo.com/robots.txt
#    It does not restrict API access; the /v1/ forecast endpoint is freely public.
# 2. Am I scraping public data or something behind a login? PUBLIC — no account needed.
# 3. Did I add a delay or a User-Agent header? No delay needed — we make a single request,
#    not a loop of many requests, so there is no risk of hammering the server.
#    No custom User-Agent either; the API is designed for programmatic access and does not
#    require one. For a site that rate-limits bots we would add both.

import requests

# ── API request ───────────────────────────────────────────────────────────────

url = "https://api.open-meteo.com/v1/forecast"

# Build query parameters — adding the stretch-bonus fields alongside the required ones
params = {
    "latitude": 31.55,
    "longitude": 74.35,
    "daily": "temperature_2m_max,temperature_2m_min,precipitation_sum,windspeed_10m_max",
    "past_days": 30,
    "timezone": "Asia/Karachi"
}

response = requests.get(url, params=params)

# Raise an exception immediately if the HTTP request failed (e.g. 404, 500)
response.raise_for_status()

data = response.json()

# ── Extract the four parallel lists from the "daily" key ─────────────────────

# Each list has 31 entries (today + past 30 days), all aligned by index
dates      = data["daily"]["time"]                  # list of date strings
max_temps  = data["daily"]["temperature_2m_max"]    # daily high temperatures (°C)
min_temps  = data["daily"]["temperature_2m_min"]    # daily low temperatures  (°C)
precip     = data["daily"]["precipitation_sum"]     # total rain/snow per day (mm)
windspeed  = data["daily"]["windspeed_10m_max"]     # peak wind speed per day (km/h)

# ── Print the daily table ────────────────────────────────────────────────────

print("Lahore Weather — Last 30 Days")
print("-" * 52)

# Initialise record trackers with impossible values so the first real entry
# always wins the comparison
hottest_temp  = -100
hottest_date  = ""
coldest_temp  =  100
coldest_date  = ""

# Collect any extreme-weather days for the stretch-bonus summary
extreme_days = []

for i in range(len(dates)):
    date = dates[i]
    high = max_temps[i]
    low  = min_temps[i]
    rain = precip[i]
    wind = windspeed[i]

    print(f"{date} | High: {high}°C | Low: {low}°C | Rain: {rain} mm | Wind: {wind} km/h")

    # Track the hottest daytime high
    if high > hottest_temp:
        hottest_temp = high
        hottest_date = date

    # Track the coldest overnight low
    if low < coldest_temp:
        coldest_temp = low
        coldest_date = date

    # Flag any day with heavy rain OR strong wind (stretch bonus thresholds)
    flags = []
    if rain is not None and rain > 5:
        flags.append(f"heavy rain ({rain} mm)")
    if wind is not None and wind > 30:
        flags.append(f"strong wind ({wind} km/h)")
    if flags:
        extreme_days.append((date, flags))

# ── Print the headline records ───────────────────────────────────────────────

print()
print(f" Hottest day:    {hottest_date} at {hottest_temp}°C")
print(f" Coldest night:  {coldest_date} at {coldest_temp}°C")

# ── Stretch bonus: Weather Summary ──────────────────────────────────────────

print()
print(" Extreme Weather Summary")
print("-" * 52)

if extreme_days:
    for day, reasons in extreme_days:
        reason_str = " + ".join(reasons)
        print(f"  ⚠  {day}: {reason_str}")
else:
    print("  No extreme weather days in the past 30 days.")