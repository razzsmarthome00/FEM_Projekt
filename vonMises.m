function v = vonMises(stress)
v = zeros(length(stress),1);
for i=1:length(stress(:,1))
    v(i)=sqrt(stress(i,1)^2+stress(i,2)^2+3*stress(i,4)^2-stress(i,1)*stress(i,2));
end
end

