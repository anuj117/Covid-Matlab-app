classdef country<handle
    properties
        death
        cases
        head
        name
        stateno
    end
    methods
        function obj=country(st)
            obj.death=[];
            obj.cases=[];
            head=[];
            obj.name=st;
            obj.stateno=0;
        end
        function insert_data(country_obj,state_obj)
            n=length(state_obj.death);
            if isempty(country_obj.death)
            country_obj.death=zeros(1,n);
            country_obj.cases=zeros(1,n);
            end
            if isempty(country_obj.head)
                country_obj.head=state_obj;
                country_obj.death=country_obj.death+state_obj.death;
                country_obj.cases=country_obj.cases+state_obj.cases;
                country_obj.stateno=country_obj.stateno+1;
                return;
            end
            cur=country_obj.head;
            while ~isempty(cur)
                last=cur;
                cur=cur.nxt;
            end
            country_obj.stateno=country_obj.stateno+1;
            last.nxt=state_obj;
            state_obj.prv=last;
            country_obj.death=country_obj.death+state_obj.death;
            country_obj.cases=country_obj.cases+state_obj.cases;
        end
    end
end
          