---
title: "Adding keybindings to Doom Emacs"
category: "editors"
tags: ["emacs", "doom-emacs", "editors"]
cover: adding-keybinding-to-doom-emacs-8172.png
author: Rameez Khan
---

## Doom Emacs? What happened to Spacemacs?

In my previous post last year ... _Wow! I've really been neglecting this blogging thing, haven't I?_

... I sung the praises for Spacemacs (an Emacs distrubution with pre-configured layers).

I've since discovered [Doom Emacs](https://github.com/hlissner/doom-emacs) and have recently made the switch to it.
For two reasons mainly:

**Speed**. Doom Emacs is fast! Super Fast! (It has some nice lazy loading)

**Configuration**. Spacemacs did it a lot of magic via its layers configs. I wanted to learn how to configure Emacs myself but didn't want to start
from scratch. Doom Emacs was a nice middle ground.

Once of the first things I needed to configure were some keybindings I was used to in Spacemacs. This is how I did it.

## Adding a keybinding in Doom Emacs

I was missing a binding for adding a new journal entry using [org-journal](https://github.com/bastibe/org-journal).

A quick Google led me to adding the following to my `config.el`.

```elisp
(map! :leader
      :desc "New journal entry"
      "a j j" #'org-journal-new-entry)
```

This worked!

However I soon discovered, hitting the leader key (`SPC` in my case) showed "a" as "+prefix". I wondered how I can rename/declare this prefix?

After some exhaustive Googling, I eventually did a `ripgrep` in `~/.emacs.d` and found some code for the default evil bindings.

This led me to tweaking my configuration to this.

```elisp
(map! :leader
      (:prefix-map ("a" . "applications")
       (:prefix ("j" . "journal")
        :desc "New journal entry" "j" #'org-journal-new-entry
        :desc "Search journal entry" "s" #'org-journal-search)))
```

Nice!

## Conclusion

Switching to Doom has been worth it for me. Sure, the initial learning curve is slightly steep, but it has certainly paid off.

I now finally know how to add a keybinding to Emacs.

Onward and upward!

That's it for now.

Peace ✌🏽
