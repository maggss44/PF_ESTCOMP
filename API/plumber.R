library(plumber)
library(randomForest)

model <- readRDS("modelo_entrenado.rds")

#* @apiTitle RF API
#* @apiDescription Plumber API for Random Forest model to predict energy required given the parameters given.


#* Returns the expected value of the energy for a set of given machining parameters
#* @param tool Tool used
#* @param cutting_depth_ai Cutting depth
#* @param tool_diameter_d Tool diameter
#* @param diameter_ae Diameter ai
#* @param feed_vel_f Feed velocity
#* @param revol_n Revolutions
#* @param num_of_inserts_ Number of inserts
#* @param feet_per_insert_ Feet per insert
#* @param cut_vel_vc Cutting velocity
#* @param power Power
#* @param time Time
#* @param distance Distance
#* @post energy
function(tool, cutting_depth_ai, tool_diameter_d, diameter_ae, feed_vel_f, 
         revol_n, num_of_inserts_z, feet_per_insert_fz, cut_vel_vc, power, 
         time, distance){
  new_data <- data.frame(tool = as.character(tool),
                         cutting_depth_ai = as.numeric(cutting_depth_ai),
                         tool_diameter_d = as.numeric(tool_diameter_d), 
                         diameter_ae = as.numeric(diameter_ae), 
                         feed_vel_f = as.numeric(feed_vel_f), 
                         revol_n = as.numeric(revol_n), 
                         num_of_inserts_z = as.numeric(num_of_inserts_z),
                         feet_per_insert_fz = as.numeric(feet_per_insert_fz),
                         cut_vel_vc = as.numeric(cut_vel_vc),
                         power = as.numeric(power),
                         time = as.numeric(time),
                         distance = as.numeric(distance)
  )
  prediction <- predict(model, new_data)
  return(prediction)
}