# About Elixir-playground

This is a bunch of my first attempts of writing something in Elixir. 


## Using Elixir with Docker

When I'm giving a try to some new language or technology, I don't like to install all of the things needed,
directly on my computer.
Docker is the best way to start from scratch in 3 minutes, 
and remove the image if I stop playing with particular technology.

There is a Docker image for Elixir(what a suprise, huh?).

To start Elixir in interactive mode, just put: 

```bash
docker run -it --rm elixir
```

To use command line inside docker container:

```bash
docker run -it  --rm elixir bash
```


I decided to spend a bit longer with elixir, so I've mounted my project directory to Elixir's Docker container.


```
docker run -v /path/to/project/on/my/computer:/elixirproject -it  elixir bash
```

