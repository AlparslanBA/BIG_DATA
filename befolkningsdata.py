import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("befkbhalderstatkode.csv")

'''
Variabler:
AAR
BYDEL
ALDER
STATKODE
PERSONER
'''

row_count = data.shape[0]

col_count = data.shape[1]

#http://queirozf.com/entries/pandas-dataframe-plot-examples-with-matplotlib-pyplot

# gca stands for 'get current axis'
#ax = plt.gca()

'''data.plot(kind='bar', x='STATKODE', y='PERSONER')
plt.show()'''

ikkeDansk = data.STATKODE != 5100 #fjerner danske statsborger fra listen
ikkeDansk.head()

ikkedanskdata = data[ikkeDansk]

count = 0

'''for length in data.STATKODE:
    if data.STATKODE == 5100:
        count + 1
   '''     
print(count)

print(len(data))
print(len(ikkeDansk))

'''data[ikkeDansk].plot(kind='scatter',x='STATKODE',y='PERSONER',ax = ax)
data.plot(kind ='scatter',x='STATKODE',y='PERSONER',color = 'red',ax = ax)


#data.plot(kind='line',x = 'AAR', y='PERSONER',ax = ax)
#data.plot(kind='scatter',x ='AAR',y='PERSONER',color = 'red')
#plt.show()


#data.plot(kind='scatter', x='STATKODE',y='PERSONER')
plt.show()
'''


