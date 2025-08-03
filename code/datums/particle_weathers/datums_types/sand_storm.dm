/particles/weather/sand
	icon_state             = "dot"
	color                  = "#e2deb7"

	count				   = 6000
	position               = generator("box", list(-500,-256,0), list(400,500,0))
	grow			       = list(-0.01,-0.01)
	gravity                = list(0, -10, 4)
	drift                  = generator("circle", 0, 2) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	transform 			   = null // sand is directional - so don't make it "3D"

	//Weather effects, max values
	maxSpawning            = 2500
	minSpawning            = 1000
	wind                   = 2
	spin                   = 0 // explicitly set spin to 0 - there is a bug that seems to carry generators over from old particle effects

/obj/structure/sand
	var/list/diged = list("2" = 0, "1" = 0, "8" = 0, "4" = 0)

/obj/structure/sand/proc/set_diged_ways(dir)
	diged["[dir]"] = world.time + 1 MINUTES
	update_overlays()

/datum/particle_weather/sand_storm
	name = "Sand storm"
	desc = "Sand flying, la la description."
	particleEffectType = /particles/weather/sand
	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/rain)
	indoor_weather_sounds = list(/datum/looping_sound/indoor_rain)
	weather_messages = list("Grains of sand carried by the hit your face.", "The storm is really picking up!")

	minSeverity = 4
	maxSeverity = 100
	maxSeverityChange = 50
	severitySteps = 50
	immunity_type = TRAIT_RAINSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_RAIN
