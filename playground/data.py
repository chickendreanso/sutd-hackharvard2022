import json 
import csv 
import pandas as pd
import seaborn as sns
import numpy as np


def filter_data(p ):
    print(p)
    with open('result.json', encoding='utf-8') as f:
        data = json.load(f)


    # get all the chat objects
    chats = data['chats']['list']

    #chats[0] = saved messages
    # select the first chat object
    saved_message = chats[1]

    # sort the charts by number of messages
    for i in range(len(chats)):
        chats[i]['length'] = len(chats[i]['messages'])

    chats.sort(key=lambda x: x['length'], reverse=True)


    #get names and number of mesages of top_ten_chat 
    top_ten_chat = chats[:10]
    top_ten_chat_names = [(chat['name'],chat['length'])for chat in top_ten_chat]
    # print(top_ten_chat_names)

    # find the earliest and latest date in chat i
    i = 0
    start_date = chats[i]['messages'][0]['date']
    last_date = chats[i]['messages'][-1]['date']
    #result:2020-09-11T16:18:43 2022-10-01T22:48:45


    # date -> number of messages
    # person -> date -> number of messages
    date_numChat = {}
    person_date_numChat= {}
    # for each person in top_ten_chat, for every date, get the number of messages
    for person in top_ten_chat:
        person_name = person['name']
        person_date_numChat[person_name] = {}
        for message in person['messages']:
            date = message['date'][:10]
            if date not in date_numChat:
                date_numChat[date] = 1
            else:
                date_numChat[date] += 1
            if date not in person_date_numChat[person_name]:
                person_date_numChat[person_name][date] = 1
            else:
                person_date_numChat[person_name][date] += 1
                
    # x = date, y = number of messages
    
    x = list(list(person_date_numChat.values())[p].keys())
    y = list(list(person_date_numChat.values())[p].values())

    # df = pd.DataFrame({'x': x, 'y': y})
    # ax = sns.barplot(data=df, x=x, y=y)
    # ax.set(xlabel='Date', ylabel='Number of Messages')
    # ax.set_title('Number of Messages per Day with ' + list(person_date_numChat.keys())[p])
    most_message_day_num = np.argmax(y)
    # print(most_message_day)
    print(most_message_day_num)
    most_message_day = x[most_message_day_num]
    messages = []
    for message in top_ten_chat[p]['messages']:
        if message['date'][:10] == most_message_day:
            # print(message['text'])
        
            #if message['text'] not bit type list:
            if type(message['text']) != list:
                messages.append(message['from'] + ' : ' + message['text'])


    output = {'person':list(person_date_numChat.keys())[p],'x': x, 'y': y, 'dialogue':messages, 'summary':}
  
    return output

