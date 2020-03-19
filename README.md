# How to build this site.

# About this repository

This is a very basic and simple site that was built using [Hugo](https://gohugo.io/) and [Grav](https://learn.getgrav.org/16). The theme I used is called [Hugo learn theme](https://learn.netlify.com/en/).  I decide to use these technologies due to my interest in goland and [markdowns](https://learn.netlify.com/en/cont/markdown/), but also my curiosity to know how Hugo and Grav works.


# How to build and publish this site.

The steps to build and publish are as follow:

1. Clone this repository
2. Make the modifications you need
3. Build the static and public files using hugo
4. Copy the content of the public folder to the root of this repository.

In other words:

```bash
$ git clone https://github.com/percyperezdante/percyperezdante.github.io.git
$ cd percyperezdante.github.io
$ cd source  # Here is where all modifications needs to be done.
# In here: vim to modify any content or hugo to make changes.
$ ./publishSite.sh
$ cd ..
$ git add .
$ git commit -m "Update content"
$ git push origin master
```

Now wait for a couple of minutes and the modifications should be updated in the site.






