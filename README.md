# How to build this site.

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




