%% ENGE 1215 Challenge 4
% <insert e-mails here>

%% Part 1A: Import the menu
MenuData = readmatrix('Challenge4.xlsx');
itemList = MenuData(:,1);
priceList = ManuData(:,3);

%% Part 1B: Enter an Order
o1 = input( "Enter item 1 (1-13): ");
o2 = input( "Enter item 2 (1-13): ");
o3 = input( "Enter item 3 (1-13): ");
o4 = input( "Enter item 4 (1-13): ");
order = [o1 o2 o3 o4];

If any(order < 1) || any(order > 13)
	error( "Enter item numbers from 1 to 13.");

%% Part 2A: Find the four prices
for i = 1:4
	orderPrices(i) = priceList(i);

%% Part 2B: Total cost
totalCost = 0
for i = 1:4
    totalCost = __;               % TODO: add the ith price to the running total
end

% Part 2B: Most expensive item
pricestPrice = orderPrices(1);    % start by assuming item 1 is the priciest
pricestItem = order(1);
for i = 2:4
    if __                         % TODO 2: is this price higher than priciestPrice?
        priciestPrice = __;       % TODO 3: save the new highest price
        priciestItem = __;        % TODO 4: save the matching item number
    end
end

%% Part 3A:
fprintf('your order: %d %d %d %d\n', order);
For i=1-4
	Fprintf ('item %d costs $%.2f\n', order, orderPrices);
End
fprintf('total: $%.2f\n', totalCost);
fprintf('most expensive item: %d ($%.2f)\n', priciestItem, orderPrices);

ReceiptData = table(order', orderPrices 'VariableNames', {'Item', 'Price'});
writetable(ReceiptData, TeamResults.csv); 

%% Part 3B:
Figure;
plot(itemList, priceList, 'filled', 'MarkerFaceColor', 'b'); 
Hold on; 
p=polyfit(itemList, priceList, 1); 
xFit = 1:13;
yFit = polyval(p, xFit);
plot(xFit, yFit, 'red');
plot(order, orderPrices, 'green', 'MarkerSize', 10);
xlabel("items");
ylabe("prices");
title('Campus Cafe Menu Prices');
legend('menu items', 'line of best fit', 'ordered items');
Grid on;
Hold off;

