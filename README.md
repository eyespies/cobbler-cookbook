cobbler-cookbook
================

Installs and configures [Cobbler][1] and Cobbler Web.

## Supported Platforms
- CentOS 7.x
- RedHat Enterprise Linux 7.x
- Oracle Linux 7.x

## Usage

### Full Cobbler Installation Using Defaults
Installs Cobbler and (depending on the attribute values) either Apache or Nginx as the front end to Cobbler.

**NOTE**: Currently only Nginx is supported; pull requests to finish the Apaache integration are welcome.

Include `cobblerd` in your node's `run_list` (installs Nginx by default):

```json
{
  "run_list": [
    "recipe[cobblerd::default]"
  ]
}
```

To install Cobbler with Apache instead of Nginx:

```json
{
  "attributes": {
    "cobblerd": {
      "http_service_name": "apache"
    }
  },
  "run_list": [
    "recipe[cobblerd::default]"
  ]
}
```

## Maintainers

Original Author:: [Bloomberg Compute Architecture Group][2] (<compute@bloomberg.net>)
Additional Author:: Justin Spies (<justin@thespies.org>)

###

To build and test, one can run the following (this done using ChefDK binaries):
* `bundler package`
* `kitchen verify '.*'`

[1]: http://www.cobblerd.org
[2]: http://www.bloomberglabs.com/compute-architecture/
