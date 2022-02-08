function[ vect,count_dea,count_cas,dates,gdeath,gcases,country_l]=earth(covid_data)
[row coln]=size(covid_data);
dates=covid_data(1,3:end)';
dates=dates;
count=unique(covid_data(2:end,1));%countries without repetiton char form
[lm,~]=size(count);
count_vect=cell(1,lm);%objects of each country
for ii=1:lm
    count_vect{ii}=country(count{ii});%object creation for each country
end
for ii=2:row
    data=covid_data(ii,1:end);
    for jj=1:lm
        if isequal(covid_data(ii,1),count(jj))
             insert_data(count_vect{jj},state(data));
        end
    end
end
% deaths and cases per country order is same count varriable
[count_dea,count_cas,country_l]=data_extract(count_vect,covid_data,lm);%country wise deaths
vect=count_vect;
gdeath=zeros(1,coln-2);
gcases=zeros(1,coln-2);
[~,row]=size(count_vect);
for ii=1:row
gdeath(1,:)=gdeath(1,:)+count_dea(ii,:);
gcases(1,:)=gcases(1,:)+count_cas(ii,:);
end
gdeath=gdeath';
end
function [cw_d,cw_c,country_list]=data_extract(count_vect,covid_data,lm)
cd_per=zeros(lm,2);
[~, coln]=size(covid_data);
sd_day=zeros(lm,coln-2);
sc_day=zeros(lm,coln-2);
sc=zeros(1,coln-2);
sd=zeros(1,coln-2);
country_list=cell(1,lm)
for ii=1:lm
    head=count_vect{ii}.head;
    country_list{1,ii}=count_vect{ii}.name;
    while ~isempty(head)
        cur=head;
        size(cur.cases);
        size(sc);
        sc=sc+cur.cases;
        sd=sd+cur.death;
        size(sc);
        head=head.nxt;
    end
    sc_day(ii,1:end)=sc(1:end);
    sd_day(ii,1:end)=sd(1:end);
    sc=zeros(1,coln-2);
    sd=zeros(1,coln-2);
    
end
cw_d=sd_day;
cw_c=sc_day;
end

