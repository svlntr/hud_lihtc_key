	import delimited "R:\ECON\DSheehanConnor\svalentiner\DATA\HUD - LIHTC by Property\LIHTCPUB\LIHTCPUB.CSV", clear

// LABELS
	label var hud_id "Project Identifier for the Database"
	label var project "Project name"
	label var proj_add "Project street address"
	label var proj_cty "Project city"
	label var proj_st "Project state"
	label var proj_zip "Project zip"
	label var state_id "State-defined Project ID"
	label var latitude "Latitude: Degrees Decimal"
	label var longitude "Longitude: Negative Degrees Decimal: GIS Mapping Convention"
	label var place1990 "Census Place Code (1990)"
	label var place2000 "FIPS Place Code (2000)"
	label var place2010 "FIPS Place Code (2010)"
	label var place2020 "FIPS Place Code (2020)"
	label var fips1990 "1990 Census Tract ID"
	label var fips2000 "2000 Census Tract ID"
	label var fips2010 "2010 Census Tract"
	label var fips2020 "2020 Census Tract"
	label var scattered_site_cd "Scattered Site Property"
		recode scattered_site_cd 2=0
		label define SCATTERED 0 "No" 1 "Yes", modify
		label values scattered_site_cd SCATTERED
	label var resyndication_cd "Resyndicated Property"
		recode resyndication_cd 2=0
		label define RESYNDICATION 0 "No" 1 "Yes", modify
		label values resyndication_cd RESYNDICATION
	label var allocamt "Annual dollar amount of tax credits allocated"
	label var n_units "Total number of units as reported by HFA"
	label var li_units "Total number of low income units as reported by HFA"
	label var n_0br "Number of efficiencies"
	label var n_1br "Number of 1-bedroom units"
	label var n_2br "Number of 2-bedroom units"
	label var n_3br "Number of 3-bedroom units"
	label var n_4br "Number of 4-bedroom units"
	label var inc_ceil "Elected rent/income ceiling for low income units"
		label define INC_CEIL 1 "50% AMGI" 2 "60% AMGI" 3 "Income Average" 9 "Not Reported", modify
		label values inc_ceil INC_CEIL
	label var low_ceil "Units set aside with rents lower than elected rent/income ceiling"
		recode low_ceil 2=0
		label define LOW_CEIL 0 "No" 1 "Yes", modify
		label values low_ceil LOW_CEIL
	label var ceilunit "Number of units set aside with rents lower than elected rent/income ceiling"
	label var yr_pis "Year placed in service"
		recode yr_pis 9999 8888 =. ////////////////////////////////////
		// label define YR_PIS 8888 "status not confirmed" 9999 "year missing", modify
		// label values yr_pis YR_PIS
	label var yr_alloc "Allocation year"
		recode yr_alloc 9999 8888 =. 
		//************************* Count how many obervations this essentially eliminates
		// label define yr_alloc 8888 "status not confirmed" 9999 "year missing", modify
		label values yr_alloc YR_ALLOC
	label var non_prof "Non-profit sponsor"
		recode non_prof 2=0
		label define NON_PROF 0 "No" 1 "Yes", modify
		label values non_prof NON_PROF
	label var basis "Increase in eligible basis"
		recode basis 2=0
		label define BASIS 0 "No" 1 "Yes", modify
		label values basis BASIS
	label var bond "Tax-exempt bond received"
		recode bond 2=0
		label define BOND 0 "No" 1 "Yes", modify
		label values bond BOND
	label var mff_ra "HUD Multi-Family financing/rental assistance"
		recode mff_ra 2=0
		label define MFF_RA 0 "No" 1 "Yes", modify
		label values mff_ra MFF_RA
	label var fmha_514 "FmHA (RHS) Section 514 loan"
		recode fmha_514 2=0
		label define FMHA_514 0 "No" 1 "Yes", modify
		label values fmha_514 FMHA_514
	label var fmha_515 "FmHA (RHS) Section 515 loan"
		recode fmha_515 2=0
		label define FMHA_515 0 "No" 1 "Yes", modify
		label values fmha_515 FMHA_515
	label var fmha_538 "FmHA (RHS) Section 538 loan"
		recode fmha_538 2=0
		label define FMHA_538 0 "No" 1 "Yes", modify
		label values fmha_538 FMHA_538
	label var home "HOME Investment Partnership Program funds"
		recode home 2=0
		label define HOME 0 "No" 1 "Yes", modify
		label values home HOME
	label var home_amt "Dollar amount of HOME funds"
	label var tcap "Tax Credit Assistance Program (TCAP) funds"
		recode tcap 2=0
		label define TCAP 0 "No" 1 "Yes", modify
		label values tcap TCAP
	label var tcap_amt "TCAP Amount"
	label var cdbg "Community Development Block Grant (CDBG) funds"
		recode cdbg 2=0
		label define CDBG 0 "No" 1 "Yes", modify
		label values cdbg CDBG
	label var cdbg_amt "Dollar amount of CDBG funds"
	label var htf "Housing Trust Fund funds"
		recode htf 2=0
		label define HTF 0 "No" 1 "Yes", modify
		label values htf HTF
	label var htf_amt "Dollar amount of Housing Trust Fund funds"
	label var fha "FHA-insured loan / FHA Loan Numbers"
		recode fha 2=0
		label define FHA 0 "No" 1 "Yes", modify
		label values fha FHA
	label var hopevi "Forms part of a HOPEVI development"
		recode hopevi 2=0
		label define HOPEVI 0 "No" 1 "Yes", modify
		label values hopevi HOPEVI
	label var hpvi_amt "Dollar amount of HOPEVI funds for development or building costs"
	label var tcep "Tax Credit Exchange Program (TCEP) funds"
		recode tcep 2=0
		label define TCEP 0 "No" 1 "Yes", modify
		label values tcep TCEP
	label var tcep_amt "Dollar amount of TCEP funds"
	label var rad "Housing Trust Fund funds"
		recode rad 2=0
		label define RAD 0 "No" 1 "Yes", modify
		label values rad RAD
	label var qozf "Qualified Opportunity Zone Fund funds"
		recode qozf 2=0
		label define QOZF 0 "No" 1 "Yes", modify
		label values qozf QOZF
	label var qozf_amt "Dollar amount of Qualified Opportunity Zone Fund funds"
	label var rentassist "Federal or state project-based rental assistance contract (HUD Property ID)"
		recode rentassist 4=0 5=.
		label define RENTASSIST 0 "Neither" 1 "Federal" 2 "State" 3 "Both", modify
		label values rentassist RENTASSIST
	label var trgt_pop "Targets a specific population with specialized services or facilities"
		recode trgt_pop 2=0
		label define TRGT_POP 0 "No" 1 "Yes", modify
		label values trgt_pop TRGT_POP
	label var trgt_fam "Targets a specific population – families"
		recode trgt_fam 0=. 2=0
		label define TRGT_FAM 0 "No" 1 "Yes", modify
		label values trgt_fam TRGT_FAM
	label var trgt_eld "Targets a specific population – elderly"
		recode trgt_eld 0=. 2=0
		label define TRGT_ELD 0 "No" 1 "Yes", modify
		label values trgt_eld TRGT_ELD
	label var trgt_dis "Targets a specific population – disabled"
		recode trgt_dis 0=. 2=0
		label define TRGT_DIS 0 "No" 1 "Yes", modify
		label values trgt_dis TRGT_DIS
	label var trgt_hml "Targets a specific population – homeless"
		recode trgt_hml 0=. 2=0
		label define TRGT_HML 0 "No" 1 "Yes", modify
		label values trgt_hml TRGT_HML
	label var trgt_other "Targets a specific population – other"
		recode trgt_other 0=. 2=0
		label define TRGT_OTHER 0 "No" 1 "Yes", modify
		label values trgt_other TRGT_OTHER
	label var trgt_spc "Targets a specific population – other as specified"
	label var type "Type of construction"
		recode type 4=0
		label define TYPE 0 "Existing" 1 "New construction" 2 "Acquisition and Rehab" 3 "Both new and a&r", modify
		label values type TYPE
	label var credit "Type of credit percentage"
		recode credit 4=0
		label define CREDIT 0 "TCEP only" 1 "30% present value" 2 "70% present value" 3 "Both", modify
		label values credit CREDIT
	label var n_unitsr "Total number of units or if total units missing or inconsistent, total low-income units"
	label var li_unitr "Total number of low-income units or if total low-income units missing, total units"
	label var metro "Is the census tract metro or non-metro at the time the property was placed into serivce?"
		recode metro 3=0
		label define METRO 0 "Non-metro" 1 "Metro/non-central city" 2 "Metro/central city", modify
		label values metro METRO
	label var dda "Is the census tract in a difficult development area? (service year)"
		label define DDA 0 "Not in DDA" 1 "Metro DDA" 2 "Non-metro DDA" 3 "Metro GO Zone DDA" 4 "Non-metro GO Zone DDA", modify
		label values dda DDA
	label var qct "Is the census tract a qualified census tract?"
		recode qct 2=0
		label define QCT 0 "No" 1 "In a qualified tract", modify
		label values qct QCT
	label var nonprog "No longer monitored for LIHTC program compliance due to expired use or other reason"
		recode nonprog .=0
		label define NONPROG 0 "Monitored" 1 "No longer monitored", modify
		label values nonprog NONPROG
	label var nlm_reason "Reason property is no longer monitored for LIHTC"
		label define NLM_REASON 1 "Completed extended-use period" 2 "Sale under qualified contract" 3 "Other", modify
		label values nlm_reason NLM_REASON
	label var nlm_spc "Reason property is no longer monitored for LIHTC – other as specified"
	label var datanote "Notes about data record changes processed for database update"
		rename ( record_stat) (temp)
		generate record_stat = .
		replace record_stat = 0 if temp == "X"
		replace record_stat = 1 if temp == "U"
		replace record_stat = 2 if temp == "N"
	label var record_stat "Record Status compared to previous version of LIHTC database"
		label define RECORD_STAT 0 "Existing" 1 "Updated" 2 "New", modify
		label values record_stat RECORD_STAT
		drop temp
	
