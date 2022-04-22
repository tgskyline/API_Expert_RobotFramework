def factory_new_partner():
    partner = {
        'name':"Pizzas Papito",
	    'email': "contato@papito.com.br",
	    'whatsapp': "11999999999",
	    'business': "Restaurante"
    }
    return partner

def factory_dup_name():
    partner ={
        'name':"Tiago Lanchonete",
	    'email': "contato@Lanchonete.com.br",
	    'whatsapp': "31999999999",
	    'business': "Conveniência"
        }
    return partner

def factory_partner_list():
    p_list = [
        {
        'name':"Tabata Mercearia",
	    'email': "contato@TMercearia.com.br",
	    'whatsapp': "31988881001",
	    'business': "Conveniência"
        },
        {
        'name':"Braian Action Figure",
	    'email': "contato@BraianAF.com.br",
	    'whatsapp': "3199991002",
	    'business': "Supermercado"
        },
        {
        'name':"Maria das Graças Rest",
	    'email': "contato@MGRest.com.br",
	    'whatsapp': "31999991003",
	    'business': "Restaurante"
        }
    ]

    return p_list
    