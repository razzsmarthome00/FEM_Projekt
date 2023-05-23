function VM = von_mises(stress)
% von_mises calculates the effective stress in every element using the von
% Mises method.
VM = zeros(length(stress(:,1)),1);
    
for el = 1:length(stress(:,1))
        VM(el) = sqrt(stress(el,1).^2 + stress(el,2).^2 + stress(el,3).^2 - stress(el,1).*stress(el,2) - stress(el,1).*stress(el,3) - stress(el,2).*stress(el,3)+ 3.*stress(el,4).^2);
end
end

