## this is the location where we need to host the dockerfile for this class, and point dockerhub to it.

In this case, being this a dummy class example, we are not doing really anything in the docker file, other than simply pulling an upstream bioconductor image

To build the image manually on a test host we can do something like this

```sh
$> sudo docker build -t rstudio_bioconductor_fasrc .
$> mkdir -p /data/sing-images/Fall_2020/fasrc_sandbox
$> mkdir -p /data/tmp
$> sudo docker run -v /var/run/docker.sock:/var/run/docker.sock -v /data/sing-images/Fall_2020/fasrc_sandbox:/output -v /data/tmp:/tmp --privileged -t --rm quay.io/singularity/docker2singularity rstudio_bioconductor_fasrc:latest
```
