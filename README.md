# deepko

**deepko** (**DEEP** learning docker for **KO**rean) 는 <u>파이썬(Python) 기반의 데이터 분석 / 머신러닝 / 딥러닝 도커(docker)</u> 입니다.

- 파이썬 기반의 데이터 분석, 머신러닝, 딥러닝 프레임워크의 상호 의존성 충돌을 해결 후 배포합니다.

- **한글 폰트(나눔폰트, D2Coding), 한글 자연어 처리(konlpy, soynlp, mecab 등)** 를 위한 라이브러리가 사전에 설치되어 있습니다.

- **GPU** 를 지원합니다 (`LightGBM`, `XGBoost`, `PyTorch`, `TensorFlow`).

- 도커를 통한 **빠른 설치와 실행**이 가능합니다.
  

## 개요

TensorFlow 의 `tensorflow/tensorflow:2.x.x-gpu-jupyter` 의 도커를 베이스로 확장하여 GPU 전용 Docker파일(`gpu.Dockerfile`)을 구성하였습니다. 

TensorFlow에서 유지보수하고 있는 `tensorflow/tensorflow:2.x.x-gpu-jupyter` 도커의 경우 한글 형태소 분석기나 한글폰트, 그 밖에 PyTorch를 비롯한 여러 머신러닝/딥러닝 라이브러리가 제외되어 있기 때문에 필요한 라이브러리를 추가 설치하고 의존성에 문제가 없는지 확인한 후 배포하는 작업을 진행하고 있습니다.

본 Repository를 만들게 된 계기는 안정적으로 업데이트 되고 있는 `tensorflow/tensorflow-gpu-jupyter`에 기반하여 한글 폰트(나눔폰트, D2Coding), 한글 자연어처리 패키지(konlpy, soynlp), 형태소 분석기(mecab), Timezone 등의 설정을 추가하여 별도의 한글 관련 패키지와 설정을 해줘야 하는 번거로움을 줄이기 위함입니다.

- **GPU** 버전 도커 **Hub** 주소: [teddylee777/deepko](https://hub.docker.com/repository/docker/teddylee777/deepko)
- **GitHub** 주소: [github.com/teddylee777/deepko](https://github.com/teddylee777/deepko)



## 테스트된 도커 환경

- OS: Ubuntu 20.04
- GPU: RTX3090 x 2 way
- **CUDA: 11.8** (2023년 09월 23일 업데이트)
- Python (anaconda): 3.8

## CUDA 11.8 업데이트 방법

링크: https://teddylee777.github.io/linux/ubuntu2004-cuda-update/

## 업데이트 내역

업데이트 내역: https://github.com/teddylee777/deepko/wiki/%EB%B2%84%EC%A0%84-%EC%97%85%EB%8D%B0%EC%9D%B4%ED%8A%B8


## 한글 관련 추가 패키지

- apt 패키지 인스톨러 카카오 mirror 서버 추가
- Nanum(나눔) 폰트, D2Coding 폰트 설치
- matplotlib 에 나눔폰트, D2Coding 폰트 추가
- mecab 형태소 분석기 설치 및 파이썬 패키지 설치
- [konlpy](https://konlpy-ko.readthedocs.io/ko/v0.4.3/): 한국어 정보처리를 위한 파이썬 패키지
- soynlp: 한국어 자연어 처리를 위한 파이썬 패키지
- `jupyter_notebook_config.py` : Jupyter Notebook 설정 파일 추가



## 설치된 주요 라이브러리

```
albumentations                1.3.1
beautifulsoup4                4.12.2
catboost                      1.2.1.1
chromadb                      0.4.10
dask                          2023.7.1
datasets                      2.14.5
fastai                        2.7.12
folium                        0.14.0
gensim                        4.3.2
graphviz                      0.20.1
huggingface-hub               0.16.4
hyperopt                      0.2.7
jupyter                       1.0.0
jupyterlab                    4.0.6
kaggle                        1.5.16
keras                         2.13.1
konlpy                        0.6.0
langchain                     0.0.295
librosa                       0.10.1
lightgbm                      4.1.0
matplotlib                    3.8.0
mecab-python3                 1.0.7
missingno                     0.5.2
mlxtend                       0.22.0
nltk                          3.8.1
notebook                      7.0.3
numpy                         1.24.3
openai                        0.28.0
opencv-python                 4.8.0.76
optuna                        3.3.0
pandas                        1.5.3
peft                          0.6.0.dev0
pinecone-client               2.2.4
plotly                        5.17.0
prophet                       1.1.4
PyMySQL                       1.1.0
pypdf                         3.16.1
scikit-learn                  1.3.0
scipy                         1.11.2
seaborn                       0.12.2
sentencepiece                 0.1.99
shap                          0.42.
soynlp                        0.0.493
soyspacing                    1.0.17
spacy                         3.6.1
SQLAlchemy                    2.0.21
statsmodels                   0.14.0
tensorboard                   2.13.0
tensorboardX                  2.6.2.2
tensorflow                    2.13.0
tiktoken                      0.5.1
tokenizers                    0.14.0
torch                         2.0.0
torchaudio                    2.0.2+cu118
torchtext                     0.15.1
torchvision                   0.15.2
transformers                  4.34.0.dev0
wandb                         0.15.10
xgboost                       2.0.0
```


## GPU 지원 라이브러리

다음의 라이브러리에 대하여 **GPU를 지원**합니다.

1. `LightGBM` (4.1.0)
2. `XGBoost` (2.0.0)
3. `PyTorch` (2.0.0) + CUDA 11.8
4. `TensorFlow` (2.13.0) + CUDA 11.8



## 실행 방법

### STEP 1: Docker가 사전에 설치되어 있어야 합니다.

도커의 설치 및 사용법에 대하여 궁금하신 분들은 [Docker를 활용하여 딥러닝/머신러닝 환경 구성하기](https://teddylee777.github.io/linux/docker%EB%A5%BC-%ED%99%9C%EC%9A%A9%ED%95%98%EC%97%AC-%EB%94%A5%EB%9F%AC%EB%8B%9D-%ED%99%98%EA%B2%BD%EA%B5%AC%EC%84%B1.md) 글을 참고해 주세요.

```bash
# step 1: apt-get 업데이트
sudo apt-get update

# step 2: 이전 버젼 제거
sudo apt-get remove docker docker-engine docker.io

# step 3: 도커(Docker) 설치 
sudo apt install docker.io

# step 4: 도커 서비스 시작
sudo systemctl start docker
sudo systemctl enable docker

# step 5: 잘 설치 되어있는지 버젼 체크
docker --version
```



### STEP 2: 도커 이미지 pull 하여 서버 실행

상황에 따라 다음 4가지 중 하나의 명령어를 실행하여 도커를 실행합니다. 세부 옵션은 아래를 참고해 주세요.

- `--rm`: 도커가 종료될 때 컨테이너 삭제

- `-it`: 인터랙티브 TTY 모드 (디폴트로 설정)

- `-d`: 도커를 백그라운드로 실행

- `-p`: 포트 설정. **local 포트:도커 포트**

- `-v`: local 볼륨 마운트. **local 볼륨:도커 볼륨**

- `--name`: 도커의 별칭(name) 설정

  

1. `Jupyter Notebook` 을 **8888번 포트로 실행**하려는 경우

```bash
docker run --runtime nvidia --rm -it -p 8888:8888 teddylee777/deepko:latest
```



2. `jupyter notebook` 서버 실행과 동시에 **로컬 volume 마운트**

```bash
docker run --runtime nvidia --rm -it -p 8888:8888 -v /data/jupyter_data:/home/jupyter teddylee777/deepko:latest
```



3. 도커를 **background에서 실행**하는 경우 (터미널을 종료해도 서버 유지)

```bash
docker run --runtime nvidia --rm -itd -p 8888:8888 teddylee777/deepko:latest
```



4. 도커를 실행 후 **bash shell로 진입**하려는 경우

```bash
docker run --runtime nvidia --rm -it -p 8888:8888 teddylee777/deepko:latest /bin/bash
```



**[참고]**

`jupyter_notebook_config.py` 을 기본 값으로 사용하셔도 좋지만, 보안을 위해서 **비밀번호 설정**은 해주시는 것이 좋습니다.

**비밀번호 설정** 방법, **방화벽 설정** 방법은 [Docker를 활용하여 딥러닝/머신러닝 환경 구성하기](https://teddylee777.github.io/linux/docker%EB%A5%BC-%ED%99%9C%EC%9A%A9%ED%95%98%EC%97%AC-%EB%94%A5%EB%9F%AC%EB%8B%9D-%ED%99%98%EA%B2%BD%EA%B5%AC%EC%84%B1.md) 글의 STEP 5, 7을 참고해 주세요.



## [선택] .bashrc에 단축 커멘드 지정

`~/.bashrc`의 파일에 아래 커멘드를 추가하여 단축키로 Docker 실행


```bash
kjupyter{
    docker run --runtime nvidia --rm -itd -p 8888:8888 -v /data/jupyter_data:/home/jupyter --name dl-ko teddylee777/deepko:preview
}
```

 위와 같이 `~/.bashrc` 파일을 수정 후 저장한 뒤 `source ~/.bashrc`로 파일의 내요을 업데이트 합니다.

추후, 긴 줄의 명령어를 입력할 필요 없이 단순하게 아래의 명령어로 도커를 백그라운드에서 실행 할 수 있습니다.

```bash
kjupyter
```





---



**추가 파이썬 패키지 설치 제안은 issue 에 남겨주세요!**

감사합니다.
