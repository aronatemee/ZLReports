/* ҩѧ�ƴ��������á�*/
SELECT A.���� AS ��������, A.ҽ������, A.����ʱ��, A.����ҽ��, '��' || RTRIM(TO_CHAR(A.����, 'FM9990.9999'), '.') || '��' AS ������, A.ִ��Ƶ��
, CASE WHEN A.�������� / F.�����װ > 0 THEN RTRIM(TO_CHAR(A.�������� / F.����ϵ��, 'FM9990.9999'), '.') || F.���ﵥλ ELSE TO_CHAR(A.��������, 'FM9990.0999') || H.���㵥λ END AS ����
, RTRIM(TO_CHAR(A.�ܸ�����, 'FM9990.9999'), '.') || F.���ﵥλ AS ����
, B.���� AS ��������, D.NO
, D.�������
FROM (SELECT * FROM ����ҽ����¼ A
WHERE A.������� IN ('5', '6')
AND A.ҽ������ NOT LIKE '%����%'
AND A.����ҽ�� <> 'ϵͳ����Ա'
AND A.ҽ��״̬ = 8
AND A.����ʱ�� BETWEEN to_date('20230401000000', 'yyyy-mm-dd hh24:mi:ss') AND to_date('20230430235959', 'yyyy-mm-dd hh24:mi:ss')) A
JOIN ���ű� B ON A.��������ID = B.ID
JOIN ҩƷ�շ���¼ D ON D.ҽ��ID = A.ID
JOIN ҩƷĿ¼ E ON D.ҩƷID = E.ҩƷid
JOIN ҩƷ��� F ON E.ҩƷid = F.ҩƷID
JOIN �շ���ĿĿ¼ H ON D.ҩƷID = H.ID
AND D.NO IN (
select ZZ.NO from ����ҽ������ ZZ
where zz.ҽ��id in (
WITH temp_1 as (
SELECT A.������ĿID, A.ID AS ҽ��ID
FROM ����ҽ����¼ A 
WHERE A.������� IN ('5', '6')
AND A.ҽ������ NOT LIKE '%����%'
AND A.����ҽ�� <> 'ϵͳ����Ա'
AND A.ҽ��״̬ = 8
AND A.����ʱ�� BETWEEN to_date('20230401000000', 'yyyy-mm-dd hh24:mi:ss') AND to_date('20230430235959', 'yyyy-mm-dd hh24:mi:ss')
)
, temp_2 as (
select G.ҩ��ID from ҩƷ���� G 
where G.������ = 1
)
select TEMP_1.ҽ��ID from temp_1
join temp_2 on temp_1.������ĿID = TEMP_2.ҩ��ID
)
)
--���ٲ���Ҫ�� order by ������Ч�ʣ������ﲻ�ò�����
ORDER BY D.NO
