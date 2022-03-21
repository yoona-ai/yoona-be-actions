FROM jfloff/alpine-python

LABEL "com.github.actions.name"="yoona-be"
LABEL "com.github.actions.description"="run all CI/CD commands for code quality"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="6f42c1"

RUN pip install --upgrade pip
RUN pip install pycodestyle
RUN pip install pyflakes
RUN pip install pylint

COPY . .

CMD pycodestyle --max-line-length=160 /github/workspace/
CMD pyflakes checkRecursive /github/workspace/
CMD pylint --max-line-length=170 --disable=C0103,C0114,C0115,C0116,C0301,R0913,W0613,R0902,W0511 --fail-under=9.0 `find /github/workspace/ -name "*.py"`