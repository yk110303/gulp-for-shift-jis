#!/usr/bin/env bats

expect_result <<_EOT_
@charset shift_jis
body{color: red;}
_EOT_

function setup {
    mkdir ./test
    touch ./test/src/sample.scss
    touch ./test/other_src/sample.scss

    "
    @charset shift_jis
    var $color = red
    body {color: $color;}
    " >> ./test/src/sample.scss
}

function teardow {
    rm -rf ./test
}

@test "default dir" {
    . ../build.sh
    [ "$output" = "foo: no such file 'nonexistent_filename'" ]
}

@test "setting dir" {
    . ../build.sh -s /test/other_src -d /test/other_dist
    $result = cat /test/other_dist/sample.css

    expect_result <<_EOT_
@charset shift_jis
body{color: red;}
_EOT_

    [ "$result" = "$expect_result" ]
}

@test "diffirent environment" {
    . ../build.sh
    [ "$STDERR" = "[Error] Sorry. This tool is only windows environment." ]
}
