load("render.star", "render")
load("http.star", "http")

KEY_PRICE_URL = "https://backpack.tf/api/IGetCurrencies/v1?raw=1&key=6594beeaba29d5eb6204c3ab"

def main():
    rep = http.get(KEY_PRICE_URL)
    if rep.status_code != 200:
        fail("Bakcpack.tf request failed with status %d", rep.status_code)

    rate = rep.json()["response"]["currencies"]["keys"]["price"]["value_raw"]

    return render.Root(
        child = render.Text("KEY: %d ref" % rate)
    )