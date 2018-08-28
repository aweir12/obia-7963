set define off;

SELECT SUBJECT_AREA_NAME, SAW_SRC_PATH, 
'https://analytics.nblenergy.com/analytics/saw.dll?PortalGo\&Action=prompt\&path=' ||
replace(utl_url.escape(SAW_SRC_PATH),'/','%2F') as link,
COUNT(DISTINCT ID) 
FROM PROD_BIPLATFORM.S_NQ_ACCT WHERE 
SAW_SRC_PATH IS NOT NULL AND START_DT > SYSDATE - 365
AND SUBJECT_AREA_NAME NOT IN ('EHS Emissions Analytics', 'GEMS', 'Near Miss Analytics' , 'EHS Observations', 'Allegro International Marketing',
'EHS LDAR Inspections', 'EHS LDAR Leak Reporting', 'PPM', 'WellView', 'FileNet XDocuments', 'Usage Tracking', 'P6Core',
'SOA', 'EHS LDAR Inspections, EHS LDAR Leak Reporting', 'EHS - Stature risk and MOC reporting')
GROUP BY SUBJECT_AREA_NAME, SAW_SRC_PATH, 
'https://analytics.nblenergy.com/analytics/saw.dll?PortalGo&Action=prompt&path=' ||
replace(utl_url.escape(SAW_SRC_PATH),'/','%2F') ORDER BY 4 DESC;