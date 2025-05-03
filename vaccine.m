function [dosage] = vaccine(person, numV)

[rows, cols] = size(person);
dosage = zeros(1, cols);
array = person(1, :);
[sortedArray, index] = sort(array);
counter = 0;

for j=1:length(sortedArray) 
    if(numV == 0)
        break;
    elseif(counter == numV)
        break;
    elseif(counter < numV)
           if(person(2,index(j)) < 2 && (person(3, index(j)) > 21 || person(3, index(j)) == -1))
               dosage(index(j)) = 1;
               counter = counter + 1;
           end
       elseif(person(1,index(j)) == person(1, index(j-1)))
           if(person(2,index(j)) < person(2,index(j-1)))
               dosage(index(j)) = 1;
               dosage(index(j-1)) = 0;
           end
       else
           break;
    end
end
end