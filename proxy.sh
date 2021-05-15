
export http_proxy='https://65.0.63.239:8888/'
URL='www.cowin.gov.in'

wget -q --proxy-user=test --proxy-password=test --spider $URL
if [ $? = 1 ]
then
    STATUS= echo "Proxy isn't working"

else
  STATUS="Proxy is working."
fi
echo $STATUS
