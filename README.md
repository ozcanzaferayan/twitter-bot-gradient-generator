# Twitter Bot - Gradient Generator

Gradient bot is github action that creates gradient images and send as tweet.

## Sample generated image

![Gradient image named shroom haze](./art/generated_gradient.png)

## Requirements

1. Twitter app that associated with twitter account.
2. Public or private Github repo

## Usage

1. Fork this repo.
2. Go to your forked repo's "Settings" tab and navigate to "Secrets" from left sidebar.
3. Create secrets according to your twitter app information:

```bash
MY_SCREEN_NAME="Zafer AYAN"
MY_LANGUAGE="tr"
CONSUMER_KEY="abcdefghijklmnoprstuvyzaB"
CONSUMER_SECRET="abcdefghijklmnoprstuvyzabcdefghijklmnoprstuvyzabcd"
ACCESS_TOKEN="12345678-abcdefghijklmnoprstuvyzabcdefghijklmnoprs"
ACCESS_TOKEN_SECRET="abcdefghijklmnoprstuvyzabcdefghijklmnoprstuvy"
# for debugging
ACTIONS_STEP_DEBUG=true
```

4. Finally change some files in repo and commit as examples section

## Options

| Parameter    | Description                      | Example             |
|--------------|----------------------------------|---------------------|
| -gradient    | Specifies gradient name          | -gradient 'Sunrise' |
| --send-tweet | Sends tweet with generated image |                     |
| [skip-ci]    | Skips ci                         |                     |

## Examples

```bash
# Skips ci and does nothing
git commit -m "Changed some files [skip-ci]"
git push
```

```bash
# Creates randomly generated gradient
git commit -m "Fixed some items"
git push
```

```bash
# Creates specific gradient that given as parameter. E.g. Sunrise gradient
git commit -m "Fixedd -gradient 'Sunrise'"
git push
```

```bash
# Creates specific gradient and sends tweet
git commit -m "Plz work -gradient 'Sunrise' --send-tweet"
git push
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)