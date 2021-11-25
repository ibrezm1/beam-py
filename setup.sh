
gcloud auth list # tells you the active user
gcloud config get-value project # tells you the active project 

gcloud config configurations list # All configurations

gcloud config configurations create [NAME] # Create config
gcloud config set project [PROJECT-ID]
gcloud auth login   # will ask you for the token to login use --no-launch-browser if remote
gcloud auth application-default login # will cause your credentials to be saved 

python3 -m venv tvenv
source tvenv/bin/activate
pip install wheel
pip install 'apache-beam[gcp]'
pip install pyparsing==2.4.2 # force install updated to remove downcaseTokens errors
                            # AttributeError: module 'pyparsing' has no attribute 'downcaseTokens'



gcloud iam service-accounts create testSvcAcct1 --display-name "test svc account" --project=<projectId>


python testlocalrunner.py --input-file setup.sh  --output-path .


python testlocalrunner.py \
    --input-file setup.sh  \
    --output-path .


python testlocalrunner.py \
--input-file gs://zeta-yen-319702-tmp/access_log_20180324-124435.log \
--output-path gs://zeta-yen-319702-tmp/ \
--runner DataflowRunner \
--project zeta-yen-319702 \
--temp_location gs://zeta-yen-319702-tmp/ \
--region us-central1 



python3 -m \
    apache_beam.examples.wordcount \
    --region us-central1 --input \
    gs://dataflow-samples/shakespeare/kinglear.txt \
    --output \
    gs://zeta-yen-319702-tmp/results/output \
    --runner DataflowRunner \
    --project zeta-yen-319702 \
    --temp_location \
    gs://zeta-yen-319702-tmp/temp/





http://opreview.blogspot.com/2018/07/running-apache-beam-pipeline-using.html
