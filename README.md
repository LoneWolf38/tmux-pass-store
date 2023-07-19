# tmux-pass-store



https://github.com/LoneWolf38/tmux-pass-store/assets/20820036/03a25e6d-bc91-4727-a0ef-fd916565e332




## PassStore - A Tmux Plugin for Password Selector

## PreRequisties
- tmux
- tpm
- fzf
- fzf-tmux



## How to Install

### 1. Install tpm Plugin

Add the following line to your tmux.conf file:

```sh 
set -g @plugin 'LoneWolf38/tmux-pass-store'
```

**NOTE:** tpm recommends you list your plugins and then run tpm at the very bottom of your `tmux.conf`.

Then, run `<prefix>+I` to install the plugin


### 2. Customize Prompt (optional)

If your terminal supports [Nerd Font symbols](https://www.nerdfonts.com/), you can customize your prompt.

```sh
set -g @t-pass-prompt '  '
```

### 3. Setup the PassStore

For now the passwords are in plain text in the form of `username;password`.

The default file which the plugin looks for is `scripts/pass-store-default`.

Edit the default file and replace the `username;password` with appropriate values. 

If you don't want to put the file in the `plugins` dir then you can give any filepath to the plugin for the passStore but the format has to be the same.

```sh
set -g @t-pass-store '/path/to/file' 
```

## How to add a custom keybinding

In order to add your own custom key binding to trigger the `t` script, add the following to your `tmux.conf`:

```sh
set -g @t-bind "G"
```

You can unbind the default by entering an unmappable string (e.g. `none`)

## Bonus: macOS keyboard shortcut

My personal workflow uses `macOS Keyboard Shortcuts for tmux`
I have bound the `G` popup to `cmd+shift+g` with the following code:

<details>
<summary>Alacritty</summary>

Add the following line to your `alacritty.yml`

```yml
key_bindings:
  - { key: G, mods: Command|Shift, chars: "\x02G" } # open the tmux-password-manager popup
```

</details>




