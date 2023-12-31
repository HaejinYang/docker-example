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
composer를 이용하여 재설치하는 것으로 응답 속도를 개발` `가능한 수준으로 올림(28초->1.4초)

### 주의
`ENV APACHE_DOCUMENT_ROOT=/var/www/html/public`에서 서버의 도큐먼트 루트를 설정한다.
이 public 디렉토리가 라라벨의 public 디렉토리와 일치하도록 docker-compose.yml 파일을 정의해야한다.

### 변경점
설정파일을 볼륨 마운팅으로 했었다. 이러면 도커 컨테이너 안에서 실행한 설정파일 업데이트가 무효화되어, 볼륨 마운팅이 아니라 복사로 변경함.
컨테이너 안에서 `composer install` 명령어를 실행하기 위해 docker-compose.yml의 commands속성을 이용함.

