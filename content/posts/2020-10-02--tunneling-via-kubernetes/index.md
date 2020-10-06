---
title: "Tunneling via Kubernetes"
category: "networking"
tags: ["kubernetes", "networking"]
cover: tunneling-via-kubernetes-6181.png
author: Rameez Khan
---

![Banner](tunneling-via-kubernetes-6181.png)

For security reasons, you might find your database (or any service for that matter) in an internal subnet, somewhere in the cloud. Accessing this for local debugging/development can be a pain.

Using Kubernetes (assuming you have a cluster already), you can use this to your advantage.

## Create the tunnel

What you need:

- Kubernetes (with API access via `kubectl` ofcourse)
- An image with netcat installed (Nice opportunity to punt [mine](https://rameezkhan.me/debug-on-kubernetes-with-a-swiss-army-knife-of-tools/) 😉)
- [tcpserver](https://manpages.debian.org/testing/ucspi-tcp/tcpserver.1.en.html) (should come with any Debian based distro)

Next, ensure your pod is running. I have a handy alias for this.

```bash
alias kdebug='kubectl exec -it debuggery -- zsh || kubectl run --rm -it debuggery --image=rameezk/debuggery --restart=Never'
```

In other terminal window, run the following:

```bash
tcpserver 127.0.0.1 "$local_port" kubectl exec -i debuggery -- nc "$remote_host" "$remote_port"
```

Where `$local_port` is the local port you would access the service on (i.e. `127.0.0.1:$local_port`). Similarly `$remote_host` and `$remote_port` are the remote host and port respectively. The host, for example, will be the DB host address.

You can make this a script as well and add to it to your .zshrc or .bashrc. You can see mine [here](https://github.com/rameezk/dotfiles/blob/master/system/function.zsh#L78-L118).

## Other ways of tunneling

If you have a Jumphost (or [Bastion](https://rameezkhan.me/proxy-ssh-traffic-via-bastion-hosts-with-proxyjump/)) and assuming it can access your private subnet, you can create an SSH tunnel as well.
