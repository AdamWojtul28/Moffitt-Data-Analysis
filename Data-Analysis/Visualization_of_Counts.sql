-- Helps to count the number of treatment plus drug info counts for each possible level of treatment 
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level R1` AS Treatment, COUNT(*) AS Total
									  FROM patientswithdruginfofullinfo
                                      GROUP BY `Level R1`) T2
 WHERE Highest_Level_of_Actionability = 'Level R1'
 ORDER BY Total DESC)
UNION 
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 2B` AS Treatment, COUNT(*) AS Total
									  FROM patientswithdruginfofullinfo
                                      GROUP BY `Level 2B`) T2
 WHERE Highest_Level_of_Actionability = 'Level 2B'
 ORDER BY Total DESC)
UNION
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 3A` AS Treatment, COUNT(*) AS Total
									  FROM patientswithdruginfofullinfo
                                      GROUP BY `Level 3A`) T2
 WHERE Highest_Level_of_Actionability = 'Level 3A'
 ORDER BY Total DESC)
UNION 
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 3B` AS Treatment, COUNT(*) AS Total
									  FROM patientswithdruginfofullinfo
                                      GROUP BY `Level 3B`) T2
 WHERE Highest_Level_of_Actionability = 'Level 3B'
 ORDER BY Total DESC);
 
-- Helps to count the number of treatment plus (reduced) drug info counts for each possible level of treatment 
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level R1` AS Treatment, COUNT(*) AS Total
									  FROM reducedpatientdruginfo
                                      GROUP BY `Level R1`) T2
 WHERE Highest_Level_of_Actionability = 'Level R1'
 ORDER BY Total DESC)
UNION 
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 2B` AS Treatment, COUNT(*) AS Total
									  FROM reducedpatientdruginfo
                                      GROUP BY `Level 2B`) T2
 WHERE Highest_Level_of_Actionability = 'Level 2B'
 ORDER BY Total DESC)
UNION
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 3A` AS Treatment, COUNT(*) AS Total
									  FROM reducedpatientdruginfo
                                      GROUP BY `Level 3A`) T2
 WHERE Highest_Level_of_Actionability = 'Level 3A'
 ORDER BY Total DESC)
UNION 
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 3B` AS Treatment, COUNT(*) AS Total
									  FROM reducedpatientdruginfo
                                      GROUP BY `Level 3B`) T2
 WHERE Highest_Level_of_Actionability = 'Level 3B'
 ORDER BY Total DESC);
 
 -- Helps visualize what genes were mutated as well as which level of treatments was used to treat it
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level R1` AS Treatment, COUNT(*) AS Total
									  FROM patientgenemutationinfo
                                      GROUP BY `Level R1`) T2
 WHERE Highest_Level_of_Actionability = 'Level R1'
 ORDER BY Total DESC)
UNION 
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 2B` AS Treatment, COUNT(*) AS Total
									  FROM patientgenemutationinfo
                                      GROUP BY `Level 2B`) T2
 WHERE Highest_Level_of_Actionability = 'Level 2B'
 ORDER BY Total DESC)
UNION
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 3A` AS Treatment, COUNT(*) AS Total
									  FROM patientgenemutationinfo
                                      GROUP BY `Level 3A`) T2
 WHERE Highest_Level_of_Actionability = 'Level 3A'
 ORDER BY Total DESC)
UNION 
(SELECT T2.Treatment, Highest_Level_of_Actionability AS Level, T2.Total
 FROM actionability_values_table T1, (SELECT `Level 3B` AS Treatment, COUNT(*) AS Total
									  FROM patientgenemutationinfo
                                      GROUP BY `Level 3B`) T2
 WHERE Highest_Level_of_Actionability = 'Level 3B'
 ORDER BY Total DESC);