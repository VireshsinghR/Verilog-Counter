module UP_DOWN_COUNTER(en, out, clk, rst, preset, oe, ud);
input en,clk,rst,preset,oe,ud; //oe--> odd/even, ud--> up/down, oe--> output enable
output reg [3:0]out;
reg [3:0]count=0000;
reg [3:0]tempcountpre,tempcountup,tempcountdown;


always @ (posedge clk or negedge rst)
begin
	if(!en)
	count<= 4'bxxxx;
		else if(!rst)
		count<=0000;
			else if (preset)
			tempcountpre<=1010;
			
				else if (ud1 & oe)
				begin if (count[0]==1) tempcountup <=count+1; else count[0]<= 1'b1; end
					
					else if (ud==1 &  oe==0) 
					begin if (count[0]==0) count<=count+2; else  count<= count + 0001; end 
						
						else if (ud==0 & oe==1)
						begin if(count[0]==1) tempcountdown<=count-0001; else count<= count - 0001; end
							
							else if (ud==0 & oe==0)
								begin if (count[0]==0)count<=count- 0010; else count[0]<= 1'b0; end
									else 
									out<=0000;
end

always @	(tempcountup)
			count<=count+2;

always @	(tempcountdown)
			count<=count-2;
			
always @ (tempcountpre)
	begin
			if(ud==1)
			count<=count+1;
			else 
			count<=count-1;
	end
always @ (count)
			out<=count;
endmodule
