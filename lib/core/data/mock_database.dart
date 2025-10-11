// This file simulates a remote database with a large amount of mock data.
// In a real app, this data would come from Supabase.

const mockVillages = [
  // Uttarakhand
  {
    "id": "V001",
    "name": "Rampur",
    "block": "Kashipur",
    "district": "Udham Singh Nagar",
    "state": "Uttarakhand",
    "population": 4500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Not_Started"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V002",
    "name": "Sitapur",
    "block": "Sitarganj",
    "district": "Udham Singh Nagar",
    "state": "Uttarakhand",
    "population": 3200,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V003",
    "name": "Madhopur",
    "block": "Jaspur",
    "district": "Udham Singh Nagar",
    "state": "Uttarakhand",
    "population": 6100,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "In_Progress"},
      {"domain": "Drinking Water", "value": "Not_Started"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Uttar Pradesh
  {
    "id": "V004",
    "name": "Bharatpur",
    "block": "Sadar",
    "district": "Lucknow",
    "state": "Uttar Pradesh",
    "population": 7250,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V005",
    "name": "Devigarh",
    "block": "Pindra",
    "district": "Varanasi",
    "state": "Uttar Pradesh",
    "population": 3800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Not_Started"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Not_Started"},
      {"domain": "Connectivity", "value": "In_Progress"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "In_Progress"},
    ]
  },
  {
    "id": "V006",
    "name": "Alamnagar",
    "block": "Bakshi Ka Talab",
    "district": "Lucknow",
    "state": "Uttar Pradesh",
    "population": 5500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "In_Progress"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Rajasthan
  {
    "id": "V007",
    "name": "Manpur",
    "block": "Sanganer",
    "district": "Jaipur",
    "state": "Rajasthan",
    "population": 8900,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V008",
    "name": "Surajgarh",
    "block": "Girwa",
    "district": "Udaipur",
    "state": "Rajasthan",
    "population": 4200,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Not_Started"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "In_Progress"},
    ]
  },
  {
    "id": "V009",
    "name": "Kishangarh",
    "block": "Amer",
    "district": "Jaipur",
    "state": "Rajasthan",
    "population": 6300,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "In_Progress"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Bihar
  {
    "id": "V010",
    "name": "Gopalpur",
    "block": "Danapur",
    "district": "Patna",
    "state": "Bihar",
    "population": 9500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Not_Started"},
      {"domain": "Healthcare", "value": "Not_Started"},
      {"domain": "Sanitation", "value": "Not_Started"},
      {"domain": "Connectivity", "value": "In_Progress"},
      {"domain": "Drinking Water", "value": "In_Progress"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V011",
    "name": "Hajipur",
    "block": "Maner",
    "district": "Patna",
    "state": "Bihar",
    "population": 7100,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Karnataka
  {
    "id": "V012",
    "name": "Anekal",
    "block": "Anekal",
    "district": "Bengaluru Urban",
    "state": "Karnataka",
    "population": 12000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V013",
    "name": "Hunsur",
    "block": "Hunsur",
    "district": "Mysuru",
    "state": "Karnataka",
    "population": 5800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "In_Progress"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V014",
    "name": "Devanahalli",
    "block": "Devanahalli",
    "district": "Bengaluru Rural",
    "state": "Karnataka",
    "population": 8200,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Not_Started"},
      {"domain": "Drinking Water", "value": "Not_Started"},
      {"domain": "Electricity", "value": "In_Progress"},
    ]
  },
  // Maharashtra
  {
    "id": "V015",
    "name": "Wagholi",
    "block": "Haveli",
    "district": "Pune",
    "state": "Maharashtra",
    "population": 15000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "In_Progress"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V016",
    "name": "Paithan",
    "block": "Paithan",
    "district": "Aurangabad",
    "state": "Maharashtra",
    "population": 6500,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V017",
    "name": "Kamshet",
    "block": "Maval",
    "district": "Pune",
    "state": "Maharashtra",
    "population": 4800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "In_Progress"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Not_Started"},
    ]
  },
  {
    "id": "V018",
    "name": "Shivpur",
    "block": "Sadar",
    "district": "Varanasi",
    "state": "Uttar Pradesh",
    "population": 5100,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V019",
    "name": "Ratangarh",
    "block": "Lunkaransar",
    "district": "Bikaner",
    "state": "Rajasthan",
    "population": 3300,
    "infrastructure_status": [
      {"domain": "Education", "value": "Not_Started"},
      {"domain": "Healthcare", "value": "Not_Started"},
      {"domain": "Sanitation", "value": "Not_Started"},
      {"domain": "Connectivity", "value": "Not_Started"},
      {"domain": "Drinking Water", "value": "Not_Started"},
      {"domain": "Electricity", "value": "Not_Started"},
    ]
  },
  {
    "id": "V020",
    "name": "Jamui",
    "block": "Jamui",
    "district": "Jamui",
    "state": "Bihar",
    "population": 9800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Not_Started"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "In_Progress"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in Uttarakhand
  {
    "id": "V021",
    "name": "Kotdwar",
    "block": "Kotdwar",
    "district": "Pauri Garhwal",
    "state": "Uttarakhand",
    "population": 12000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V022",
    "name": "Rudrapur",
    "block": "Rudrapur",
    "district": "Udham Singh Nagar",
    "state": "Uttarakhand",
    "population": 15000,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V023",
    "name": "Haldwani",
    "block": "Haldwani",
    "district": "Nainital",
    "state": "Uttarakhand",
    "population": 18000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V024",
    "name": "Dehradun",
    "block": "Dehradun",
    "district": "Dehradun",
    "state": "Uttarakhand",
    "population": 25000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in Uttar Pradesh
  {
    "id": "V025",
    "name": "Agra",
    "block": "Agra",
    "district": "Agra",
    "state": "Uttar Pradesh",
    "population": 22000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V026",
    "name": "Kanpur",
    "block": "Kanpur",
    "district": "Kanpur Nagar",
    "state": "Uttar Pradesh",
    "population": 30000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V027",
    "name": "Meerut",
    "block": "Meerut",
    "district": "Meerut",
    "state": "Uttar Pradesh",
    "population": 28000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V028",
    "name": "Allahabad",
    "block": "Allahabad",
    "district": "Prayagraj",
    "state": "Uttar Pradesh",
    "population": 32000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in Rajasthan
  {
    "id": "V029",
    "name": "Jodhpur",
    "block": "Jodhpur",
    "district": "Jodhpur",
    "state": "Rajasthan",
    "population": 26000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V030",
    "name": "Kota",
    "block": "Kota",
    "district": "Kota",
    "state": "Rajasthan",
    "population": 24000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V031",
    "name": "Ajmer",
    "block": "Ajmer",
    "district": "Ajmer",
    "state": "Rajasthan",
    "population": 20000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V032",
    "name": "Bharatpur",
    "block": "Bharatpur",
    "district": "Bharatpur",
    "state": "Rajasthan",
    "population": 18000,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in Bihar
  {
    "id": "V033",
    "name": "Gaya",
    "block": "Gaya",
    "district": "Gaya",
    "state": "Bihar",
    "population": 16000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Not_Started"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "In_Progress"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V034",
    "name": "Muzaffarpur",
    "block": "Muzaffarpur",
    "district": "Muzaffarpur",
    "state": "Bihar",
    "population": 14000,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V035",
    "name": "Darbhanga",
    "block": "Darbhanga",
    "district": "Darbhanga",
    "state": "Bihar",
    "population": 12000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in Karnataka
  {
    "id": "V036",
    "name": "Mysore",
    "block": "Mysore",
    "district": "Mysuru",
    "state": "Karnataka",
    "population": 22000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V037",
    "name": "Hubli",
    "block": "Hubli",
    "district": "Dharwad",
    "state": "Karnataka",
    "population": 20000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V038",
    "name": "Mangalore",
    "block": "Mangalore",
    "district": "Dakshina Kannada",
    "state": "Karnataka",
    "population": 18000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V039",
    "name": "Belgaum",
    "block": "Belgaum",
    "district": "Belagavi",
    "state": "Karnataka",
    "population": 16000,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in Maharashtra
  {
    "id": "V040",
    "name": "Mumbai",
    "block": "Mumbai",
    "district": "Mumbai",
    "state": "Maharashtra",
    "population": 35000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V041",
    "name": "Nagpur",
    "block": "Nagpur",
    "district": "Nagpur",
    "state": "Maharashtra",
    "population": 30000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V042",
    "name": "Nashik",
    "block": "Nashik",
    "district": "Nashik",
    "state": "Maharashtra",
    "population": 28000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V043",
    "name": "Solapur",
    "block": "Solapur",
    "district": "Solapur",
    "state": "Maharashtra",
    "population": 24000,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in Tamil Nadu
  {
    "id": "V044",
    "name": "Chennai",
    "block": "Chennai",
    "district": "Chennai",
    "state": "Tamil Nadu",
    "population": 32000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V045",
    "name": "Coimbatore",
    "block": "Coimbatore",
    "district": "Coimbatore",
    "state": "Tamil Nadu",
    "population": 26000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V046",
    "name": "Madurai",
    "block": "Madurai",
    "district": "Madurai",
    "state": "Tamil Nadu",
    "population": 22000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in West Bengal
  {
    "id": "V047",
    "name": "Kolkata",
    "block": "Kolkata",
    "district": "Kolkata",
    "state": "West Bengal",
    "population": 40000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V048",
    "name": "Asansol",
    "block": "Asansol",
    "district": "Paschim Bardhaman",
    "state": "West Bengal",
    "population": 18000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V049",
    "name": "Siliguri",
    "block": "Siliguri",
    "district": "Darjeeling",
    "state": "West Bengal",
    "population": 16000,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Additional villages in Gujarat
  {
    "id": "V050",
    "name": "Ahmedabad",
    "block": "Ahmedabad",
    "district": "Ahmedabad",
    "state": "Gujarat",
    "population": 35000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V051",
    "name": "Surat",
    "block": "Surat",
    "district": "Surat",
    "state": "Gujarat",
    "population": 30000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V052",
    "name": "Vadodara",
    "block": "Vadodara",
    "district": "Vadodara",
    "state": "Gujarat",
    "population": 25000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V053",
    "name": "Rajkot",
    "block": "Rajkot",
    "district": "Rajkot",
    "state": "Gujarat",
    "population": 22000,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Andhra Pradesh
  {
    "id": "V054",
    "name": "Garladinne",
    "block": "Garladinne",
    "district": "Anantapur",
    "state": "Andhra Pradesh",
    "population": 4500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V055",
    "name": "Kuppam",
    "block": "Kuppam",
    "district": "Chittoor",
    "state": "Andhra Pradesh",
    "population": 5200,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V056",
    "name": "Amalapuram",
    "block": "Amalapuram",
    "district": "East Godavari",
    "state": "Andhra Pradesh",
    "population": 6800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V057",
    "name": "Tenali",
    "block": "Tenali",
    "district": "Guntur",
    "state": "Andhra Pradesh",
    "population": 7500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V058",
    "name": "Machilipatnam",
    "block": "Machilipatnam",
    "district": "Krishna",
    "state": "Andhra Pradesh",
    "population": 8200,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V059",
    "name": "Nandyal",
    "block": "Nandyal",
    "district": "Kurnool",
    "state": "Andhra Pradesh",
    "population": 6100,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V060",
    "name": "Kovur",
    "block": "Kovur",
    "district": "Nellore",
    "state": "Andhra Pradesh",
    "population": 4800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V061",
    "name": "Ongole",
    "block": "Ongole",
    "district": "Prakasam",
    "state": "Andhra Pradesh",
    "population": 7200,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V062",
    "name": "Palasa",
    "block": "Palasa",
    "district": "Srikakulam",
    "state": "Andhra Pradesh",
    "population": 5500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V063",
    "name": "Anakapalle",
    "block": "Anakapalle",
    "district": "Visakhapatnam",
    "state": "Andhra Pradesh",
    "population": 8900,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V064",
    "name": "Bobbili",
    "block": "Bobbili",
    "district": "Vizianagaram",
    "state": "Andhra Pradesh",
    "population": 4200,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V065",
    "name": "Bhimavaram",
    "block": "Bhimavaram",
    "district": "West Godavari",
    "state": "Andhra Pradesh",
    "population": 7800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Arunachal Pradesh
  {
    "id": "V066",
    "name": "Itanagar",
    "block": "Itanagar",
    "district": "Papum Pare",
    "state": "Arunachal Pradesh",
    "population": 3500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "In_Progress"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V067",
    "name": "Pasighat",
    "block": "Pasighat",
    "district": "East Siang",
    "state": "Arunachal Pradesh",
    "population": 2800,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "In_Progress"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V068",
    "name": "Tezpur",
    "block": "Tezpur",
    "district": "West Siang",
    "state": "Arunachal Pradesh",
    "population": 2200,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Assam
  {
    "id": "V069",
    "name": "Guwahati",
    "block": "Guwahati",
    "district": "Kamrup Metropolitan",
    "state": "Assam",
    "population": 12000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V070",
    "name": "Jorhat",
    "block": "Jorhat",
    "district": "Jorhat",
    "state": "Assam",
    "population": 8500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V071",
    "name": "Dibrugarh",
    "block": "Dibrugarh",
    "district": "Dibrugarh",
    "state": "Assam",
    "population": 7200,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V072",
    "name": "Silchar",
    "block": "Silchar",
    "district": "Cachar",
    "state": "Assam",
    "population": 6800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V073",
    "name": "Tezpur",
    "block": "Tezpur",
    "district": "Sonitpur",
    "state": "Assam",
    "population": 5500,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Chhattisgarh
  {
    "id": "V074",
    "name": "Raipur",
    "block": "Raipur",
    "district": "Raipur",
    "state": "Chhattisgarh",
    "population": 15000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V075",
    "name": "Bilaspur",
    "block": "Bilaspur",
    "district": "Bilaspur",
    "state": "Chhattisgarh",
    "population": 12000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V076",
    "name": "Durg",
    "block": "Durg",
    "district": "Durg",
    "state": "Chhattisgarh",
    "population": 9800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V077",
    "name": "Korba",
    "block": "Korba",
    "district": "Korba",
    "state": "Chhattisgarh",
    "population": 8500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V078",
    "name": "Rajnandgaon",
    "block": "Rajnandgaon",
    "district": "Rajnandgaon",
    "state": "Chhattisgarh",
    "population": 7200,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Goa
  {
    "id": "V079",
    "name": "Panaji",
    "block": "Panaji",
    "district": "North Goa",
    "state": "Goa",
    "population": 4500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V080",
    "name": "Margao",
    "block": "Margao",
    "district": "South Goa",
    "state": "Goa",
    "population": 3800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Haryana
  {
    "id": "V081",
    "name": "Chandigarh",
    "block": "Chandigarh",
    "district": "Chandigarh",
    "state": "Haryana",
    "population": 12000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V082",
    "name": "Gurgaon",
    "block": "Gurgaon",
    "district": "Gurugram",
    "state": "Haryana",
    "population": 15000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V083",
    "name": "Faridabad",
    "block": "Faridabad",
    "district": "Faridabad",
    "state": "Haryana",
    "population": 13000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V084",
    "name": "Panipat",
    "block": "Panipat",
    "district": "Panipat",
    "state": "Haryana",
    "population": 8500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V085",
    "name": "Karnal",
    "block": "Karnal",
    "district": "Karnal",
    "state": "Haryana",
    "population": 7200,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Himachal Pradesh
  {
    "id": "V086",
    "name": "Shimla",
    "block": "Shimla",
    "district": "Shimla",
    "state": "Himachal Pradesh",
    "population": 6800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V087",
    "name": "Dharamshala",
    "block": "Dharamshala",
    "district": "Kangra",
    "state": "Himachal Pradesh",
    "population": 5500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V088",
    "name": "Mandi",
    "block": "Mandi",
    "district": "Mandi",
    "state": "Himachal Pradesh",
    "population": 4200,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V089",
    "name": "Solan",
    "block": "Solan",
    "district": "Solan",
    "state": "Himachal Pradesh",
    "population": 3800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Union Territories
  // Delhi
  {
    "id": "V090",
    "name": "New Delhi",
    "block": "New Delhi",
    "district": "New Delhi",
    "state": "Delhi",
    "population": 25000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V091",
    "name": "Central Delhi",
    "block": "Central Delhi",
    "district": "Central Delhi",
    "state": "Delhi",
    "population": 18000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V092",
    "name": "East Delhi",
    "block": "East Delhi",
    "district": "East Delhi",
    "state": "Delhi",
    "population": 15000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V093",
    "name": "North Delhi",
    "block": "North Delhi",
    "district": "North Delhi",
    "state": "Delhi",
    "population": 12000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V094",
    "name": "South Delhi",
    "block": "South Delhi",
    "district": "South Delhi",
    "state": "Delhi",
    "population": 16000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V095",
    "name": "West Delhi",
    "block": "West Delhi",
    "district": "West Delhi",
    "state": "Delhi",
    "population": 14000,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  // Puducherry
  {
    "id": "V096",
    "name": "Puducherry",
    "block": "Puducherry",
    "district": "Puducherry",
    "state": "Puducherry",
    "population": 8500,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V097",
    "name": "Karaikal",
    "block": "Karaikal",
    "district": "Karaikal",
    "state": "Puducherry",
    "population": 4200,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "In_Progress"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V098",
    "name": "Mahe",
    "block": "Mahe",
    "district": "Mahe",
    "state": "Puducherry",
    "population": 2800,
    "infrastructure_status": [
      {"domain": "Education", "value": "Completed"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  },
  {
    "id": "V099",
    "name": "Yanam",
    "block": "Yanam",
    "district": "Yanam",
    "state": "Puducherry",
    "population": 3200,
    "infrastructure_status": [
      {"domain": "Education", "value": "In_Progress"},
      {"domain": "Healthcare", "value": "Completed"},
      {"domain": "Sanitation", "value": "Completed"},
      {"domain": "Connectivity", "value": "Completed"},
      {"domain": "Drinking Water", "value": "Completed"},
      {"domain": "Electricity", "value": "Completed"},
    ]
  }
];

const mockProjects = [
  {
    "id": "P101",
    "name": "Primary School Construction",
    "village": "Rampur",
    "status": "Ongoing",
    "completion_percent": 65,
    "category": "Education",
    "priority": "High",
    "budget": 2500000,
    "allocated_budget": 2500000,
    "start_date": "2024-01-15",
    "expected_end_date": "2024-06-30",
    "actual_end_date": null,
    "contractor": "ABC Construction Ltd.",
    "supervisor": "Rajesh Kumar",
    "description":
        "Construction of a new primary school building with 6 classrooms, library, and playground facilities.",
    "last_updated": "2024-03-15",
    "notes":
        "Foundation work completed. Currently working on first floor construction.",
    "photos": [],
    "documents": []
  },
  {
    "id": "P102",
    "name": "Community Health Center Upgrade",
    "village": "Sitapur",
    "status": "Completed",
    "completion_percent": 100,
    "category": "Healthcare",
    "priority": "High",
    "budget": 1800000,
    "allocated_budget": 1800000,
    "start_date": "2023-09-01",
    "expected_end_date": "2024-02-28",
    "actual_end_date": "2024-02-25",
    "contractor": "MediCare Builders",
    "supervisor": "Dr. Priya Sharma",
    "description":
        "Upgradation of existing health center with new equipment, additional rooms, and modern facilities.",
    "last_updated": "2024-02-25",
    "notes":
        "Project completed ahead of schedule. All equipment installed and functional.",
    "photos": [],
    "documents": []
  },
  {
    "id": "P103",
    "name": "Road Connectivity Project",
    "village": "Madhopur",
    "status": "Delayed",
    "completion_percent": 20,
    "category": "Infrastructure",
    "priority": "Medium",
    "budget": 3200000,
    "allocated_budget": 3200000,
    "start_date": "2023-11-01",
    "expected_end_date": "2024-04-30",
    "actual_end_date": null,
    "contractor": "RoadWorks India",
    "supervisor": "Amit Singh",
    "description":
        "Construction of 5km road connecting the village to the main highway with proper drainage system.",
    "last_updated": "2024-03-10",
    "notes":
        "Project delayed due to land acquisition issues. Currently waiting for clearance from forest department.",
    "photos": [],
    "documents": []
  },
  {
    "id": "P104",
    "name": "Clean Water Pipeline",
    "village": "Rampur",
    "status": "Pending",
    "completion_percent": 5,
    "category": "Water & Sanitation",
    "priority": "High",
    "budget": 1500000,
    "allocated_budget": 1500000,
    "start_date": "2024-04-01",
    "expected_end_date": "2024-08-31",
    "actual_end_date": null,
    "contractor": "AquaTech Solutions",
    "supervisor": "Vikram Mehta",
    "description":
        "Installation of clean water pipeline system to provide safe drinking water to all households in the village.",
    "last_updated": "2024-03-20",
    "notes":
        "Project in planning phase. Survey completed, awaiting approval from water department.",
    "photos": [],
    "documents": []
  },
  {
    "id": "P105",
    "name": "Sanitation Block Installation",
    "village": "Bharatpur",
    "status": "Ongoing",
    "completion_percent": 80
  },
  {
    "id": "P106",
    "name": "Secondary School Foundation",
    "village": "Devigarh",
    "status": "Stalled",
    "completion_percent": 15
  },
  {
    "id": "P107",
    "name": "Mobile Tower Erection",
    "village": "Surajgarh",
    "status": "Planning",
    "completion_percent": 0
  },
  {
    "id": "P108",
    "name": "Anganwadi Center Modernization",
    "village": "Kishangarh",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P109",
    "name": "Village-wide Electrification",
    "village": "Alamnagar",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P110",
    "name": "Panchayat Ghar Renovation",
    "village": "Manpur",
    "status": "Ongoing",
    "completion_percent": 50
  },
  {
    "id": "P111",
    "name": "Public Health Dispensary Setup",
    "village": "Gopalpur",
    "status": "Stalled",
    "completion_percent": 45
  },
  {
    "id": "P112",
    "name": "Water Purification Plant",
    "village": "Devanahalli",
    "status": "Planning",
    "completion_percent": 10
  },
  {
    "id": "P113",
    "name": "Skill Development Center",
    "village": "Anekal",
    "status": "Ongoing",
    "completion_percent": 75
  },
  {
    "id": "P114",
    "name": "Internet Fiber Connectivity",
    "village": "Hunsur",
    "status": "Ongoing",
    "completion_percent": 30
  },
  {
    "id": "P115",
    "name": "Solid Waste Management System",
    "village": "Wagholi",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P116",
    "name": "Solar Power Grid for Farms",
    "village": "Paithan",
    "status": "Ongoing",
    "completion_percent": 90
  },
  {
    "id": "P117",
    "name": "Hospital Bed Expansion",
    "village": "Kamshet",
    "status": "Planning",
    "completion_percent": 0
  },
  {
    "id": "P118",
    "name": "Digital Literacy Program",
    "village": "Shivpur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P119",
    "name": "Last Mile Road Paving",
    "village": "Hajipur",
    "status": "Ongoing",
    "completion_percent": 25
  },
  {
    "id": "P120",
    "name": "Community Hall Construction",
    "village": "Jamui",
    "status": "Stalled",
    "completion_percent": 55
  },
  {
    "id": "P121",
    "name": "Rainwater Harvesting System",
    "village": "Ratangarh",
    "status": "Planning",
    "completion_percent": 5
  },
  {
    "id": "P122",
    "name": "Check Dam Construction",
    "village": "Surajgarh",
    "status": "Ongoing",
    "completion_percent": 40
  },
  {
    "id": "P123",
    "name": "Public Library Establishment",
    "village": "Devigarh",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P124",
    "name": "Streetlight Installation",
    "village": "Madhopur",
    "status": "Ongoing",
    "completion_percent": 85
  },
  {
    "id": "P125",
    "name": "Stormwater Drain Network",
    "village": "Bharatpur",
    "status": "Stalled",
    "completion_percent": 35
  },
  {
    "id": "P126",
    "name": "Cattle Shelter Upgrade",
    "village": "Alamnagar",
    "status": "Planning",
    "completion_percent": 0
  },
  {
    "id": "P127",
    "name": "New Classroom Block",
    "village": "Sitapur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P128",
    "name": "Maternity Ward Addition",
    "village": "Rampur",
    "status": "Ongoing",
    "completion_percent": 60
  },
  {
    "id": "P129",
    "name": "Vocational Training for Weavers",
    "village": "Hunsur",
    "status": "Ongoing",
    "completion_percent": 70
  },
  {
    "id": "P130",
    "name": "Pharmacy at Health Center",
    "village": "Anekal",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P131",
    "name": "Bridge Repair over Canal",
    "village": "Wagholi",
    "status": "Stalled",
    "completion_percent": 10
  },
  {
    "id": "P132",
    "name": "Bus Stop Shelter Construction",
    "village": "Kishangarh",
    "status": "Planning",
    "completion_percent": 0
  },
  {
    "id": "P133",
    "name": "Public Toilet Block",
    "village": "Gopalpur",
    "status": "Ongoing",
    "completion_percent": 95
  },
  {
    "id": "P134",
    "name": "High School Science Lab",
    "village": "Hajipur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P135",
    "name": "Village Entrance Archway",
    "village": "Paithan",
    "status": "Ongoing",
    "completion_percent": 50
  },
  // Projects for new villages in Uttarakhand
  {
    "id": "P136",
    "name": "Digital Library Setup",
    "village": "Kotdwar",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P137",
    "name": "Community Health Center",
    "village": "Rudrapur",
    "status": "Ongoing",
    "completion_percent": 75
  },
  {
    "id": "P138",
    "name": "Road Widening Project",
    "village": "Haldwani",
    "status": "Planning",
    "completion_percent": 10
  },
  {
    "id": "P139",
    "name": "Smart City Initiative",
    "village": "Dehradun",
    "status": "Ongoing",
    "completion_percent": 60
  },
  // Projects for new villages in Uttar Pradesh
  {
    "id": "P140",
    "name": "Heritage Conservation Project",
    "village": "Agra",
    "status": "Ongoing",
    "completion_percent": 40
  },
  {
    "id": "P141",
    "name": "Industrial Development Zone",
    "village": "Kanpur",
    "status": "Planning",
    "completion_percent": 5
  },
  {
    "id": "P142",
    "name": "Metro Rail Extension",
    "village": "Meerut",
    "status": "Stalled",
    "completion_percent": 30
  },
  {
    "id": "P143",
    "name": "Riverfront Development",
    "village": "Allahabad",
    "status": "Ongoing",
    "completion_percent": 70
  },
  // Projects for new villages in Rajasthan
  {
    "id": "P144",
    "name": "Desert Tourism Hub",
    "village": "Jodhpur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P145",
    "name": "Engineering College",
    "village": "Kota",
    "status": "Ongoing",
    "completion_percent": 80
  },
  {
    "id": "P146",
    "name": "Pilgrimage Center Development",
    "village": "Ajmer",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P147",
    "name": "Wildlife Sanctuary",
    "village": "Bharatpur",
    "status": "Ongoing",
    "completion_percent": 65
  },
  // Projects for new villages in Bihar
  {
    "id": "P148",
    "name": "Buddhist Circuit Development",
    "village": "Gaya",
    "status": "Ongoing",
    "completion_percent": 55
  },
  {
    "id": "P149",
    "name": "Agricultural Research Center",
    "village": "Muzaffarpur",
    "status": "Planning",
    "completion_percent": 15
  },
  {
    "id": "P150",
    "name": "Cultural Heritage Museum",
    "village": "Darbhanga",
    "status": "Completed",
    "completion_percent": 100
  },
  // Projects for new villages in Karnataka
  {
    "id": "P151",
    "name": "IT Park Development",
    "village": "Mysore",
    "status": "Ongoing",
    "completion_percent": 45
  },
  {
    "id": "P152",
    "name": "Railway Station Modernization",
    "village": "Hubli",
    "status": "Stalled",
    "completion_percent": 25
  },
  {
    "id": "P153",
    "name": "Port Infrastructure Upgrade",
    "village": "Mangalore",
    "status": "Ongoing",
    "completion_percent": 85
  },
  {
    "id": "P154",
    "name": "Border Trade Center",
    "village": "Belgaum",
    "status": "Planning",
    "completion_percent": 20
  },
  // Projects for new villages in Maharashtra
  {
    "id": "P155",
    "name": "Financial District Expansion",
    "village": "Mumbai",
    "status": "Ongoing",
    "completion_percent": 90
  },
  {
    "id": "P156",
    "name": "Orange City Development",
    "village": "Nagpur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P157",
    "name": "Wine Tourism Project",
    "village": "Nashik",
    "status": "Ongoing",
    "completion_percent": 70
  },
  {
    "id": "P158",
    "name": "Textile Hub Modernization",
    "village": "Solapur",
    "status": "Stalled",
    "completion_percent": 35
  },
  // Projects for new villages in Tamil Nadu
  {
    "id": "P159",
    "name": "IT Corridor Development",
    "village": "Chennai",
    "status": "Ongoing",
    "completion_percent": 75
  },
  {
    "id": "P160",
    "name": "Textile Industry Cluster",
    "village": "Coimbatore",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P161",
    "name": "Temple City Renovation",
    "village": "Madurai",
    "status": "Ongoing",
    "completion_percent": 60
  },
  // Projects for new villages in West Bengal
  {
    "id": "P162",
    "name": "Smart City Mission",
    "village": "Kolkata",
    "status": "Ongoing",
    "completion_percent": 80
  },
  {
    "id": "P163",
    "name": "Steel City Modernization",
    "village": "Asansol",
    "status": "Planning",
    "completion_percent": 25
  },
  {
    "id": "P164",
    "name": "Tea Tourism Development",
    "village": "Siliguri",
    "status": "Ongoing",
    "completion_percent": 50
  },
  // Projects for new villages in Gujarat
  {
    "id": "P165",
    "name": "Diamond Hub Expansion",
    "village": "Ahmedabad",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P166",
    "name": "Textile Manufacturing Zone",
    "village": "Surat",
    "status": "Ongoing",
    "completion_percent": 85
  },
  {
    "id": "P167",
    "name": "Petrochemical Complex",
    "village": "Vadodara",
    "status": "Stalled",
    "completion_percent": 40
  },
  {
    "id": "P168",
    "name": "Agricultural Market Hub",
    "village": "Rajkot",
    "status": "Planning",
    "completion_percent": 30
  },
  // Additional projects for existing villages
  {
    "id": "P169",
    "name": "Solar Power Plant",
    "village": "Rampur",
    "status": "Ongoing",
    "completion_percent": 70
  },
  {
    "id": "P170",
    "name": "Digital Banking Center",
    "village": "Sitapur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P171",
    "name": "Eco-Tourism Resort",
    "village": "Madhopur",
    "status": "Planning",
    "completion_percent": 15
  },
  {
    "id": "P172",
    "name": "Organic Farming Initiative",
    "village": "Bharatpur",
    "status": "Ongoing",
    "completion_percent": 55
  },
  {
    "id": "P173",
    "name": "Women Empowerment Center",
    "village": "Devigarh",
    "status": "Stalled",
    "completion_percent": 30
  },
  {
    "id": "P174",
    "name": "Youth Skill Development",
    "village": "Alamnagar",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P175",
    "name": "Disaster Management Center",
    "village": "Manpur",
    "status": "Ongoing",
    "completion_percent": 65
  },
  {
    "id": "P176",
    "name": "Cultural Center",
    "village": "Surajgarh",
    "status": "Planning",
    "completion_percent": 20
  },
  {
    "id": "P177",
    "name": "Sports Complex",
    "village": "Kishangarh",
    "status": "Ongoing",
    "completion_percent": 45
  },
  {
    "id": "P178",
    "name": "Rural Technology Hub",
    "village": "Gopalpur",
    "status": "Stalled",
    "completion_percent": 25
  },
  {
    "id": "P179",
    "name": "Water Conservation Project",
    "village": "Hajipur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P180",
    "name": "Green Energy Initiative",
    "village": "Anekal",
    "status": "Ongoing",
    "completion_percent": 80
  },
  {
    "id": "P181",
    "name": "Digital Village Program",
    "village": "Hunsur",
    "status": "Planning",
    "completion_percent": 35
  },
  {
    "id": "P182",
    "name": "Airport Expansion",
    "village": "Devanahalli",
    "status": "Ongoing",
    "completion_percent": 90
  },
  {
    "id": "P183",
    "name": "Smart Grid Implementation",
    "village": "Wagholi",
    "status": "Stalled",
    "completion_percent": 40
  },
  {
    "id": "P184",
    "name": "Heritage Walk Development",
    "village": "Paithan",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P185",
    "name": "Medical College",
    "village": "Kamshet",
    "status": "Ongoing",
    "completion_percent": 60
  },
  {
    "id": "P186",
    "name": "Digital Literacy Mission",
    "village": "Shivpur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P187",
    "name": "Rural Connectivity Project",
    "village": "Ratangarh",
    "status": "Planning",
    "completion_percent": 10
  },
  {
    "id": "P188",
    "name": "Agricultural Innovation Center",
    "village": "Jamui",
    "status": "Ongoing",
    "completion_percent": 50
  },
  // Projects for Andhra Pradesh villages
  {
    "id": "P189",
    "name": "Agricultural Research Station",
    "village": "Garladinne",
    "status": "Ongoing",
    "completion_percent": 75
  },
  {
    "id": "P190",
    "name": "Digital Learning Center",
    "village": "Kuppam",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P191",
    "name": "Coastal Development Project",
    "village": "Amalapuram",
    "status": "Ongoing",
    "completion_percent": 60
  },
  {
    "id": "P192",
    "name": "Textile Manufacturing Unit",
    "village": "Tenali",
    "status": "Planning",
    "completion_percent": 20
  },
  {
    "id": "P193",
    "name": "Port Infrastructure Development",
    "village": "Machilipatnam",
    "status": "Ongoing",
    "completion_percent": 80
  },
  {
    "id": "P194",
    "name": "Mining Technology Center",
    "village": "Nandyal",
    "status": "Stalled",
    "completion_percent": 35
  },
  {
    "id": "P195",
    "name": "Rice Processing Plant",
    "village": "Kovur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P196",
    "name": "Poultry Development Center",
    "village": "Ongole",
    "status": "Ongoing",
    "completion_percent": 65
  },
  {
    "id": "P197",
    "name": "Cashew Processing Unit",
    "village": "Palasa",
    "status": "Planning",
    "completion_percent": 15
  },
  {
    "id": "P198",
    "name": "Industrial Corridor Development",
    "village": "Anakapalle",
    "status": "Ongoing",
    "completion_percent": 70
  },
  {
    "id": "P199",
    "name": "Tourism Infrastructure",
    "village": "Bobbili",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P200",
    "name": "Aquaculture Development",
    "village": "Bhimavaram",
    "status": "Ongoing",
    "completion_percent": 55
  },
  // Projects for Arunachal Pradesh villages
  {
    "id": "P201",
    "name": "Border Area Development",
    "village": "Itanagar",
    "status": "Ongoing",
    "completion_percent": 80
  },
  {
    "id": "P202",
    "name": "Hydroelectric Power Plant",
    "village": "Pasighat",
    "status": "Planning",
    "completion_percent": 25
  },
  {
    "id": "P203",
    "name": "Eco-Tourism Resort",
    "village": "Tezpur",
    "status": "Ongoing",
    "completion_percent": 45
  },
  // Projects for Assam villages
  {
    "id": "P204",
    "name": "Smart City Initiative",
    "village": "Guwahati",
    "status": "Ongoing",
    "completion_percent": 85
  },
  {
    "id": "P205",
    "name": "Tea Research Institute",
    "village": "Jorhat",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P206",
    "name": "Oil Refinery Expansion",
    "village": "Dibrugarh",
    "status": "Ongoing",
    "completion_percent": 75
  },
  {
    "id": "P207",
    "name": "Silk Production Center",
    "village": "Silchar",
    "status": "Planning",
    "completion_percent": 30
  },
  {
    "id": "P208",
    "name": "Riverfront Development",
    "village": "Tezpur",
    "status": "Ongoing",
    "completion_percent": 60
  },
  // Projects for Chhattisgarh villages
  {
    "id": "P209",
    "name": "Steel Plant Modernization",
    "village": "Raipur",
    "status": "Ongoing",
    "completion_percent": 90
  },
  {
    "id": "P210",
    "name": "Coal Mining Technology",
    "village": "Bilaspur",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P211",
    "name": "Cement Manufacturing Unit",
    "village": "Durg",
    "status": "Ongoing",
    "completion_percent": 70
  },
  {
    "id": "P212",
    "name": "Power Generation Plant",
    "village": "Korba",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P213",
    "name": "Tribal Development Center",
    "village": "Rajnandgaon",
    "status": "Planning",
    "completion_percent": 40
  },
  // Projects for Goa villages
  {
    "id": "P214",
    "name": "Tourism Infrastructure Upgrade",
    "village": "Panaji",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P215",
    "name": "Beach Development Project",
    "village": "Margao",
    "status": "Ongoing",
    "completion_percent": 80
  },
  // Projects for Haryana villages
  {
    "id": "P216",
    "name": "IT Hub Development",
    "village": "Chandigarh",
    "status": "Ongoing",
    "completion_percent": 85
  },
  {
    "id": "P217",
    "name": "Corporate Office Complex",
    "village": "Gurgaon",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P218",
    "name": "Industrial Zone Expansion",
    "village": "Faridabad",
    "status": "Ongoing",
    "completion_percent": 75
  },
  {
    "id": "P219",
    "name": "Textile Manufacturing Hub",
    "village": "Panipat",
    "status": "Planning",
    "completion_percent": 35
  },
  {
    "id": "P220",
    "name": "Agricultural Research Center",
    "village": "Karnal",
    "status": "Completed",
    "completion_percent": 100
  },
  // Projects for Himachal Pradesh villages
  {
    "id": "P221",
    "name": "Hill Station Development",
    "village": "Shimla",
    "status": "Ongoing",
    "completion_percent": 90
  },
  {
    "id": "P222",
    "name": "Buddhist Tourism Center",
    "village": "Dharamshala",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P223",
    "name": "Adventure Sports Complex",
    "village": "Mandi",
    "status": "Planning",
    "completion_percent": 25
  },
  {
    "id": "P224",
    "name": "Apple Processing Plant",
    "village": "Solan",
    "status": "Ongoing",
    "completion_percent": 65
  },
  // Projects for Delhi villages
  {
    "id": "P225",
    "name": "Metro Rail Extension",
    "village": "New Delhi",
    "status": "Ongoing",
    "completion_percent": 95
  },
  {
    "id": "P226",
    "name": "Heritage Conservation",
    "village": "Central Delhi",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P227",
    "name": "Smart City Infrastructure",
    "village": "East Delhi",
    "status": "Ongoing",
    "completion_percent": 80
  },
  {
    "id": "P228",
    "name": "Educational Hub Development",
    "village": "North Delhi",
    "status": "Planning",
    "completion_percent": 45
  },
  {
    "id": "P229",
    "name": "Commercial Complex",
    "village": "South Delhi",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P230",
    "name": "Industrial Development",
    "village": "West Delhi",
    "status": "Ongoing",
    "completion_percent": 70
  },
  // Projects for Puducherry villages
  {
    "id": "P231",
    "name": "French Heritage Tourism",
    "village": "Puducherry",
    "status": "Completed",
    "completion_percent": 100
  },
  {
    "id": "P232",
    "name": "Port Development",
    "village": "Karaikal",
    "status": "Ongoing",
    "completion_percent": 60
  },
  {
    "id": "P233",
    "name": "Coastal Tourism Project",
    "village": "Mahe",
    "status": "Planning",
    "completion_percent": 30
  },
  {
    "id": "P234",
    "name": "Agricultural Development",
    "village": "Yanam",
    "status": "Ongoing",
    "completion_percent": 55
  }
];
const mockSuccessStories = [
  {
    'title': 'Rampur village achieves 100% sanitation',
    'subtitle': 'A testament to community effort and government support.',
  },
  {
    'title': 'New school inaugurated in Sitapur',
    'subtitle': 'Education infrastructure gets a major boost.',
  },
  {
    'title': 'Manpur now fully connected via road',
    'subtitle': 'The new road project has improved local commerce.',
  },
  {
    'title': 'Clean drinking water in Madhopur',
    'subtitle': 'A new pipeline ensures safe water for all residents.',
  },
  {
    'title': 'Healthcare center upgraded in Bharatpur',
    'subtitle': 'Better facilities leading to improved health outcomes.',
  },
  {
    'title': 'Solar power initiative in Anekal',
    'subtitle': 'Sustainable energy solutions for rural areas.',
  },
  {
    'title': 'Digital literacy program launched in Shivpur',
    'subtitle': 'Empowering villagers with essential tech skills.',
  },
  {
    'title': 'Smart City Initiative transforms Dehradun',
    'subtitle': 'Digital infrastructure brings modern amenities to the hills.',
  },
  {
    'title': 'Heritage Conservation Project in Agra',
    'subtitle': 'Preserving historical monuments while boosting tourism.',
  },
  {
    'title': 'Desert Tourism Hub opens in Jodhpur',
    'subtitle': 'Creating employment opportunities in the Thar Desert.',
  },
  {
    'title': 'Buddhist Circuit Development in Gaya',
    'subtitle': 'Spiritual tourism infrastructure attracts global visitors.',
  },
  {
    'title': 'IT Park Development in Mysore',
    'subtitle': 'Technology sector growth creates new job opportunities.',
  },
  {
    'title': 'Financial District Expansion in Mumbai',
    'subtitle': 'Strengthening India\'s financial capital infrastructure.',
  },
  {
    'title': 'IT Corridor Development in Chennai',
    'subtitle': 'Southern India\'s tech hub gets major infrastructure boost.',
  },
  {
    'title': 'Smart City Mission in Kolkata',
    'subtitle': 'Digital transformation brings efficiency to the City of Joy.',
  },
  {
    'title': 'Diamond Hub Expansion in Ahmedabad',
    'subtitle': 'Gujarat\'s diamond industry gets world-class facilities.',
  },
  {
    'title': 'Digital Library Setup in Kotdwar',
    'subtitle': 'Knowledge access revolutionizes education in Uttarakhand.',
  },
  {
    'title': 'Community Health Center in Rudrapur',
    'subtitle': 'Quality healthcare reaches remote areas.',
  },
  {
    'title': 'Engineering College in Kota',
    'subtitle': 'Educational excellence hub for aspiring engineers.',
  },
  {
    'title': 'Pilgrimage Center Development in Ajmer',
    'subtitle': 'Spiritual tourism infrastructure enhances visitor experience.',
  },
  {
    'title': 'Cultural Heritage Museum in Darbhanga',
    'subtitle': 'Preserving and showcasing Bihar\'s rich cultural legacy.',
  },
  {
    'title': 'Port Infrastructure Upgrade in Mangalore',
    'subtitle': 'Modern port facilities boost coastal trade.',
  },
  {
    'title': 'Orange City Development in Nagpur',
    'subtitle':
        'Maharashtra\'s second capital gets major infrastructure boost.',
  },
  {
    'title': 'Wine Tourism Project in Nashik',
    'subtitle': 'Viticulture tourism creates new economic opportunities.',
  },
  {
    'title': 'Textile Industry Cluster in Coimbatore',
    'subtitle': 'Southern textile hub gets modern manufacturing facilities.',
  },
  {
    'title': 'Temple City Renovation in Madurai',
    'subtitle': 'Heritage preservation meets modern infrastructure needs.',
  },
  {
    'title': 'Steel City Modernization in Asansol',
    'subtitle': 'Industrial heritage city gets smart infrastructure.',
  },
  {
    'title': 'Tea Tourism Development in Siliguri',
    'subtitle': 'Darjeeling tea region attracts global tourists.',
  },
  {
    'title': 'Textile Manufacturing Zone in Surat',
    'subtitle': 'Gujarat\'s textile capital gets world-class facilities.',
  },
  {
    'title': 'Solar Power Plant in Rampur',
    'subtitle': 'Clean energy revolution in rural Uttarakhand.',
  },
  {
    'title': 'Digital Banking Center in Sitapur',
    'subtitle': 'Financial inclusion reaches every household.',
  },
  {
    'title': 'Eco-Tourism Resort in Madhopur',
    'subtitle': 'Sustainable tourism preserves natural beauty.',
  },
  {
    'title': 'Organic Farming Initiative in Bharatpur',
    'subtitle': 'Chemical-free agriculture promotes healthy living.',
  },
  {
    'title': 'Women Empowerment Center in Devigarh',
    'subtitle': 'Skill development programs transform women\'s lives.',
  },
  {
    'title': 'Youth Skill Development in Alamnagar',
    'subtitle': 'Technical training creates employment opportunities.',
  },
  {
    'title': 'Disaster Management Center in Manpur',
    'subtitle': 'Emergency response infrastructure saves lives.',
  },
  {
    'title': 'Cultural Center in Surajgarh',
    'subtitle': 'Arts and culture hub promotes local talent.',
  },
  {
    'title': 'Sports Complex in Kishangarh',
    'subtitle': 'Modern sports facilities nurture athletic talent.',
  },
  {
    'title': 'Rural Technology Hub in Gopalpur',
    'subtitle': 'Digital innovation reaches remote Bihar villages.',
  },
  {
    'title': 'Water Conservation Project in Hajipur',
    'subtitle': 'Sustainable water management ensures future supply.',
  },
  {
    'title': 'Green Energy Initiative in Anekal',
    'subtitle': 'Renewable energy powers sustainable development.',
  },
  {
    'title': 'Digital Village Program in Hunsur',
    'subtitle': 'Technology integration transforms rural Karnataka.',
  },
  {
    'title': 'Airport Expansion in Devanahalli',
    'subtitle': 'Bengaluru\'s aviation hub gets world-class facilities.',
  },
  {
    'title': 'Smart Grid Implementation in Wagholi',
    'subtitle': 'Intelligent power distribution improves efficiency.',
  },
  {
    'title': 'Heritage Walk Development in Paithan',
    'subtitle': 'Historical tourism showcases Maharashtra\'s legacy.',
  },
  {
    'title': 'Medical College in Kamshet',
    'subtitle': 'Healthcare education reaches rural Maharashtra.',
  },
  {
    'title': 'Digital Literacy Mission in Shivpur',
    'subtitle': 'Technology skills empower rural communities.',
  },
  {
    'title': 'Rural Connectivity Project in Ratangarh',
    'subtitle': 'Digital infrastructure bridges the urban-rural divide.',
  },
  {
    'title': 'Agricultural Innovation Center in Jamui',
    'subtitle': 'Modern farming techniques boost crop yields.',
  }
];
// Add this list to mock_database.dart

const mockAssets = [
  // Assets in Uttarakhand
  {
    "id": "asset-101",
    "lat": 29.38,
    "lng": 79.12,
    "type": "School",
    "name": "Primary School in Rampur"
  },
  {
    "id": "asset-102",
    "lat": 28.96,
    "lng": 78.96,
    "type": "Hospital",
    "name": "Health Center in Sitapur"
  },
  {
    "id": "asset-103",
    "lat": 29.28,
    "lng": 78.77,
    "type": "Road",
    "name": "Road Project in Madhopur"
  },
  {
    "id": "asset-104",
    "lat": 29.40,
    "lng": 79.15,
    "type": "Water",
    "name": "Water Pipeline in Rampur"
  },

  // Assets in Uttar Pradesh
  {
    "id": "asset-105",
    "lat": 26.85,
    "lng": 80.95,
    "type": "Sanitation",
    "name": "Sanitation Block in Bharatpur"
  },
  {
    "id": "asset-106",
    "lat": 25.32,
    "lng": 83.01,
    "type": "School",
    "name": "School Foundation in Devigarh"
  },
  {
    "id": "asset-109",
    "lat": 26.95,
    "lng": 80.89,
    "type": "Electricity",
    "name": "Electrification in Alamnagar"
  },
  {
    "id": "asset-118",
    "lat": 25.35,
    "lng": 82.98,
    "type": "Community Center",
    "name": "Literacy Program in Shivpur"
  },

  // Assets in Rajasthan
  {
    "id": "asset-107",
    "lat": 26.91,
    "lng": 75.78,
    "type": "Connectivity",
    "name": "Mobile Tower in Surajgarh"
  },
  {
    "id": "asset-108",
    "lat": 26.99,
    "lng": 75.83,
    "type": "Community Center",
    "name": "Anganwadi Center in Kishangarh"
  },
  {
    "id": "asset-110",
    "lat": 26.89,
    "lng": 75.81,
    "type": "Community Center",
    "name": "Panchayat Ghar in Manpur"
  },
  {
    "id": "asset-121",
    "lat": 28.30,
    "lng": 73.35,
    "type": "Water",
    "name": "Rainwater System in Ratangarh"
  },
  {
    "id": "asset-122",
    "lat": 24.58,
    "lng": 73.68,
    "type": "Water",
    "name": "Check Dam in Surajgarh"
  },

  // Assets in Bihar
  {
    "id": "asset-111",
    "lat": 25.60,
    "lng": 85.12,
    "type": "Hospital",
    "name": "Dispensary in Gopalpur"
  },
  {
    "id": "asset-119",
    "lat": 25.62,
    "lng": 85.08,
    "type": "Road",
    "name": "Road Paving in Hajipur"
  },
  {
    "id": "asset-120",
    "lat": 24.91,
    "lng": 86.22,
    "type": "Community Center",
    "name": "Community Hall in Jamui"
  },
  {
    "id": "asset-133",
    "lat": 25.59,
    "lng": 85.15,
    "type": "Sanitation",
    "name": "Toilet Block in Gopalpur"
  },

  // Assets in Karnataka
  {
    "id": "asset-113",
    "lat": 12.83,
    "lng": 77.67,
    "type": "Skill Development",
    "name": "Skill Center in Anekal"
  },
  {
    "id": "asset-114",
    "lat": 12.31,
    "lng": 76.65,
    "type": "Connectivity",
    "name": "Internet Fiber in Hunsur"
  },
  {
    "id": "asset-130",
    "lat": 12.85,
    "lng": 77.70,
    "type": "Hospital",
    "name": "Pharmacy in Anekal"
  },
  {
    "id": "asset-129",
    "lat": 12.33,
    "lng": 76.62,
    "type": "Skill Development",
    "name": "Training for Weavers in Hunsur"
  },
  {
    "id": "asset-182",
    "lat": 13.19,
    "lng": 77.70,
    "type": "Infrastructure",
    "name": "Airport Expansion in Devanahalli"
  },

  // Assets in Maharashtra
  {
    "id": "asset-115",
    "lat": 18.59,
    "lng": 73.98,
    "type": "Sanitation",
    "name": "Waste Management in Wagholi"
  },
  {
    "id": "asset-116",
    "lat": 19.55,
    "lng": 75.34,
    "type": "Electricity",
    "name": "Solar Grid in Paithan"
  },
  {
    "id": "asset-117",
    "lat": 18.75,
    "lng": 73.57,
    "type": "Hospital",
    "name": "Hospital Expansion in Kamshet"
  },
  {
    "id": "asset-131",
    "lat": 18.61,
    "lng": 74.01,
    "type": "Road",
    "name": "Bridge Repair in Wagholi"
  },
  {
    "id": "asset-155",
    "lat": 19.07,
    "lng": 72.87,
    "type": "Infrastructure",
    "name": "Financial District in Mumbai"
  },
  {
    "id": "asset-156",
    "lat": 21.14,
    "lng": 79.08,
    "type": "Community Center",
    "name": "City Development in Nagpur"
  },

  // Assets for other projects
  {
    "id": "asset-140",
    "lat": 27.17,
    "lng": 78.04,
    "type": "Infrastructure",
    "name": "Heritage Conservation in Agra"
  },
  {
    "id": "asset-145",
    "lat": 25.18,
    "lng": 75.83,
    "type": "School",
    "name": "Engineering College in Kota"
  },
  {
    "id": "asset-148",
    "lat": 24.78,
    "lng": 85.99,
    "type": "Infrastructure",
    "name": "Buddhist Circuit in Gaya"
  },
  {
    "id": "asset-151",
    "lat": 12.30,
    "lng": 76.63,
    "type": "Infrastructure",
    "name": "IT Park in Mysore"
  },
  {
    "id": "asset-159",
    "lat": 13.08,
    "lng": 80.27,
    "type": "Infrastructure",
    "name": "IT Corridor in Chennai"
  },
  {
    "id": "asset-162",
    "lat": 22.57,
    "lng": 88.36,
    "type": "Infrastructure",
    "name": "Smart City Mission in Kolkata"
  },
  {
    "id": "asset-166",
    "lat": 21.17,
    "lng": 72.83,
    "type": "Infrastructure",
    "name": "Textile Zone in Surat"
  },
  {
    "id": "asset-201",
    "lat": 27.10,
    "lng": 93.62,
    "type": "Infrastructure",
    "name": "Border Area Development in Itanagar"
  },
  {
    "id": "asset-204",
    "lat": 26.14,
    "lng": 91.73,
    "type": "Infrastructure",
    "name": "Smart City Initiative in Guwahati"
  },
  {
    "id": "asset-209",
    "lat": 21.25,
    "lng": 81.62,
    "type": "Infrastructure",
    "name": "Steel Plant in Raipur"
  },
  {
    "id": "asset-214",
    "lat": 15.49,
    "lng": 73.82,
    "type": "Infrastructure",
    "name": "Tourism Upgrade in Panaji"
  },
  {
    "id": "asset-217",
    "lat": 28.45,
    "lng": 77.02,
    "type": "Infrastructure",
    "name": "Corporate Complex in Gurgaon"
  },
  {
    "id": "asset-221",
    "lat": 31.10,
    "lng": 77.17,
    "type": "Infrastructure",
    "name": "Hill Station Development in Shimla"
  },
  {
    "id": "asset-225",
    "lat": 28.61,
    "lng": 77.20,
    "type": "Infrastructure",
    "name": "Metro Rail Extension in New Delhi"
  }
];
