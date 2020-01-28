# Dragonchain Dart SDK

Talk to your dragonchain.

⚠️Warning!⚠️ This repository is not currently actively maintained. We will still welcome PRs for updates, but note that parts of this SDK may not be fully working.

## Configuration

In order to use this SDK, you need to have an Auth Key as well as
an Auth Key ID for a given Dragonchain ID. It is also strongly suggested that
you supply an endpoint locally so that a remote service isn't called to
automatically discover your dragonchain endpoint. These can be loaded into the
sdk in various ways, and are checked in the following order of precedence:

1. The `createClient` method can be initialized with an object containing
   the parameters `dragonchainId: <ID>`, `authKey: <KEY>`,
   `authKeyId: <KEY_ID>`, and `endpoint: <URL>`

2. The environment variables `DRAGONCHAIN_ID`,
   `AUTH_KEY`, `AUTH_KEY_ID`, and `DRAGONCHAIN_ENDPOINT`,
   can be set with the appropriate values

3. An ini-style credentials file can be provided at
   `~/.dragonchain/credentials` (or on Windows:
   `%LOCALAPPDATA%\dragonchain\credentials`) where the section name is the
   dragonchain id, with values for `auth_key`, `auth_key_id`, and `endpoint`.
   Additionally, you can supply a value for `dragonchain_id` in the
   `default` section to initialize the client for a specific chain
   without supplying an ID any other way

```ini
[default]
dragonchain_id = c2dffKwiGj6AGg4zHkNswgEcyHeQaGr4Cm5SzsFVceVv

[c2dffKwiGj6AGg4zHkNswgEcyHeQaGr4Cm5SzsFVceVv]
auth_key_id = JSDMWFUJDVTC
auth_key = n3hlldsFxFdP2De0yMu6A4MFRh1HGzFvn6rJ0ICZzkE
endpoint = https://35a7371c-a20a-4830-9a59-5d654fcd0a4a.api.dragonchain.com

[28VhSgtPhwkhKBgmQSW6vrsir7quEYHdCjqsW6aAYbfrw]
auth_key_id = OGNHGLYIFVUA
auth_key = aS73Si7agvX9gfxnLMh6ack9DEuidKiwQxkqBudXl81
endpoint = https://28567017-6412-44b6-80b2-12876fb3d4f5.api.dragonchain.com
```

## Contributing

Dragonchain is happy to welcome contributions from the community. You can get started [here](https://github.com/dragonchain/dragonchain-sdk-dart/blob/master/CONTRIBUTING.md).
