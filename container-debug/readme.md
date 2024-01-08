# Docker Debugging with Distroless Images
```
docker exec
```
this command start a temp container, and this conainer use the same namespace and cgroup
FYI, two containers can share the same namespace and cgroups

```bash
# 1. Prepare the debugger "image" :
$ docker create --name debugger busybox
$ mkdir debugger
$ docker export debugger | tar -xC debugger
```

## Script Explanation

create a container with busybox image which contain bash and basic tools
then use `docker export` command to export the file-system of that container in a tar format
then untar the file-system to a debugger dir

# 2. Start container:

```
docker run -d --rm \
-v $(pwd)/debugger:/.debugger \
--name my-distroless gcr.io/distroless/nodejs \
-e 'setTimeout(() => console.log("Done"), 99999999)'
```

run the container with mount point in the debugger file-system which containe shell and basic linux tools

# 3. Start the debugging session:

```
docker exec -it my-distroless /.debugger/bin/sh
```

I have a point that If I mount a filesystem container shell, so why I remove the shell for security standard.

The answer is that the shell is only included in the debugging session and is not part of the actual application container. This way, if the application container is compromised, the attacker does not have access to a shell. The shell is only available during debugging sessions, and even then, it's isolated in its own filesystem.