--TEST--
No references
--SKIPIF--
<?php
if (!extension_loaded('uref')) {
	echo 'skip';
}
?>
--FILE--
<?php
$s = new stdClass;
$u = new WeakReference($s);

$ref = &$u->property;
?>
--EXPECTF--
Fatal error: Uncaught RuntimeException: WeakReference objects do not support references in %s:5
Stack trace:
#0 {main}
  thrown in %s on line 5
