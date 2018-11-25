+++
author = "admin"
date = "2016-08-25T13:35:57+08:00"
description = "pyenv: cannot rehash: /home/XXX/.pyenv/shims/.pyenv-shim exists"
keywords = ["python", "pyenv", "rehash"]
tags = ["pyenv", "linux", "python"]
categories = [ "python", "linux" ]
title = "pyenv rehash problem"
topics = ["linux"]
type = "post"
url = "/2016/08/25/pyenv_rehash_problem.html"

+++

#pyenv rehash problem

description:

	pyenv: cannot rehash: /home/XXX/.pyenv/shims/.pyenv-shim exists


fixup:

	rm /home/XXX/.pyenv/shims/.pyenv-shim exists
	pyenv rehash && hash -r
	pyenv rehash && rehash

note:

	replace XXX with your real username

reference:

[http://stackoverflow.com/questions/29753592/pyenv-shim-not-created-when-installing-package-using-setup-py](http://stackoverflow.com/questions/29753592/pyenv-shim-not-created-when-installing-package-using-setup-py)