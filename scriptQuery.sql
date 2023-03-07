select a.id_car, b.name as model, c.name as brand, d.name as business_group, a.purchase_date, a.license_plate, e.name as color, a.total_km, f.name as insurance_company, a.insurance_policy_number
from personalmaster.car a
inner join personalmaster.model b on a.id_model  = b.id_model
inner join personalmaster.brand c on b.id_brand  = c.id_brand
inner join personalmaster.business_group d on c.id_business_group  = d.id_business_group
inner join personalmaster.color e on a.id_color  = e.id_color
inner join personalmaster.insurance_company f on a.id_insurance_company  = f.id_insurance_company
