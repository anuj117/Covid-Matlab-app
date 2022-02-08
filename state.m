classdef state<handle
properties
    death
    cases
    name
    country
    nxt
    prv
end
methods
    function obj=state(data)
        nxt=[];
        prv=[];
        obj.name=data{2};
        obj.country=data{1};
        [~,len]=size(data);
        len=len-2;
        d=zeros(1,len);
        c=zeros(1,len);
        for ii=1:len
            c(ii)=data{ii+2}(1);
            d(ii)=data{ii+2}(2);
            
        end
        obj.death=d;
        obj.cases=c;
    end
end
end