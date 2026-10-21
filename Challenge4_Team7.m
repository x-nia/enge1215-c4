%% ENGE 1215 85166 Challenge 4: Group 7

% hi TA, go check out the repo it has a readme and screenshots of the outputs (ㅅ´ ˘ `)
% thanks alot - whron@vt.edu
% https://github.com/x-nia/enge1215-c4 

%% Part 1A: Import the menu
MenuData = readmatrix('Challenge4.xlsx');
itemList = MenuData(:, 1);
priceList = MenuData(:, 2);

%% Part 1B: Enter an Order

o1 = input( "Enter item 1 (1-13): ");
o2 = input( "Enter item 2 (1-13): ");
o3 = input( "Enter item 3 (1-13): ");
o4 = input( "Enter item 4 (1-13): ");
order = [o1 o2 o3 o4];

if any(order < 1) || any(order > 13)
	error( "Enter item numbers from 1 to 13.");
end
%% Part 2A: Find the four prices
for i = 1:4
	orderPrices(i) = priceList(order(i));
end

%% Part 2B: Total cost
totalCost = 0;
for i = 1:4
   totalCost = totalCost + orderPrices(i);               % TODO: add the ith price to the running total
end

%% Part 2B: Most expensive item
priciestPrice = orderPrices(1);    % start by assuming item 1 is the priciest
pricestItem = order(1);
for i = 2:4
   if orderPrices(i) > priciestPrice                         % TODO 2: is this price higher than priciestPrice?
       priciestPrice = orderPrices(i);       % TODO 3: save the new highest price
       priciestItem = order(i);        % TODO 4: save the matching item number
   end
end

%% Part 3A: print  ||  rewrote this bcz it was a mess and wasnt giving the right result - whron@vt.edu
fprintf('Your order: %d %d %d %d\n', order);
for i = 1:4
    fprintf('Item %d costs $%.2f\n', order(i), orderPrices(i)); %todo 1: item, price
end
fprintf('Total: $%.2f\n', totalCost);                   %todo 2: total
fprintf('Most expensive item: %d ($%.2f)\n', priciestItem, priciestPrice); % TODO 3: item, price

% Part 3A: Save the receipt
ReceiptData = table(order', orderPrices', 'VariableNames', {'Item', 'Price'});
writetable(ReceiptData, 'TeamResults.csv');  % TODO 4: file name


%% Part 3B:
figure;
plot(itemList, priceList, 'bo', 'MarkerFaceColor', 'b'); 
hold on; 
p=polyfit(itemList, priceList, 1); 
xFit = 1:13;
yFit = polyval(p, xFit);
plot(xFit, yFit, 'red');
plot(order, orderPrices, 'green', 'MarkerSize', 10);
xlabel("item numbers");
ylabel("prices");
title('Campus Cafe Menu Prices');
legend('menu items', 'line of best fit', 'ordered items');
grid on;
hold off;



