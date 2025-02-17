-- 6. What is the distance between the Paris and Boston offices?
-- To be precise for long distances, the distance in kilometers, as the crow flies, between two points when you have latitude and longitude, is (ACOS(SIN(lat1*PI()/180)*SIN(lat2*PI()/180)+COS(lat1*PI()/180)*COS(lat2*PI()/180)* COS((lon1-lon2)*PI()/180))*180/PI())*60*1.8532
SELECT 
	(ACOS(SIN(ST_Y(paris.officeLocation) * PI() / 180) * SIN(ST_Y(boston.officeLocation) * PI() / 180) +
          COS(ST_Y(paris.officeLocation) * PI() / 180) * COS(ST_Y(boston.officeLocation) * PI() / 180) *
          COS((ST_X(paris.officeLocation) - ST_X(boston.officeLocation)) * PI() / 180)) * 180 / PI()) * 60 * 1.8532 
    AS distance_km
FROM offices paris, offices boston
WHERE paris.city = 'Paris' 
AND boston.city = 'Boston';