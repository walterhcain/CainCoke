Config = Config or {}

Config.DrugRepRequired = 500
Config.WaitMin = 5400000
Config.WaitMax = 9000000
Config.CokePrice = 50000


Config.Locations = {
	--Island
	[1] = {
		shop = {
			coords = vector4(4923.62,-5244.9,1.52,8.21),
			model = "g_m_m_mexboss_02",
			gun = "WEAPON_MICROSMG",
		},
		thug1 = {
			coords = vector4(4920.0,-5233.56,1.52,82.53),
			model = "a_m_y_mexthug_01",
			gun = "WEAPON_MICROSMG",
		},
		thug2 = {
			coords = vector4(4925.97,-5241.87,1.54,118.62),
			model = "a_m_y_mexthug_01",
			gun = "WEAPON_MACHETE",
		},
		thug3 = {
			coords = vector4(4916.37,-5236.18,1.52,0.5),
			model = "g_m_y_mexgoon_01",
			gun = "WEAPON_MICROSMG",
		},
		thug4 = {
			coords = vector4(4922.85,-5238.82,1.52,63.53),
			model = "g_m_y_mexgoon_01",
			gun = "WEAPON_MICROSMG",
		},
		boat = {
			coords = nil,
			model = ""
		}
	},
	--East
	[2] = {
		shop = {
			coords = vector4(3068.05,2133.0, 1.91,249.53),
			model = "g_m_m_mexboss_02",
			gun = "WEAPON_MACHETE",
		},
		thug1 = {
			coords = vector4(3069.53, 2135.3, 2.01, 187.66),
			model = "a_m_y_mexthug_01",
			gun = "WEAPON_MICROSMG",
		},
		thug2 = {
			coords = vector4(3075.15,2128.74, 1.08,246.23),
			model = "a_m_y_mexthug_01",
			gun = "WEAPON_MACHETE",
		},
		thug3 = {
			coords = vector4(3068.13, 2117.16, 0.77, 236.45),
			model = "g_m_y_mexgoon_01",
			gun = "WEAPON_MICROSMG",
		},
		thug4 = {
			coords = vector4(3068.5,2128.34,1.62, 243.99),
			model = "g_m_y_mexgoon_01",
			gun = "WEAPON_MICROSMG",
		},
		boat = {
			coords = vector4(3058.9, 2100.74,1.54,180.72),
			model = "tropic"
		}
	},
	--North
	[3] = {
		shop = {
			coords = vector4(-1365.87, 5241.88, 5.93, 78.11),
			model = "g_m_m_mexboss_02",
			gun = "WEAPON_MACHETE",
		},
		thug1 = {
			coords = vector4(-1367.51,5244.22,5.71, 156.38),
			model = "a_m_y_mexthug_01",
			gun = "WEAPON_MICROSMG",
		},
		thug2 = {
			coords = vector4(-1364.72, 5235.11,6.13,61.53),
			model = "a_m_y_mexthug_01",
			gun = "WEAPON_MACHETE",
		},
		thug3 = {
			coords = vector4(-1379.23,5237.19,4.98,4.97),
			model = "g_m_y_mexgoon_01",
			gun = "WEAPON_MICROSMG",
		},
		thug4 = {
			coords = vector4(-1393.06,5254.66,1.4,118.73),
			model = "g_m_y_mexgoon_01",
			gun = "WEAPON_MICROSMG",
		},
		boat = {
			coords = vector4(-1407.79,5247.98,0.78,327.11),
			model = "tropic"
		}
	},
	--West
	[4] = {
		shop = {
			coords = vector4(-1879.7,-2833.36,3.34, 156.85),
			model = "g_m_m_mexboss_02",
			gun = "WEAPON_MACHETE",
		},
		thug1 = {
			coords = vector4(-1893.95,-2843.99,0.7,5.59),
			model = "a_m_y_mexthug_01",
			gun = "WEAPON_MICROSMG",
		},
		thug2 = {
			coords = vector4(-1877.96,-2835.05,3.47,95.97),
			model = "a_m_y_mexthug_01",
			gun = "WEAPON_MACHETE",
		},
		thug3 = {
			coords = vector4(-1881.4,-2844.24,3.29,56.54),
			model = "g_m_y_mexgoon_01",
			gun = "WEAPON_MICROSMG",
		},
		thug4 = {
			coords = vector4(-1881.02,-2829.62,3.03,68.08),
			model = "g_m_y_mexgoon_01",
			gun = "WEAPON_MICROSMG",
		},
		boat = {
			coords = vector4(-1898.01, -2845.65, 1.12, 148.00),
			model = "tropic"
		}
	},
}