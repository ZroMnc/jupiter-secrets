# Jupiter Secrets

## Configure eYAML

The Puppet modules use Hiera for lookups of configuration data, and
`hiera-eyaml` for encryption of sensitive information such as credentials.

Install eYAML to encrypt/decrypt sensitive parameters:

```bash
gem install hiera-eyaml
```

Copy the two PKCS7 keys to the `eyaml-keys` directory and point
to these keys in your local `~/.eyaml/config.yaml`:

```yaml
---
pkcs7_public_key: /path/to/repo/puppet_public_key_dev.pkcs7.pem
pkcs7_private_key: /path/to/repo/private_key_dev.pkcs7.pem
```

Replace `/path/to/repo` with the actual path for your clone of the `jupiter`
repository. Now you should be able to use eYAML on any parameter file encrypted
with the eYAML development keys ('*_dev.pkcs7.pem')

## Base Usage

```bash
./jupiter.sh -h
Usage: ./jupiter.sh [-ed]

    Keys Helper
        -e              Encrypts the keys directory
        -d              Decrypt the keys directory
```

## ToDo
Extend the script to handle multiple GPG keys from the directory

