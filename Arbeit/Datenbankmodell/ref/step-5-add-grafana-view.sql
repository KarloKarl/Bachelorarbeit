CREATE View prophetmaster.dash_values AS
SELECT zr.ZR_ID as ZR_ID ,zr.ZR_BEZ as ZR_BEZ, zw.ZW1_WERT as ZW_WERT, zw.ZW1_UT as ZW_UT
FROM prophetmaster.zrm_zw1 AS zw
LEFT JOIN prophetmaster.zrm_zr AS zr
ON zw.ZRM_ZRID = zr.ZR_ID
;

CREATE View prophetmaster.dash_info AS
SELECT zr.ZR_ID as ZR_ID ,zr.ZR_BEZ as ZR_BEZ, zr.ZR_TYP as ZR_TYP, me.ME_EINHEIT as ME_EINHEIT, zr.ZR_ANLAGEDATUM as ZR_ANLAGEDATUM
FROM prophetmaster.ZRM_ZR as zr
LEFT JOIN prophetmaster.ZRM_ME as me
ON zr.ZRM_MEID = me.ME_ID
;