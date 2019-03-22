FROM elixir:latest

# Insalll phoenix
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force 

RUN ssh-keygen -C kamil.softarm@gmail.com -t rsa  -f ~/.ssh/id_rsa
RUN eval "$(ssh-agent)" && ssh-add ~/.ssh/id_rsa 

RUN apt-get update 

RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN chmod +x nodesource_setup.sh && ./nodesource_setup.sh
RUN apt-get install nodejs -y  \
    && apt-get install inotify-tools -y

# Heroku toolbar
RUN curl https://cli-assets.heroku.com/install.sh | sh
 
# RUN heroku login 

RUN mkdir /elixirbridge

WORKDIR /elixirbridge/test_app
