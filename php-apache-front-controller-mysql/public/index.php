<?php
// .htaccess는 public 디렉토리에 두어야 한다.
// 도메인 이름뒤에 /path1/path2?key=value...가 모두 나온다.
$URI = $_SERVER['REQUEST_URI'];

switch($URI) {
    case '/abc':
        var_dump('hello');
        break;
    default:
        var_dump("매칭되는 URL이 없습니다.");
        break;
}
