# DataScience Notebook 도커(한글 패키지 지원)

`teddylee777/datascience-notebook` 는 *파이썬(Python) 기반의 데이터 분석, 머신러닝 도커(docker) 이미지* 입니다.

- 도커 이미지 주소: https://hub.docker.com/r/teddylee777/datascience-notebook

🔥 빠른 실행

```bash
docker run --rm -itd --name notebook -p 8888:8888 -v 마운트할로컬드라이브경로:/home/jovyan/work teddylee777/datascience-notebook:latest
```

## 📍 개요

- 파이썬 기반의 데이터 분석, 머신러닝 프레임워크의 상호 의존성 충돌을 해결 후 배포합니다.

- **한글 폰트(나눔폰트, D2Coding), 한글 자연어 처리(konlpy, mecab 등)** 를 위한 라이브러리가 사전에 설치되어 있습니다.

- 도커만 설치되어 있다면 별도의 설치 없이 **빠른 설치와 실행**이 가능합니다.

- 지원 OS: 윈도우(Windows), 맥(macOS), 리눅스(linux)


## 📍 주요 환경

- OS: Ubuntu 20.04
- Python(anaconda): 3.10

### 🌱 한글 관련 추가 패키지

- apt 패키지 인스톨러 카카오 mirror 서버 추가
- Nanum(나눔) 폰트, D2Coding 폰트 설치
- matplotlib 에 나눔폰트, D2Coding 폰트 추가
- mecab 형태소 분석기 설치 및 파이썬 패키지 설치
- [konlpy](https://konlpy-ko.readthedocs.io/ko/v0.4.3/): 한국어 정보처리를 위한 파이썬 패키지
- `jupyter_notebook_config.py` : Jupyter Notebook 설정 파일 추가

### 🌱 설치된 주요 라이브러리

```
beautifulsoup4                4.12.2
catboost                      1.2.2
chromadb                      0.4.12
dash                          2.13.0
dask                          2023.5.1
duckdb                        0.8.1
duckduckgo-search             3.8.5
faiss-cpu                     1.7.4
folium                        0.14.0
google-search-results         2.4.2
gradio                        3.44.4
graphviz                      0.20.1
huggingface-hub               0.17.2
hyperopt                      0.2.7
jupyter                       1.0.0
jupyterlab                    4.0.0
kaggle                        1.5.16
konlpy                        0.6.0
lancedb                       0.2.2
langchain                     0.0.299
langsmith                     0.0.40
librosa                       0.10.1
lightgbm                      4.1.0
matplotlib                    3.7.1
mecab-python3                 1.0.8
missingno                     0.5.2
mlflow                        1.30.1
mlxtend                       0.22.0
networkx                      3.1
nltk                          3.8.1
notebook                      6.5.4
numpy                         1.23.5
openai                        0.27.10
opendata-kr                   0.0.8
openpyxl                      3.1.2
optuna                        3.3.0
pandas                        1.5.3
pandasai                      1.2.6
plotly                        5.17.0
prophet                       1.1.4
pycaret                       3.1.0
pycodegrade                   0.0.9
PyMySQL                       1.1.0
pypdf                         3.16.1
PyPika                        0.48.9
scikit-learn                  1.2.2
scipy                         1.10.1
seaborn                       0.12.2
selenium                      4.2.0
shap                          0.42.1
SQLAlchemy                    1.4.49
statsmodels                   0.14.0
streamlit                     1.27.0
tiktoken                      0.5.1
tokenizers                    0.13.3
transformers                  4.33.2
webdriver-manager             4.0.0
wordcloud                     1.9.2
xgboost                       2.0.0
```

## 🔥 실행 방법

### ① Docker 설치 (이미 설치되어 있는 경우 SKIP)

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

### ② 도커 이미지 pull 하여 서버 실행

상황에 따라 다음 4가지 중 하나의 명령어를 실행하여 도커를 실행합니다. 세부 옵션은 아래를 참고해 주세요.

- `--rm`: 도커가 종료될 때 컨테이너 삭제
- `-it`: 인터랙티브 TTY 모드 (디폴트로 설정)
- `-d`: 도커를 백그라운드로 실행
- `-p`: 포트 설정. **local 포트:도커 포트**
- `-v`: local 볼륨 마운트. **local 볼륨:도커 볼륨**
- `--name`: 도커의 별칭(name) 설정



> 실행 예시

```bash
docker run --rm -itd --name notebook -p 8888:8888 -v 마운트할로컬드라이브경로:/home/jovyan/work teddylee777/datascience-notebook:latest
```

**(참고하면 도움이 되는 글 - 단축 Docker 명령어 지정)**

- [macOS의 iTerm/Mac 기본 터미널에서 Docker 명령어를 Alias로 지정하기](https://teddylee777.github.io/data-science/docker-command-alias/)





