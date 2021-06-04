# local 빌드시
FROM kaggle/python-gpu-build:latest
# GCP 이미지 다운로드시
# FROM gcr.io/kaggle-gpu-images/python:latest

# 카카오 ubuntu archive mirror server 추가. 다운로드 속도 향상
RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list && \
    apt-get update

# 나눔고딕 폰트 설치, D2Coding 폰트 설치
# matplotlib에 Nanum 폰트 추가
RUN apt-get install fonts-nanum* && \
    mkdir ~/.local/share/fonts && \
    cd ~/.local/share/fonts && \
    wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip && \
    unzip D2Coding-Ver1.3.2-20180524.zip && \
    cp /usr/share/fonts/truetype/nanum/Nanum* /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/fonts/ttf/ && \
    fc-cache -fv && \
    rm -rf D2Coding* && \
    rm -rf ~/.cache/matplotlib/*

# konlpy, py-hanspell, soynlp 패키지 설치 
RUN pip install konlpy && \
    pip install git+https://github.com/ssut/py-hanspell.git && \
    pip install soynlp

# 형태소 분석기 mecab 설치
RUN cd /tmp && \
    wget "https://www.dropbox.com/s/9xls0tgtf3edgns/mecab-0.996-ko-0.9.2.tar.gz?dl=1" && \
    tar zxfv mecab-0.996-ko-0.9.2.tar.gz?dl=1 && \
    cd mecab-0.996-ko-0.9.2 && \
    ./configure && \
    make && \
    make check && \
    make install && \
    ldconfig

RUN cd /tmp && \
    wget "https://www.dropbox.com/s/i8girnk5p80076c/mecab-ko-dic-2.1.1-20180720.tar.gz?dl=1" && \
    apt install -y autoconf && \
    tar zxfv mecab-ko-dic-2.1.1-20180720.tar.gz?dl=1 && \
    cd mecab-ko-dic-2.1.1-20180720 && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig

# 형태소 분석기 mecab 파이썬 패키지 설치
RUN cd /tmp && \
    git clone https://bitbucket.org/eunjeon/mecab-python-0.996.git && \
    cd mecab-python-0.996 && \

# locale 설정
RUN apt-get update && apt-get install -y vim locales tzdata && \
    locale-gen ko_KR.UTF-8 && locale -a && \
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# LANG 환경변수 설정
ENV LANG ko_KR.UTF-8

# Jupyter Notebook config 파일 생성
RUN jupyter notebook --generate-config

# config 파일 복사 (jupyter_notebook_config.py 파일 참고)
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# 기본
EXPOSE 8888
# jupyter notebook 의 password를 지정하지 않으면 보안상 취약하므로 지정하는 것을 권장
CMD jupyter notebook --allow-root

