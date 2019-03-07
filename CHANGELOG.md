# cobblerd CHANGELOG
This file lists the changes made for each version of the cobblerd cookbook.

## Version 1.0.6
- Justin Spies - (fix) workaround missing /run/uwsgi that is expected by /etc/uwsgi.ini
- Justin Spies - (fix) support Chef 14 by ensuring all resources use new_resource. to access attributes
- Justin Spies - (fix) force install of Django 1.6 to avoid ImportError: cannot import name TEMPLATE_CONTEXT_PROCESSORS

## Version 1.0.5
- Justin Spies - (fix) specify correct version of the uwsgi-plugin-python package
- Justin Spies - (fix) address Fauxhai OS version deprecation warning
- Justin Spies - (fix) add missing ICMP firewall rules

## Version 1.0.4
- Justin Spies - (fix) use fixed version of Gherkin to avoid "LoadError: cannot load such file -- cucumber/core/gherkin/tag_expression"
- Justin Spies - (doc) update copyright
- Justin Spies - (feature) use standardized CI/CD process
- Justin Spies - (fix) switching to alternate build configuration since the old one did not work
- Justin Spies - (fix) install RSPEC via *bundler*
- Justin Spies - (fix) update to use newer Ruby that is part of Chef

## Version 1.0.3
- Justin Spies - Disable TLS 1.0 and TLS 1.1
- Justin Spies - [Add STS header](https://www.nginx.com/blog/http-strict-transport-security-hsts-and-nginx/)

## Version 1.0.2
- Justin Spies - Updated nginx configuration to include the 'root' path
- Justin Spies - Add a patched version of scm_track.py that is not yet installed / used; keeping it in this cookbook until the Cobbler software is properly patched

## Version 1.0.0
- Justin Spies - First production release

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
