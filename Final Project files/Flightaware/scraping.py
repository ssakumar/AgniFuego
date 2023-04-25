import os
import schedule
import time
import pandas as pd
import numpy as np
from bs4 import BeautifulSoup as soup
import mechanize
from tqdm import tqdm
import boto3
import warnings
import datetime
from http.cookiejar import CookieJar

#def job():
warnings.filterwarnings("ignore")

# Set environment variables
os.environ['NUMEXPR_MAX_THREADS'] = '1'
os.environ['NUMEXPR_NUM_THREADS'] = '1'

# Set up S3 client
s3_client = boto3.client("s3")
bucket_name = "realagnifuegos3bucket"

# Get current timestamp
now = datetime.datetime.now()
#output_filename = f'flighthistory_{now.month}{now.day}{now.year}_{now.hour}{now.minute}{now.second}.csv'
#not_scraped_filename = f"notscraped_{now.month}{now.day}{now.year}_{now.hour}{now.minute}{now.second}.txt"
#not_scraped_filename = f'notscraped_{now.month:02d}{now.day:02d}{now.year}_{now.hour:02d}{now.minute:02d}{now.second:02d}.txt'
#not_scraped_filename = f"notscraped_{now.month}{now.day}{now.year}_{now.hour:02d}{now.minute:02d}{now.second:02d}.txt"
not_scraped_filename = "notscraped_" + str(now.month) + str(now.day) + str(now.year) + "_" + str(now.hour) + str(now.minute) + str(now.second) + ".txt"

#flight history scraping function
def getFlightData(br, tail):
    #print(f"Scraping data for tail {tail}")
    try:
        #url = f'https://flightaware.com/live/flight/{tail}/history/1280'
        url = 'https://flightaware.com/live/flight/{}/history/1280'.format(tail)
        page_html = br.open(url).read()
        page_soup = soup(page_html, 'html.parser')
        table = page_soup.findAll("table", {"class":["prettyTable fullWidth tablesaw tablesaw-stack"]})
        #table = page_soup.findAll("tr", {"class":["smallActiverow1 rowClickTarget", "smallActiverow2 rowClickTarget"]})
        df = pd.read_html(table[0].prettify())[0]
        df['Tail'] = tail
        return df
    except:
        print('1')
        return None

  

# Set up browser
username = "tanishqravi2923"
password = "R_tanishq28"
    
br = mechanize.Browser()
cj = mechanize.CookieJar()
#cj = CookieJar()
br.set_cookiejar(cj)
br.set_cookiejar(cj)
br.set_handle_equiv(True)
br.set_handle_gzip(True)
br.set_handle_redirect(True)
br.set_handle_referer(True)
br.set_handle_robots(False)
br.set_handle_refresh(mechanize._http.HTTPRefreshProcessor(), max_time=1)
br.addheaders = [('User-agent', 'Chrome')]
br.open('https://flightaware.com/account/session')
br.select_form(nr=7)
br.form["flightaware_username"] = username
br.form['flightaware_password'] = password
br.submit()


  

# Get Tails-to-use.txt from S3 bucket
tails_to_use = s3_client.get_object(Bucket=bucket_name, Key="Flightaware-scraping/Tails-to-use.txt")
tailList = tails_to_use['Body'].read().decode('utf-8').split()
# Scrape flight data for each tail number
notscraped = []
cdf = []
for tail in tqdm(tailList):
    df1 = getFlightData(br, tail)
    if df1 is not None:
        cdf.append(df1)
    else:
        notscraped.append(tail)

# Combine flight data with masterfile.csv and remove duplicates
master_file = s3_client.get_object(Bucket=bucket_name, Key="Flightaware-scraping/masterfile.csv")
masterdf = pd.read_csv(master_file['Body'])
#cdft = pd.concat(cdf, axis=0)
#cdft = pd.concat([masterdf,cdf], axis=0).drop_duplicates()

cdft = masterdf
for df in cdf:
    cdft = pd.concat([cdft, df])
cdft = cdft.drop_duplicates()
#cdft1 = "\n".join(cdft).encode('utf-8')
#s3_client.put_object(Body=cdft1, Bucket=bucket_name, Key="masterfile.csv")
# Save flight data and notscraped tails to S3 bucket
csv_buffer = pd.DataFrame.to_csv(cdft, index=False)
s3_client.put_object(Body=csv_buffer, Bucket=bucket_name, Key="Flightaware-scraping/outputs/masterfile.csv")


if len(notscraped)>0:
    not_scraped_csv_buffer ="\n".join(notscraped).encode('utf-8')
    #s3_client.put_object(Body=not_scraped_csv_buffer, Bucket=bucket_name, Key=f"Data sets/flightaware-outputs/{not_scraped_filename}")
    s3_client.put_object(Body=not_scraped_csv_buffer, Bucket=bucket_name, Key="Flightaware-scraping/outputs/{}".format(not_scraped_filename))

#schedule.every().day.at("02:00").do(job)
#while True:
#        schedule.run_pending()
#        time.sleep(1)






