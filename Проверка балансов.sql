select q1.client_id, current_amt, trans_bal from (select sum(trans_amt) as trans_bal, cl.client_id from transactions as t
join cards as c on c.card_number = t.card_number
join clients as cl on cl.client_id = c.client_id
group by cl.client_id) as q1
join
(SELECT current_amt, b.client_id
from balances b
 join clients as cl on cl.client_id = b.client_id
 join status_desc as sd on sd.status = cl.status
where actual_flg > 0 and
sd.description = 'Client is active') as q2 
on q1.client_id = q2.client_id