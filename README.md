[shairport-sync](https://github.com/mikebrady/shairport-sync) is an Apple AirPlay receiver. It can receive audio directly from iOS devices, iTunes, etc. Multiple instances of shairport-sync will stay in sync with each other and other AirPlay devices when used with a compatible multi-room player, such as iTunes or [forked-daapd](https://github.com/jasonmc/forked-daapd).

This is a fork of the project by [Kevin Eye](https://github.com/kevineye/docker-shairport-sync) which seemed abandonded.

## Get up and running

Copy/past a config-file from this repo and run

```bash
docker run -v $PWD:/config xantios/shairport 
```

## Get up and running fast, but with more options
- Clone this repo
- Run the included build script
- Copy the example config, and set it to your liking (defaults should work most of the time)
- Run the included run script

