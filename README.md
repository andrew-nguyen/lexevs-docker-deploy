# LexEVS Dockerization Project

This repository provides configuration files for the containerized distribution and automated deployment of LexEVS using Docker. Pre-built, version-tagged images published to the [Docker Hub repository](https://hub.docker.com#fixme) are intended for both development and production use. In typical Docker fashion, environment-specific configuration parameters are provided at runtime via environment variables. Containers also conform to the [service packaging requirements](https://healthservices.atlassian.net/wiki/display/PE/Service+Packaging+Requirements) of [HSPC](http://hspconsortium.org) for future distribution and automated deployment via the HSP Marketplace.

## Running a LexEVS Release

Users wanting to _deploy_ LexEVS may use pre-built release images. It is not necessary to build the software from scratch.

TODO Detailed instructions

	docker run ...

## Loading Data

TODO Need to figure out how this is going to work sanely without packaging any content into the images themselves.


## Building a LexEVS Image

Developers working on LexEVS releases will want to build release images early in the development cycle. Images are intended to carry from development through testing and into production environments in a byte-identical manner. That is, images are not rebuilt for a specific environment; they are built *once* and _configured_ for an environment at runtime via environment variables. If you, as a developer, find yourself adding a configuration file or setting that is "baked in" to the image at build time, you're doing it wrong. :)

TODO Detailed instructions

	docker build ...


## Contributors

* Preston Lee <preston@asu.edu>
* Dere Hamel

## License

Apache 2.0?
