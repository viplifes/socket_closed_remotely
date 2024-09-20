FROM erlang:24

ADD https://github.com/erlang/rebar3/releases/download/3.17.0/rebar3 /usr/bin/rebar3 
RUN chmod a+x /usr/bin/rebar3 && chmod 777 /usr/bin/rebar3
RUN apt update && apt install -y git
WORKDIR /app
COPY rebar.config /app/rebar.config 
COPY src /app/src
RUN rebar3 get-deps && rebar3 as local release -n myapp

ENTRYPOINT _build/local/rel/myapp/bin/myapp-1 foreground
# ENTRYPOINT sleep 20000