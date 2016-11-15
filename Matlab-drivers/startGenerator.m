function device = startGenerator()

% --- Agilent 33220A function generator initialization --- %
serialnum = 'MY44019294'; %get it from Agilent IO suite connection expert
%serialnum = 'MY44060125'; %get it from Agilent IO suite connection expert
manufacturer = 'agilent';

h = instrfind('Type', 'fcngen', 'Name', 'fcngen-agilent_33220a');

if isempty(h)
    visaObj = getVisaObject(manufacturer, serialnum);
    device = icdevice('agilent_33220a.mdd', visaObj);    
else
    disconnect(h);
    device = h(1);    
end

connect(device)

end

