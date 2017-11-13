
 
  [num,txt,raw]=xlsread('/users/ee/bt/sagarch/Desktop/test.xlsx','A1:I36');
 for i=1:35
    BJP_WB(i)=num(i,1);
     M_BJP_WB(i)=0.05*num(i,7);
    C_BJP_WB(i)=0.15*num(i,8);
B_BJP_WB(i)=0.25*num(i,8);
    H_BJP_WB(i)=BJP_WB(i)-M_BJP_WB(i)-C_BJP_WB(i)-B_BJP_WB(i);
    

    INC_WB(i)=num(i,3);
     M_INC_WB(i)=(num(i,3)*num(i,7))/100;
    C_INC_WB(i)=(num(i,3)*num(i,8))/100;
    H_INC_WB(i)=(num(i,3)*num(i,6))/100;
    B_INC_WB(i)=(num(i,3)*num(i,9))/100;

    cpi_WB(i)=num(i,4);
    C_cpi_WB(i)=0.25*num(i,8);
    B_cpi_WB(i)=0.25*num(i,8);
    M_cpi_WB(i)=.6*cpi_WB(i);
    H_cpi_WB(i)=cpi_WB(i)-M_cpi_WB(i)-B_cpi_WB(i)-C_cpi_WB(i);



AITC_WB(i)=num(i,2);
H_AITC_WB(i)=num(i,6)-H_BJP_WB(i)-H_INC_WB(i)-H_cpi_WB(i);
C_AITC_WB(i)=num(i,6)-C_BJP_WB(i)-C_INC_WB(i)-C_cpi_WB(i);
M_AITC_WB(i)=num(i,6)-M_BJP_WB(i)-M_INC_WB(i)-M_cpi_WB(i);
B_AITC_WB(i)=num(i,6)-B_BJP_WB(i)-B_INC_WB(i)-B_cpi_WB(i);    
    
 end
 

  for i=1:35 
   
 %INC Lost%
 BJP_WB(i)=BJP_WB(i)+.8*.4*H_INC_WB(i)+.8*.05*M_INC_WB(i) + .8*C_INC_WB(i)*((C_BJP_WB(i))/(C_BJP_WB(i)+C_AITC_WB(i)+C_cpi_WB(i))) +.8*B_INC_WB(i)*((B_BJP_WB(i))/(B_BJP_WB(i)+B_cpi_WB(i)+B_AITC_WB(i)))+.2*INC_WB(i)*((BJP_WB(i))/(BJP_WB(i)+cpi_WB(i)+AITC_WB(i)));

 AITC_WB(i)=AITC_WB(i)+.8*.6*H_INC_WB(i) +.8*.8*M_INC_WB(i) +.8*C_INC_WB(i)*((C_AITC_WB(i))/(C_BJP_WB(i)+C_AITC_WB(i)+C_cpi_WB(i))) +.8*B_INC_WB(i)*((B_AITC_WB(i))/(B_BJP_WB(i)+B_cpi_WB(i)+B_AITC_WB(i)))+.2*INC_WB(i)*((BJP_WB(i))/(BJP_WB(i)+cpi_WB(i)+AITC_WB(i)));

 INC_WB(i)=0;

 cpi_WB(i)=100-BJP_WB(i)-AITC_WB(i);
 end
 
