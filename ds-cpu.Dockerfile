# 원격 빌드시
FROM jupyter/datascience-notebook:latest

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
    mkdir /usr/share/fonts/truetype/D2Coding && \
    cp ./D2Coding/*.ttf /usr/share/fonts/truetype/D2Coding/ && \
    cp /usr/share/fonts/truetype/nanum/Nanum* /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/fonts/ttf/ && \
    fc-cache -fv && \
    rm -rf D2Coding* && \
    rm -rf ~/.cache/matplotlib/*

# 업데이트
RUN apt-get update

# 패키지 설치
RUN pip install setuptools && \
    pip install mkl && \
    pip install pymysql && \
    pip install numpy && \
    pip install scipy && \
    pip install missingno && \
    pip install kaggle && \
    pip install folium && \
    pip install librosa && \
    pip install nbconvert && \
    pip install Pillow && \
    pip install tqdm

RUN pip install scikit-learn && \
    pip install lightgbm && \
    pip install xgboost && \
    pip install hyperopt && \
    pip install optuna && \
    pip install mlxtend

RUN pip install openai && \
    pip install langchain && \
    pip install pandasai

RUN pip install streamlit && \
    pip install gradio

RUN pip install pycaret[full]

# LANG 환경변수 설정
ENV LANG ko_KR.UTF-8

# Jupyter Notebook config 파일 생성
RUN jupyter notebook --generate-config

# config 파일 복사 (jupyter_notebook_config.py 파일 참고)
COPY jupyter_notebook_config.py /home/joyvan/.jupyter/jupyter_notebook_config.py

# 설치 완료 후 테스트용 ipynb
COPY test.ipynb /home/joyvan/test.ipynb

# 기본
EXPOSE 8888

# jupyter notebook 의 password를 지정하지 않으면 보안상 취약하므로 지정하는 것을 권장
CMD jupyter notebook --allow-root

