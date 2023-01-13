# 커스텀 빌드

### Dockerfile을 수정하여 직접 빌드

커스텀이 가능합니다. 필요한 추가 패키지가 있다면 추가 구성이 가능합니다.

추가 패키지 설치를 위해서는 `gpu.Dockerfile`을 수정하시면 됩니다.

**참고**

- DockerHub 유저 아이디: teddylee777
- 도커명: docker-kaggle-ko
- 태그: latest

**옵션**

- `-f`: 빌드시 참고할 도커 파일

- `-t`: 빌드후 생성할 도커 이미지 타겟

```bash
git clone https://github.com/teddylee777/docker-kaggle-ko.git
cd docker-kaggle-ko
docker build -f gpu.Dockerfile -t teddylee777/docker-kaggle-ko:latest .
```

