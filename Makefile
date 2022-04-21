
lint: 
	@echo *********************************************** RODANDO ROBOTIDY ***********************************************
	robotidy '$(src)'
	@echo *********************************************** RODANDO TRANSFORM ***********************************************
	robotidy --transform AlignTestCases '$(src)'
	robotidy --configure AlignSettingsSection:up_to_column=10 '$(src)'
	robotidy --configure AlignSettingsSection:argument_indent=0 '$(src)'
	robotidy --transform OrderTags '$(src)'
	robotidy --spacecount 8 '$(src)'
	@echo *********************************************** RODANDO TESTE ***********************************************
	robot -d './TestsAPI/Logs/' '$(src)'	
	@echo *********************************************** RELATORIO FINAL DO ROBOCOP ***********************************************
	robocop '$(src)' --reports all
	
	

