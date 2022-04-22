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

def factory_enable_partner():
    partner = {
        'name':"Jujuba Não Tem Antena",
	    'email': "contato@jujuba.com.br",
	    'whatsapp': "1199991004",
	    'business': "Conveniência"
        }
    return partner

def factory_404_partner():
    partner = {
        'name':"Joao dos Venenos",
	    'email': "contato@venenos.com.br",
	    'whatsapp': "11999991007",
	    'business': "Conveniência"
        }
    return partner

def factory_disable_partner():
    partner = {
        'name':"Super24hrs",
	    'email': "contato@Super24hrs.com.br",
	    'whatsapp': "1199991008",
	    'business': "Supermercado"
        }
    return partner

def factory_remove_partner():
    partner = {
        'name':"Bar do Tiao",
	    'email': "contato@bardotiao.com.br",
	    'whatsapp': "1199991009",
	    'business': "Conveniência"
        }
    return partner
    