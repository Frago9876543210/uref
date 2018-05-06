dnl $Id$
dnl config.m4 for extension uref

PHP_ARG_WITH(uref, whether to enable uref support,
[  --with-uref          Enable uref support], no)

PHP_ARG_WITH(llvm-config, path to llvm-config,
[  --with-llvm-config     path to llvm-config])

if test "$PHP_UREF" != "no"; then
  if test "x$LLVM_CONFIG" = "x"; then
    AC_PATH_PROG(LLVM_CONFIG, llvm-config, no)
  fi

  PHP_REQUIRE_CXX()

  LLVM_CFLAGS=`$LLVM_CONFIG --cflags`
  LLVM_LIBDIR=`$LLVM_CONFIG --ldflags --link-shared --libs all --system-libs`

  PHP_EVAL_LIBLINE($LLVM_LIBDIR, UREF_SHARED_LIBADD)
  PHP_EVAL_INCLINE($LLVM_CFLAGS, UREF_CFLAGS)

  PHP_SUBST(UREF_SHARED_LIBADD)

  AC_DEFINE(HAVE_UREF, 1, [ Have uref support ])

  PHP_NEW_EXTENSION(uref, php_uref.cc, $ext_shared,,"-std=c++11",cxx)

  PHP_ADD_MAKEFILE_FRAGMENT
fi
