# How to build this site.

# About this repository

This is a very basic and simple site that was built using [Hugo](https://gohugo.io/) and [Grav](https://learn.getgrav.org/16). The theme I used is called [Hugo learn theme](https://learn.netlify.com/en/).  I decide to use these technologies due to my interest in goland and [markdowns](https://learn.netlify.com/en/cont/markdown/), but also my curiosity to know how Hugo and Grav works.


# How to build and publish this site.

The steps to build and publish are as follow:

1. Clone this repository
2. Make the modifications you need
3. Build the static and public files using hugo
4. Copy the content of the public folder to the root of this repository.

### NOTE:
To modify the content of the website you need to modify the content of the directory named as "source".

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

# How to add a new section and page.

```bash
$ cd source
$ hugo new --kind chapter  <NAME_NEW_SECTION>/_index.md   # <-- note it is "_index.md" no "index.md"
$ hugo new <SECTION_NAME>/<PAGE_NAME>.md        # <--Add a new page inside section
```
**NOTE**

When you edit a page remember to remove ```draft:true``` or replace ```true``` by ```false```.


### MY QUEUE

The following are topics I would like to include somewhere in this website.

1. How useful is Jsonnet?

    - https://jsonnet.org/learning/tutorial.html

2. How to build Jenkins plugins?

    - https://www.baeldung.com/jenkins-custom-plugin
    - https://jenkins.io/doc/developer/plugin-development/build-process/
    - https://jenkins.io/doc/developer/tutorial/prepare/


3.  Oreally Books I need to complete to read.
    
    - The packer book by James Turnbul
    - Network Programming with Go: Essential Skills for Using and Securing Networks by Jan Newmarch
    - Black Hat Go by Dan Kottmann, Chris Patten, Tom Steele
    - Packt series:
        - Building RESTful APIs with Go by Bartlomiej Walczak
        - Advanced Infrastructure Penetration Testing by Chiheb Chebbi
        - Practical Web Penetration Testing by  Gus Khawaja
        - Learn Website Hacking / Penetration Testing From Scratch  by Zaid Sabih
        - Learn Network Hacking From Scratch (WiFi and Wired) by Zaid Sabih 
        - Hands-on Concurrency with Go Leo Tindall
        - Building RESTful Web services with Go by Naren Yellavula


4. Compare Java-base and Go-base RESTFUL clients.

    - https://docs.couchbase.com/sync-gateway/current/rest-api-client.html

5. How OverlayFS works in Docker?

    - https://docs.docker.com/storage/storagedriver/overlayfs-driver/

6. What is good about Axios?

    - https://www.npmjs.com/package/axios

7. Keep reading and learning GO.

    - https://medium.com/rungo/everything-you-need-to-know-about-packages-in-go-b8bac62b74cc

8. Coursera courses:

    - Concurrency in go
    - Site Reliability Engineering: Measuring and Managing Reliability
    - Security and Privacy in TOR Network
    - The Raspberry Pi Platform and Python Programming for the Raspberry Pi
    - Mathematical Foundations for Cryptography


9. Tmux self config 

    - https://github.com/gpakosz/.tmux
