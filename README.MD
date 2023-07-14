# 도커 모음
도커를 사용하면서 기본이 되었던 docker-compose.yml, Dockerfile들을 모음

# 목록

## php-basic
php-apache 이미지를 활용하여 도커에서 실행 확인

## php-debug
php-apche 이미지와 xdebug를 이용하여 PHPStorm에서 라인브레이크가 가능한 디버그 확인

## mysql
mysql 공식 이미지를 활용하여 볼륨마운팅과 함께 mysql 실행

## laravel-basic
php-apache, mysql 이미지를 활용하여 라라벨 프레임워크 실행 확인. vendor를 제외한 나머지 코드를 볼륨 마운팅하고, vendor는 컨테이너 실행 후
composer를 이용하여 재설치하는 것으로 응답 속도를 개발 가능한 수준으로 올림(28초->1.4초)