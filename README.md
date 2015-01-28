[azukiapp/web-based](https://registry.hub.docker.com/u/azukiapp/web-based/)
================

Base docker image to run Web applications

- MySQL Client
- PostgreSQL Client
- MongoDB

##azk
Example of using that image with the [azk](http://azk.io):

```
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  "web-based": {
    // Dependent systems
    depends: [],
    // More images:  http://images.azk.io
    image: { docker: "azukiapp/web-based" },
    // Steps to execute before running instances
    provision: [],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    command: "# command to run app",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 2},
    http: {
      // web-based.azk.dev
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    envs: {
      // set instances variables
      EXAMPLE: "value",
    },
  },
});
```

Building the base image
-----------------------

To create the base image `azukiapp/web-based`, execute the following command on the `web-based` folder:

```sh
$ docker build -t azukiapp/web-based .
```
