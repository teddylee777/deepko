# docker-kaggle-ko
캐글 노트북(Kaggle Notebook) 커널로도 유명한 도커인 [Kaggle/docker-python](https://github.com/Kaggle/docker-python)의 GPU Docker(gpu.Dockerfile)를 기반으로 구성하였습니다. Kaggle에서 공개한 도커 이미지는 한글 폰트, 자연어처리 패키지, 형태소 분석기 등이 누락되어 있습니다.

**docker-kaggle-ko**를 만들게 된 계기는 안정적으로 업데이트 되고 있는 캐글 GPU 도커에 기반하여 **한글 폰트, 한글 자연어처리 패키지(konlpy), 형태소 분석기(mecab), Timezone 등의 설정을 추가**하여 별도의 한글 관련 패키지와 설정을 해줘야 하는 번거로움을 줄이기 위함입니다.



## 도커 환경

- OS: Ubuntu18.04
- GPU: RTX3090 x 2way
- CUDA11
- Python (anaconda): 3.7.10







## 도커 실행

- `--rm`: 도커가 종료될 때 컨테이너 삭제
- `-it`: 인터랙티브 TTY 모드 (디폴트로 설정)
- `-d`: 도커를 백그라운드로 실행
- `-p`: 포트 설정. **local 포트:도커 포트**
- `-v`: local 볼륨 마운트. **local 볼륨:도커 볼륨**
- `--name`: 도커의 별칭(name) 설정

```bash
docker run --runtime nvidia --rm -itd -p 8888:8888 -v /data/jupyter_data:/home/jupyter --name kaggle-ko teddylee777/docker-kaggle-ko
```



## .bashrc에 단축 커멘드 지정

`~/.bashrc`의 파일에 아래 커멘드를 추가하여 단축키로 Docker 실행

```bash
kjupyter{
    docker run --runtime nvidia --rm -itd -p 8888:8888 -v /data/jupyter_data:/home/jupyter --name kaggle-ko teddylee777/docker-kaggle-ko
}
```

터미널에 다음과 같이 입력하여 도커 실행

```bash
kjupyter
```


