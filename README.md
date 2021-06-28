# screenshot

You can take screenshots and recordings with it. In different formats.
It's integrated with rofi.
What more do you want.

The configuration file is located under `~/.confg/.screenshotrc` by default, though the current configuration abilities are very limited (see the `# Variables` section in `bin/screenshot`), and can all be set with command-line arguments.


## Install

```bash
git clone https://github.com/runarsf/screenshot
cd screenshot
sudo make install
```


### Dependencies

- rofi
- ffcast
- xclip
- slop


## Uninstall

```bash
sudo make uninstall
```


### Sample commands / sxhkd configuration

```sxhkd
# Take a screenshot based on a selection and pass the path to sharenix to upload it to a custom server
alt + p
	screenshot --region --open 'sharenix -n -c'
# Open an interactive rofi menu and save the result to a auto-named file, then upload it to a custom server using sharenix
alt + shift + p
	screenshot --file --open 'sharenix -n -c'
```
