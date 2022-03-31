---
title: "Puppet"
date: 2022-03-28T19:56:04+01:00
---


#### 1. Genereal

- Common commands
```bash
$ puppet help
$ puppet apply path/file.pp
$ puppet resource mailalias postmaster
$ facter
$ facter | grep version
$ facter | grep mb
$ facter | grep free
$ puppet facts 
$ puppet facts find
$ puppet facts --render-as yaml
$ facter --yaml
$ puppet facts --render-as json 
$ facter --json
$ puppet module search apache
```

- Variables
Start with $, must start with lowercase or underscore, and it only can contain numbers, letter and underscore.
```bash
$myvar $my_var $my3tupes    # Valid
$Myvar $my-var $3types      # Invalid
$_myvar                     # Should only used within local scope

# There are only String, Numeric, and Boolean
$ny_name = 'Jo'
$num_phone = 12342143214
$not_tre = false
$not_defined = undef
```

- Varibales in strings
Do not surround standalone variables with {} or quotes. That is only valid within a string.
```bash
$test='my-test'
$fact_uptime=$facts['uptime']
notify {'greeting':
  message => "heillo ${test} ${kernel} ${fact_uptime}"
}
```
- puppetlabs libs
  - stdlib:
    ```bash
       include stdlib
       $nametype = type_of( $my_name )
    ```

- Numbers
```bash
$decimal = 123
$decimal = 123.33
$octal = 0775
$hexadecimal = 0xFAFA
```

- Arrays
Convert an array in to a comma-separated list of values:
```bash
myfunction( *$array_of_arguments ){}

```

- Hash
```bash
$homes={
  'key1'=>'value1', 
  'key2'=>'value2',
}
```
- Functions
```bash
debug(message)
info(message)
notice(message)
warning(message)
err(message)
```
- Ruby style
```bash
notice('haha')     ====    'haha'.notice()
```

- No operation
It validates, not apply, a manifest.
```bash
file { 'testfile':
  ensure => present,
  mode => '0700',
  replace => true,
  content => 'hie1111',
  path => '/nail/home/pparuni/test.log',
  noop => true,   # <---- This will not replace the file test.log
}
```

#### References
-[Puppet Resource Types](https://puppet.com/docs/puppet/7/resource_types.html)
-[Puppet Forge catalogue of modules](https://forge.puppet.com/)

