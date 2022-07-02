install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv test_application.py

lint:
	pylint --disable=R,C application.py

deploy:
	echo "Deploying app"
	eb list &&\
		eb use sherlock-env &&\
		eb status --verbose &&\
		eb deploy

all: install lint test
