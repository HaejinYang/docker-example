# php-apache 이미지

## 특징

- docker/cron, docker/logrotate 실행. cron.d, logrotate.d에 있는 파일을 실행할 수 있는 위치에 복사해줌
- php.ini용 파일들 중에 하나를 선택해서 php conf.d에 복사
- .htaccess 파일은 public 디렉토리에 놓아야 함.
- 모든 경로에 대하여 index.php 파일을 호출함.
