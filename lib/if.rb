bury_page = "www.darenhui.com&fe=faew"
have_erp_str = bury_page.include?('?')?'&haveERP=1':'?haveERP=1'
bury_page += have_erp_str
p bury_page