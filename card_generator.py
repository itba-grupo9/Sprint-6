from ast import pattern
import random
# Es necesario hacer "pip install faker" en la consola
from faker import Faker
import datetime
from dateutil.relativedelta import relativedelta
fake=Faker()
card_type=['Debito', 'Credito']
brand_card_id=['1','2','3']
customer_id=1

# esto sirve para crear tarjetas aleatorias
print('INSERT INTO tarjeta (card_given_date, card_expire_date, card_number, card_type, brand_card_id, customer_id, card_cvv) VALUES')
for x in range(0,500):
    digit1 = str(random.randint(0,9))
    digit2 = str(random.randint(0,9))
    digit3 = str(random.randint(0,9))
    cvv = digit1 + digit2 + digit3  
    card_number=fake.credit_card_number()
    time1=fake.date_time()
    time2=time1 + relativedelta(years=5)
    print(f''' ({'"'+time1.strftime("%m/%y")+'"'},{'"'+time2.strftime("%m/%y")+'"'},{card_number},{'"'+random.choice(card_type)+'"'}, {random.choice(brand_card_id)}, {customer_id}, {cvv}),''')

    customer_id+=1

    
# Copiar y pegar el resultado en sqlite, sacar la ultima ','