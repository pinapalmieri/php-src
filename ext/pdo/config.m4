dnl config.m4 for extension pdo

PHP_ARG_ENABLE(pdo, whether to enable PDO support,
[  --disable-pdo           Disable PHP Data Objects support], yes)

if test "$PHP_PDO" != "no"; then

  dnl Make sure $PHP_PDO is 'yes' when it's not 'no' :)
  PHP_PDO=yes

  PHP_NEW_EXTENSION(pdo, pdo.c pdo_dbh.c pdo_stmt.c pdo_sql_parser.c pdo_sqlstate.c, $ext_shared)
  ifdef([PHP_ADD_EXTENSION_DEP],
  [
    PHP_ADD_EXTENSION_DEP(pdo, spl, true)
  ])

  ifdef([PHP_INSTALL_HEADERS],
  [
    dnl Sadly, this is a complete NOP for pecl extensions
    PHP_INSTALL_HEADERS(ext/pdo, [php_pdo.h php_pdo_driver.h php_pdo_error.h])
  ])

  dnl so we always include the known-good working hack.
  PHP_ADD_MAKEFILE_FRAGMENT
fi
