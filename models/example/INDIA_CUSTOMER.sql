Select * FROM {{ref ('customer')}}  C1
Inner join {{ref('country')}}  C2
ON C1.C_NATIONKEY =C2.NationId
where C2.Nationname ='INDIA'