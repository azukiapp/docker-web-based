[azukiapp/web-based](http://images.azk.io/#/web-based)
==================

Base docker image to run **Linux** applications in [`azk`](http://azk.io)

Versions (tags)
---

- [`latest`, `trusty`, `14`, `14.04`](https://github.com/azukiapp/docker-web-based/blob/master/Dockerfile)

Image content:
---

- Ubuntu 14.04
- Git
- VIM

Database:

- PostgreSQL client
- MySQL client
- MongoDB

### Usage with `azk`

Example of using that image with the [azk](http://azk.io):

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */
 
// Adds the systems that shape your system
systems({
  "my-app": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: {"docker": "azukiapp/web-based"},
    // Steps to execute before running instances
    provision: [
      // "./script.sh",
    ],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    command: "# command to run app. i.g.: `./start.sh`",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 2},
    http: {
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    ports: {
      // http: "8080"
    },
    envs: {
      // set instances variables
      EXAMPLE: "value",
    },
  },
});
```


### Usage with `docker`

To create the image `azukiapp/web-based`, execute the following command on the docker-web-based folder:

```sh
$ docker build -t azukiapp/web-based .
```

To run the image and bind to port 8080:

```sh
$ docker run -it --rm --name my-app -p 8080:8080 -v "$PWD":/myapp -w /myapp azukiapp/web-based script.sh
```

Logs
---

```sh
# with azk
$ azk logs my-app

# with docker
$ docker logs <CONTAINER_ID>
```

## License

Azuki Dockerfiles distributed under the [Apache License](https://github.com/azukiapp/dockerfiles/blob/master/LICENSE).
